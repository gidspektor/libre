from rest_framework_jwt.views import ObtainJSONWebToken, RefreshJSONWebToken
from django.http import HttpResponse
from api.middleware.authentication import JwtAuthentication
import json
from django.contrib.auth.models import User
from api.models import UserSocialLogin


class ObtainJasonWebToken(ObtainJSONWebToken):
  def post(self, request, *args, **kwargs):
    request_json = json.loads(request.body)
    username = request_json.get('username', '')

    user = User.objects.filter(username=username).first()
    has_social_login = UserSocialLogin.objects.filter(user=user).first()

    if has_social_login:
      return HttpResponse(status=400)

    response = super().post(request, *args, **kwargs)

    return response


class RefreshJasonWebToken(RefreshJSONWebToken):
  authentication_classes = (JwtAuthentication,)

  def post(self, request, *args, **kwargs):
    username = request.user

    user = User.objects.filter(username=username).first()
    has_social_login = UserSocialLogin.objects.filter(user=user).first()

    if has_social_login:
      return HttpResponse(status=400)

    response = super().post(request, *args, **kwargs)

    return response