from rest_framework import authentication
import requests
from django.contrib.auth.models import User
from rest_framework_jwt.serializers import VerifyJSONWebTokenSerializer


class JwtAuthentication(authentication.BaseAuthentication, VerifyJSONWebTokenSerializer):
  def authenticate(self, request):
    token = request.META.get('HTTP_AUTHORIZATION', ' ').split(' ')[1]
    data = {'token': token}

    valid_data = VerifyJSONWebTokenSerializer.validate(self, data)
    username = valid_data['user']

    user = User.objects.get(username=username)

    return (user, None)
