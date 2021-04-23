from rest_framework.views import APIView
from datetime import datetime, timedelta
from api.serializers import EventsSerializer, UserEventsAssocSerializer
from api.models import Events
from api.middleware.authentication import JwtAuthentication
from api.views.LocationSearch import LocationDetailMixin
from rest_framework.exceptions import NotFound, PermissionDenied
import operator
from django.db.models import Q
from functools import reduce
from rest_framework.response import Response
from rest_framework import status
from api.tools import sanitize_search_string
from django.core.mail import send_mail


class EventList(APIView, LocationDetailMixin):
  def get_object(self, query):
    return Events.objects.filter(reduce(operator.and_, query))

  def get(self, request, location):
    data = {}
    q_list = [Q(show=1)]
    search_string = sanitize_search_string(location)
    location = LocationDetailMixin.grab_one_location(self, search_string)

    location_string = location.get('location_string', '')
    country_or_city = location.get('country_or_city', '')
    location = location.get('location', '')
    data['location'] = location_string
    date = request.query_params['date']

    if not location:
      raise NotFound('Location not found')

    if date:
      if datetime.strptime(date, '%Y-%m-%d') < datetime.now() - timedelta(days=1):
        raise NotFound('Cant search the past')
      else:   
        q_list.append(Q(date_time__date=datetime.strptime(date, '%Y-%m-%d')))
    else:
      q_list.append(Q(date_time__date__gte=datetime.now()))

    if country_or_city == 'city':
      q_list.append(Q(location__city=location.city.id))
    else:
      q_list.append(Q(location__country=location.country.id))

    events = self.get_object(q_list)

    serializer = EventsSerializer.EventsSerializer(events, many=True)

    data['data'] = serializer.data

    return Response(data, status=status.HTTP_200_OK)

