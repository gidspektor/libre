from rest_framework import serializers
from django.db.models import Sum
from django.utils import timezone
from api.models import UserEventsAssoc, Events


class UserEventsAssocSerializer(serializers.ModelSerializer):
  class Meta:
    model = UserEventsAssoc
    fields = ['event', 'user', 'quantity']

  def create(self, validated_data):
    event = validated_data.get('event')
    event_object = Events.objects.get(id=event.id)
    max_tickets = event.location.capacity
    event.tickers_bought = validated_data.get('quantity')

    number_of_tickets_bought = UserEventsAssoc.objects.filter(event_id=event_object.id).aggregate(Sum('quantity'))

    if max_tickets == number_of_tickets_bought.get('quantity__sum', 0):
      event_object.sold_out = True

    event_object.save()

    return UserEventsAssoc.objects.create(**validated_data)

  def validate_quantity(self, value):
    event_id = self.context.get('request', '').get('event', '')
    user_id = self.context.get('request', '').get('user', '')
    event = Events.objects.get(id=event_id)
    max_tickets = event.location.capacity

    number_of_tickets_bought = UserEventsAssoc.objects.filter(event_id=event_id).aggregate(Sum('quantity'))

    if number_of_tickets_bought.get('quantity__sum', 0):
      if number_of_tickets_bought.get('quantity__sum', 0) + int(value) > max_tickets:
        raise serializers.ValidationError('Invalid amount')

    tickets_user_bought = UserEventsAssoc.objects.filter(event_id=event_id, user_id=user_id)

    if tickets_user_bought:
      if len(tickets_user_bought) >= 2:
        raise serializers.ValidationError('Invalid amount')

    return value

  def to_representation(self, instance):
    future_events = ''
    past_events = ''

    if instance.event.date_time >= timezone.now():
      future_events = instance.event.name
    else:
      past_events = instance.event.name

    response_dict = {
      'past_events': past_events,
      'future_events': future_events
    }

    return response_dict
