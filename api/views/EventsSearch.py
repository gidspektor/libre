from rest_framework.views import APIView
import datetime
from api.models import Events
from django.http import JsonResponse
from collections import OrderedDict
import operator
from django.db.models import Q
from django.core import serializers
from functools import reduce

class EventsListView(APIView):
    date_range = ''
    grab_all_events = False

    def get(self, request, country):
        date_range = request.GET.get('dates', '')
        city = request.GET.get('city', '')
        q_list = [Q(location_id__country__country__icontains=country)]

        if city:
            q_list.append(Q(location_id__city__city__icontains=city))

        if not self.grab_all_events and date_range:
            q_list.append(Q(date_time=date_range))

        events = Events.objects.filter(reduce(operator.and_, q_list))

        response_dict = {}

        for event in events:
            response_dict[event.id] = {
                'name': event.name,
                'city': event.location.city.city,
                'country': event.location.country.country,
                'capacity': event.location.capacity,
                'allows_own_drinks': event.location.allows_own_drinks,
                'image': event.location.image,
                'description': event.description,
                'date_time': event.date_time
            }

        data = {'results': sorted(response_dict.values(), key=operator.itemgetter('date_time'))}

        return JsonResponse(data)


class LatestEvents(EventsListView):
    grab_all_events = True

