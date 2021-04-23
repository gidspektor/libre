from rest_framework import serializers
from api.models import Events

class EventsSerializer(serializers.ModelSerializer):

  class Meta:
    model = Events
    fields = ['location', 'date_time']

  def to_representation(self, instance):
    capacity = instance.location.capacity
    tickets_bought = instance.tickets_bought
    tickets_left = capacity - tickets_bought

    response_dict = {
      'name': instance.name,
      'city': instance.location.city.city,
      'country': instance.location.country.country,
      'capacity': instance.location.capacity,
      'allows_own_drinks': instance.location.allows_own_drinks,
      'serves_alcohol': instance.location.serves_alcohol,
      'image': instance.location.image,
      'description': instance.description,
      'date_time': instance.date_time,
      'event_id': instance.id,
      'atl': tickets_left
    }

    return response_dict