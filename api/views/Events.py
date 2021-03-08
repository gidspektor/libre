from rest_framework.views import APIView
import datetime
from api.models import Events, CountriesCities, UserEventsAssoc
from django.http import JsonResponse
from api.middleware.authentication import JwtAuthentication
from collections import OrderedDict
import operator, json
from django.db.models import Q
from api.tools import sanitize_url_string
from django.core import serializers
from django.db.models import Sum
from functools import reduce


class EventsListView(APIView):
  def get(self, request, location):
    date = request.GET.get('date', '')
    search_terms = []
    search_string = sanitize_url_string(location)
    location_string = ''
    q_list = [Q(show=1)]
    found = False

    if '-' in search_string:
      search_terms = search_string.rsplit('-', 1)

    if len(search_terms) > 1 and not search_terms[1].isspace():
      term_one = search_terms[0].replace('-', ' ')
      term_two = search_terms[1].replace('-', ' ')

      location_query = (Q(country__country__icontains=term_one) & Q(city__city__icontains=term_two)) | (Q(country__country__icontains=term_two) & Q(city__city__icontains=term_one))
      location = CountriesCities.objects.filter(location_query).first()

      if location:
        q_list.append(Q(location__city=location.city.id))
        location_string = location.city.city + ', ' + location.country.country
        found = True

    if not found:
      city_search = CountriesCities.objects.filter(Q(city__city__icontains=search_string.replace('-', ' '))).order_by('city__city').first()

      if city_search:
        q_list.append(Q(location__city=city_search.city.id))
        location_string = city_search.city.city + ', ' + city_search.country.country
        found = True
      else:
        country_search = CountriesCities.objects.filter(Q(country__country__icontains=search_string.replace('-', ' '))).first()
        if country_search:
          q_list.append(Q(location__country=country_search.country.id))
          location_string = country_search.country.country
          found = True

    if date:
      q_list.append(Q(date_time__date=datetime.datetime.strptime(date, '%Y-%m-%d')))

    if found:
      events = Events.objects.filter(reduce(operator.and_, q_list))
    else:
      return JsonResponse({'error': "Couldn't find a location with that name."})

    response_dict = {}

    for event in events:
      response_dict[event.id] = {
        'name': event.name,
        'city': event.location.city.city,
        'country': event.location.country.country,
        'capacity': event.location.capacity,
        'allows_own_drinks': event.location.allows_own_drinks,
        'serves_alcohol': event.location.serves_alcohol,
        'image': event.location.image,
        'description': event.description,
        'date_time': event.date_time,
        'event_id': event.id
      }

    data = {
      'results': sorted(response_dict.values(), key=operator.itemgetter('date_time')),
      'location': location_string
    }

    return JsonResponse(data)


class EventTicketPurchaseView(APIView):
  authentication_classes = (JwtAuthentication,)

  def post(self, request):
    error = ''
    request_json = json.loads(request.body)

    token_user_email = request.user.email
    request_user_email = request_json.get('user_info').get('email', '')
    card_number = request_json.get('card_number', '')
    csv_code = request_json.get('csv', '')
    expiry_month = request_json.get('expiry_month', '')
    expiry_year = request_json.get('expiry_year', '')
    ticket_quantity = request_json.get('quantity', '')
    event_id = request_json.get('event_id', '')

    data_is_valid = [
      len(card_number) == 16,
      card_number.isnumeric(),
      len(csv_code) == 3,
      csv_code.isnumeric(),
      len(expiry_month) == 2,
      expiry_month.isnumeric(),
      len(expiry_year) == 2,
      expiry_year.isnumeric(),  
      int(ticket_quantity) <= 2,
      isinstance(event_id, int)
    ]

    if token_user_email != request_user_email:
      error = 'Invalid request'

    if not all(data_is_valid):
      error = 'Invalid data'

    event = Events.objects.get(id=event_id)
    max_tickets = event.location.capacity

    number_of_tickets_bought = UserEventsAssoc.objects.filter(event=event).aggregate(Sum('quantity'))

    if number_of_tickets_bought.get('quantity__sum', 0):
      if number_of_tickets_bought.get('quantity__sum', 0) + int(ticket_quantity) > max_tickets:
        error = 'Invalid amount'
    
    if event.sold_out:
      error = 'Sold out'

    # card payment functionality would go here with a fail condition.

    if not error:
      UserEventsAssoc.objects.create(
        user=request.user,
        event=event,
        quantity=int(ticket_quantity)
      ).save()

      number_of_tickets_bought = UserEventsAssoc.objects.filter(event=event).aggregate(Sum('quantity'))

      if max_tickets == number_of_tickets_bought.get('quantity__sum', 0):
        event.sold_out = True

      return JsonResponse({'success': True})
    else:
      return JsonResponse({'error': error})
