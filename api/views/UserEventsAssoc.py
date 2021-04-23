from rest_framework.views import APIView
from api.serializers import UserEventsAssocSerializer
from api.middleware.authentication import JwtAuthentication
from rest_framework.exceptions import PermissionDenied
from rest_framework.response import Response
from rest_framework import status
from django.core.mail import send_mail
from api.models import UserEventsAssoc


class UserEventsAssocList(APIView):
  authentication_classes = (JwtAuthentication,)

  def get_object(self, pk):
    return UserEventsAssoc.objects.filter(
      user=pk,
    )

  def get(self, request):
    user_info = self.get_object(request.user)
    serializer = UserEventsAssocSerializer.UserEventsAssocSerializer(user_info, many=True)

    events = {
      'past_events': [],
      'future_events': []
    }

    for item in serializer.data:
      events['past_events'].append(item['past_events'])
      events['future_events'].append(item['future_events'])

    return Response(events, status=status.HTTP_200_OK)


class UserEventsAssocDetail(APIView):
  authentication_classes = (JwtAuthentication,)

  def post(self, request):
    if request.user.email != request.data['email']:
      raise PermissionDenied

    # data_is_valid = [
    #   len(card_number) == 16,
    #   card_number.isnumeric(),
    #   len(csv_code) == 3,
    #   csv_code.isnumeric(),
    #   len(expiry_month) == 2,
    #   expiry_month.isnumeric(),
    #   len(expiry_year) == 2,
    #   expiry_year.isnumeric(),  
    #   int(ticket_quantity) <= 2,
    #   isinstance(event_id, int)
    # ]

    # # card payment functionality would go here.

    context = {
      'request': request.data
    }
    serializer = UserEventsAssocSerializer.UserEventsAssocSerializer(data=request.data, context=context)

    if serializer.is_valid():
      serializer.save()
      return Response(serializer.data, status=status.HTTP_201_CREATED)
      #   send_mail(
      #     'Libre',
      #     'Hi {} your ticket to {} is attached.'.format(request.user.first_name, event.name),
      #     'tickets@libre.com',
      #     [request.user.email],
      #     fail_silently=False,
      #   )

    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

