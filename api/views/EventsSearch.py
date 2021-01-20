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
    def get(self, request, location):
        date = request.GET.get('date', '')
        city = request.GET.get('city', '')
        q_list = [Q(location_id__country__country__icontains=country)]
        q_list.append(Q(show=1))

        if city:
            q_list.append(Q(location_id__city__city__icontains=city))

        if date:
            q_list.append(Q(date_time__date=datetime.datetime.strptime(date, '%Y-%m-%d')))

        events = Events.objects.filter(reduce(operator.and_, q_list))

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
                'date_time': event.date_time
            }

        data = {'results': sorted(response_dict.values(), key=operator.itemgetter('date_time'))}

        return JsonResponse(data)
