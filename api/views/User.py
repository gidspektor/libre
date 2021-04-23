from rest_framework.views import APIView
from datetime import datetime
import api.config as config
from google.oauth2 import id_token
from rest_framework import permissions
from django.http import JsonResponse
from api.middleware.authentication import JwtAuthentication
from rest_framework.exceptions import NotFound, PermissionDenied
from google.auth.transport import requests
from rest_framework.response import Response
from rest_framework import status
import re, json, random
from django.contrib.auth.models import User
from api.models import UserEventsAssoc, UserPosts, UserSocialLogin
from api.serializers import UserSerializer


class UserDetail(APIView):
  google_sign_up = False

  def post(self, request):
    password = ''

    if self.google_sign_up:
      try:
        idinfo = id_token.verify_oauth2_token(request.data['token'], requests.Request(), config.GOOGLE_CLIENT_ID)
        gmail_id = idinfo['sub']

        user_already_exists = User.objects.filter(username=gmail_id).first()

        if user_already_exists:
          return Response(status=status.HTTP_200_OK)
        else:
          request.data['name'] = idinfo['name']
          request.data['email'] = idinfo['email']
          password = str(random.getrandbits(128))
          password_confirm = password
          request.data['password'] = password
          request.data['username'] = gmail_id
      except ValueError:
        raise PermissionDenied
    else:
      password = request.data['password']
      password_confirm = request.data['password_confirm']
      request.data['email'] = re.sub(r"[^a-zA-Z0-9@.]", '', request.data['email']).strip()
      request.data['username'] = request.data['email']

      if password != password_confirm:
        raise ValueError('Passwords do not match.')

    name = re.sub(r"[^a-zA-Z' ]", '', request.data['name']).split(' ', 1)
    request.data['first_name'] = name[0].strip()
    request.data['last_name'] = name[1].strip()

    context = {
      'social_signup': self.google_sign_up
    }
    serializer = UserSerializer.UserSerializer(data=request.data, context=context)

    if serializer.is_valid():
      serializer.save()
      return Response(status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

  def get(self, request):
    response_dict = {
      'user': {
        'id': request.user.id,
        'email': request.user.email,
        'first_name': request.user.first_name,
        'last_name': request.user.last_name,
      }
    }

    return Response(response_dict, status=status.HTTP_200_OK)


class UserInfo(UserDetail):
  authentication_classes = (JwtAuthentication,)


class GoogleLoginSignUp(UserDetail):
  google_sign_up = True
