from rest_framework.views import APIView
import datetime
from api.models import Events, Countries_cities
from django.http import JsonResponse
from collections import OrderedDict
import operator
from django.db.models import Q
from api.tools import sanitize_string
from django.core import serializers
from functools import reduce


class EventsListView(APIView):
  def get(self, request, location):
    date = request.GET.get('date', '')
    search_terms = []
    search_string = sanitize_string(location)
    location_string = ''
    q_list = [Q(show=1)]
    found = False

    if '-' in search_string:
      search_terms = search_string.rsplit('-', 1)

    if len(search_terms) > 1 and not search_terms[1].isspace():
      term_one = search_terms[0].replace('-', ' ')
      term_two = search_terms[1].replace('-', ' ')

      location_query = (Q(country__country__icontains=term_one) & Q(city__city__icontains=term_two)) | (Q(country__country__icontains=term_two) & Q(city__city__icontains=term_one))
      location = Countries_cities.objects.filter(location_query).first()

      if location:
        q_list.append(Q(location__city=location.city.id))
        location_string = location.city.city + ', ' + location.country.country
        found = True

    if not found:
      city_search = Countries_cities.objects.filter(Q(city__city__icontains=search_string.replace('-', ' '))).order_by('city__city').first()

      if city_search:
        q_list.append(Q(location__city=city_search.city.id))
        location_string = city_search.city.city + ', ' + city_search.country.country
        found = True
      else:
        country_search = Countries_cities.objects.filter(Q(country__country__icontains=search_string.replace('-', ' '))).first()
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
