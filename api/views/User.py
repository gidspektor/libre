from rest_framework.views import APIView
from datetime import datetime
from rest_framework import permissions
from django.http import JsonResponse
from api.middleware.authentication import JwtAuthentication
import re, json
from django.contrib.auth.models import User
from api.models import UserEventsAssoc, UserPostCommentsAssoc, UserPosts


class UserView(APIView):
  def create_user(self, request):
    request_json = json.loads(request.body)
    error = ''
    name = request_json.get('name', '')
    email = request_json.get('email', '')
    password = request_json.get('password', '')
    password_confirm = request_json.get('password_confirm', '')

    if not any([name, len(name.split(' ')) > 1, email, password, password_confirm]):
      return JsonResponse({'error': 'Missing values'})

    name = re.sub(r"[^a-zA-Z0-9' ]", '', name).split(' ', 1)

    first_name = name[0].strip()
    last_name = name[1].strip()
    email = re.sub(r"[^a-zA-Z0-9@.]", '', email).strip()

    if len(password) < 8:
      error = 'Make sure your password is at least 8 letters'
    elif password != password_confirm:
      error = 'Passwords dont match'

    user_already_exists = User.objects.filter(email=email).first()

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

      return {'success': True}
    else:
      return {'error': error}

  def get_basic_user_info(self, request):
    future_user_events = UserEventsAssoc.objects.filter(
      user=request.user,
      event__date_time__gte=datetime.now()
    ).order_by('event__date_time').values_list('event__name', flat=True)

    response_dict = {}

    response_dict = {
      'user': {
      'id': request.user.id,
      'email': request.user.email,
      'first_name': request.user.first_name,
      'last_name': request.user.last_name,
      'future_events': list(future_user_events)
      }
    }

    return response_dict
  
  def get_user_events(self, request):
    past_user_events = UserEventsAssoc.objects.filter(
      user=request.user,
      event__date_time__lte=datetime.now()
      ).order_by('event__date_time').values_list('event__name', flat=True)

    future_user_events = UserEventsAssoc.objects.filter(
      user=request.user,
      event__date_time__gte=datetime.now()
      ).order_by('event__date_time').values_list('event__name', flat=True)

    response_dict = {
      'past_events': list(past_user_events),
      'future_events': list(future_user_events)
    }

    return response_dict

  
class UserEventsView(UserView):
  authentication_classes = (JwtAuthentication,)

  def get(self, request):
    data = self.get_user_events(request)

    return JsonResponse(data)


class UserInfoDetailView(UserView):
  authentication_classes = (JwtAuthentication,)

  def get(self, request):
    data = self.get_basic_user_info(request)

    return JsonResponse(data)


class NewUserView(UserView):
  def post(self, request):
    data = self.create_user(request)

    return JsonResponse(data)
