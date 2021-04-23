from rest_framework.views import APIView
from api.models import CountriesCities
from django.views.generic.detail import DetailView
from django.http import JsonResponse
import operator
from django.db.models import Q
from api.tools import sanitize_search_string


class LocationListView(APIView):
  def get(self, request, search_string):
    search_terms = []
    search_string = sanitize_search_string(search_string)
    found = False

    if '-' in search_string:
      search_terms = search_string.rsplit('-', 1)

    if len(search_terms) > 1 and not search_terms[1].isspace():
      term_one = search_terms[0].replace('-', ' ')
      term_two = search_terms[1].replace('-', ' ')

      query = (Q(country__country__icontains=term_one) & Q(city__city__icontains=term_two)) | (Q(country__country__icontains=term_two) & Q(city__city__icontains=term_one))

      locations = CountriesCities.objects.filter(query)

      if locations.count():
        found = True

    if not found:
      query = Q(country__country__icontains=search_string.replace('-', ' ')) | Q(city__city__icontains=search_string.replace('-', ' '))
      locations = CountriesCities.objects.filter(query)

    response = {}

    for location in locations:
      response[location.city.id] = {
        'city': location.city.city,
        'country': location.country.country
      }

    data = {'results': sorted(response.values(), key=operator.itemgetter('city'))}

    return JsonResponse(data)


class LocationDetailMixin(DetailView):
  def grab_one_location(self, search_string):
    found = False
    location = ''
    location_string = ''
    country_or_city = ''
    search_term = []

    if '-' in search_string:
      search_term = search_string.rsplit('-', 1)

    if len(search_term) > 1 and not search_term[1].isspace():
      term_one = search_term[0].replace('-', ' ')
      term_two = search_term[1].replace('-', ' ')

      location_query = (Q(country__country__icontains=term_one) & Q(city__city__icontains=term_two)) | (Q(country__country__icontains=term_two) & Q(city__city__icontains=term_one))
      location = CountriesCities.objects.filter(location_query).first()

      if location:
        country_or_city = 'city'
        location_string = location.city.city + ', ' + location.country.country
        found = True

    if not found:
      city_search = CountriesCities.objects.filter(Q(city__city__icontains=search_string.replace('-', ' '))).order_by('city__city').first()

      if city_search:
        country_or_city = 'city'
        location_string = city_search.city.city + ', ' + city_search.country.country
        location = city_search
      else:
        country_search = CountriesCities.objects.filter(Q(country__country__icontains=search_string.replace('-', ' '))).first()
        if country_search:
          country_or_city = 'country'
          location_string = country_search.country.country
          location = country_search

    return {
      'location': location,
      'location_string': location_string,
      'country_or_city': country_or_city
    }