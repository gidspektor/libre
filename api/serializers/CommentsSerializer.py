from rest_framework import serializers
from api.models import UserComments
from django.contrib.auth.models import User


class CommentsSerializer(serializers.ModelSerializer):
  comment = serializers.CharField()

  class Meta:
    model = UserComments
    fields = ['comment', 'user', 'date_time', 'post']
    extra_kwargs = {
      'comment': {'required': True},
      'user': {'required': True},
      'post': {'required': True},
    }
  
  def to_representation(self, instance):
    response_dict = {
      'comment': instance.comment,
      'location': instance.post.city.city,
      'user_name': instance.user.first_name,
      'id': instance.id,
      'date_time': instance.date_time,
      'post': {
        'title': instance.post.title,
        'location': instance.post.city.city,
        'description': instance.post.description,
        'user_name': instance.post.user.first_name,
        'date_time': instance.post.date_time,
        'id': instance.post.id
      }
    }

    return response_dict

