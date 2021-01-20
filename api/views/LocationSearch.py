from rest_framework.views import APIView
import datetime
from api.models import Countries_cities
from django.http import JsonResponse
from collections import OrderedDict
import operator
from django.db.models import Q
from django.core import serializers
from functools import reduce

class PartialSearchView(APIView):
    def get(self, request, search_string):
        locations = Countries_cities.objects.filter(
            Q(country__country__icontains=search_string) | Q(city__city__icontains=search_string)
        )

        response = {}

        for location in locations:
            response[location.city.id] = {
                'city': location.city.city,
                'country': location.country.country
            }

        data = {'results': sorted(response.values(), key=operator.itemgetter('city'))}

        return JsonResponse(data)