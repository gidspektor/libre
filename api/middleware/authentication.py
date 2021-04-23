from rest_framework import authentication
import api.config as config
from google.oauth2 import id_token
from google.auth.transport import requests
from django.contrib.auth.models import User
from rest_framework_jwt.serializers import VerifyJSONWebTokenSerializer
import jwt


class JwtAuthentication(authentication.BaseAuthentication, VerifyJSONWebTokenSerializer):
  def authenticate(self, request):
    token = request.META.get('HTTP_AUTHORIZATION', ' ').split(' ')[1]
    data = {'token': token}

    try:
      valid_data = VerifyJSONWebTokenSerializer.validate(self, data)
      username = valid_data['user']
    except jwt.exceptions.InvalidAlgorithmError:
      idinfo = id_token.verify_oauth2_token(token, requests.Request(), config.GOOGLE_CLIENT_ID)
      username = idinfo['sub']

    user = User.objects.filter(username=username).first()

    if user:
      request.data['user'] = user.id
      return (user, None)
