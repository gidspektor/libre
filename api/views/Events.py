from rest_framework.views import APIView
from datetime import datetime, timedelta
from api.models import Events, CountriesCities, UserEventsAssoc
from django.http import JsonResponse
from api.middleware.authentication import JwtAuthentication
from collections import OrderedDict
import operator, json
from django.db.models import Q
from api.views.LocationSearch import LocationDetailView
from api.tools import sanitize_search_string
from django.core import serializers
from django.core.mail import send_mail
from django.db.models import Sum
from functools import reduce


class EventView(APIView, LocationDetailView):
  def get_events(self, request, location):
    error = ''
    date = request.GET.get('date', '')
    search_string = sanitize_search_string(location)
    location_string = ''
    q_list = [Q(show=1)]

    location = LocationDetailView.grab_one_location(self, search_string)

    if date:
      if datetime.strptime(date, '%Y-%m-%d') < datetime.now() - timedelta(days=1):
        error = 'Cant search the past'
      else:
        q_list.append(Q(date_time__date=datetime.strptime(date, '%Y-%m-%d')))
    else:
      q_list.append(Q(date_time__date__gte=datetime.now()))

    if location.get('location', ''):
      location_string = location.get('location_string')

      if location.get('country_or_city', '') == 'city':
        q_list.append(Q(location__city=location.get('location').city.id))
      else:
        q_list.append(Q(location__country=location.get('location').country.id))

      events = Events.objects.filter(reduce(operator.and_, q_list))
    else:
      error = 'Couldn\'t find a location with that name.'

    if not error:
      response_dict = {}

      for event in events:
        capacity = event.location.capacity
        tickets_bought = event.tickets_bought
        tickets_left = capacity - tickets_bought

        response_dict[event.id] = {
          'name': event.name,
          'city': event.location.city.city,
          'country': event.location.country.country,
          'capacity': capacity,
          'allows_own_drinks': event.location.allows_own_drinks,
          'serves_alcohol': event.location.serves_alcohol,
          'image': event.location.image,
          'description': event.description,
          'date_time': event.date_time,
          'event_id': event.id,
          'atl': tickets_left
        }

      return {
        'results': sorted(response_dict.values(), key=operator.itemgetter('date_time')),
        'location': location_string
      }
    else:
      return {'error': error}


class EventsListView(EventView):
  def get(self, request, location):
    data = self.get_events(request, location)

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

    tickets_user_bought = UserEventsAssoc.objects.filter(event=event, user=request.user).first()

    if tickets_user_bought:
      if tickets_user_bought.quantity >= 2:
        error = 'Invalid amount'

    # card payment functionality would go here with a fail condition.

    if not error:
      UserEventsAssoc.objects.create(
        user=request.user,
        event=event,
        quantity=int(ticket_quantity)
      ).save()

      event.tickets_bought += int(ticket_quantity)
      event.save()

      number_of_tickets_bought = UserEventsAssoc.objects.filter(event=event).aggregate(Sum('quantity'))

      if max_tickets == number_of_tickets_bought.get('quantity__sum', 0):
        event.sold_out = True

      send_mail(
        'Libre',
        'Hi {} your ticket to {} is attached.'.format(request.user.first_name, event.name),
        'tickets@libre.com',
        [request.user.email],
        fail_silently=False,
      )

      return JsonResponse({'success': True})
    else:
      return JsonResponse({'error': error})
