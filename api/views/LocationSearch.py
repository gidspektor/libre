from rest_framework.views import APIView
from api.models import Countries_cities
from django.http import JsonResponse
import operator
from django.db.models import Q
from api.tools import sanitize_string

class PartialSearchView(APIView):
    def get(self, request, search_string):
        search_terms = []
        search_string = sanitize_string(search_string)

        if '-' in search_string:
            search_terms = search_string.rsplit('-', 1)

        if len(search_terms) > 1 and not search_terms[1].isspace():
            term_one = search_terms[0].replace('-', ' ')
            term_two = search_terms[1].replace('-', ' ')

            query = (Q(country__country__icontains=term_one) & Q(city__city__icontains=term_two)) | (Q(country__country__icontains=term_two) & Q(city__city__icontains=term_one))

            locations = Countries_cities.objects.filter(query)

            if locations.count() == 0:
                locations = Countries_cities.objects.filter(Q(city__city__icontains=term_two) | Q(city__city__icontains=term_one))
        else:
            query = Q(country__country__icontains=search_string) | Q(city__city__icontains=search_string)
            locations = Countries_cities.objects.filter(query)

        response = {}

        for location in locations:
            response[location.city.id] = {
                'city': location.city.city,
                'country': location.country.country
            }

        data = {'results': sorted(response.values(), key=operator.itemgetter('city'))}

        return JsonResponse(data)