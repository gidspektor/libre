from rest_framework.views import APIView
from rest_framework import permissions
from django.http import JsonResponse
from api.middleware.authentication import JwtAuthentication
import re, json
from django.contrib.auth.models import User


class CreateUserView(APIView):
  def post(self,request):
    request_json = json.loads(request.body)
    error = ''
    name = request_json.get('name', '')
    email = request_json.get('email', '')
    password = request_json.get('password', '')
    password_confirm = request_json.get('password_confirm', '')

    if not any([name, email, password, password_confirm]):
      return JsonResponse({'error': 'Missing values'})

    name = re.sub(r"[^a-zA-Z0-9' ]", '', name).split(' ', 1)

    first_name = name[0].strip()
    last_name = name[1].strip()
    email = re.sub(r"[^a-zA-Z0-9@.]", '', email).strip()

    if len(password) < 8:
      error = 'Make sure your password is at least 8 letters'
    elif password != password_confirm:
      error = 'Passwords dont match'

    user_already_exists = User.objects.get(email=email).first()

    if user_already_exists:
      error = 'User already exists with that email.'

    if not error:
      new_user = User.objects.create_user(
        first_name=first_name,
        last_name=last_name,
        username=email,
        email=email
      )
      new_user.set_password(password)
      new_user.save()

      return JsonResponse({'success': True})
    else:
      return JsonResponse({'error': error})


class UserView(APIView):
  authentication_classes = (JwtAuthentication,)

  def get(self, request):
    return JsonResponse({'user': {
      'id': request.user.id,
      'email': request.user.email,
      'first_name': request.user.first_name,
      'last_name': request.user.last_name
    }})
