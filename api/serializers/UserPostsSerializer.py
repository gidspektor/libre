from rest_framework import serializers
from api.models import UserPosts


class UserPostsSerializer(serializers.ModelSerializer):
  title = serializers.CharField(required=True)
  description = serializers.CharField(required=True, min_length=50)
  date_time = serializers.DateTimeField(read_only=False, required=False)

  class Meta:
    model = UserPosts
    fields = ['user', 'title', 'description', 'city', 'date_time', 'id']
    extra_kwargs = {
      'user': {'required': True},
      'city': {'required': True}
    }

  def to_representation(self, instance):
    response_dict = {
      'title': instance.title,
      'description': instance.description,
      'location': instance.city.city,
      'user_name': instance.user.first_name,
      'id': instance.id,
      'date_time': instance.date_time
    }

    return response_dict
