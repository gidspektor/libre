from rest_framework.views import APIView
from django.http import JsonResponse
import re
from django.contrib.auth.models import User


class CreateUserView(APIView):
  def post(self,request):
    error = ''
    name = request.POST.get('name', '')
    email = request.POST.get('email', '')
    password = request.POST.get('password', '')
    password_confirm = request.POST.get('password_confirm', '')
    print(name, email, password, password_confirm)

    if not any([name, email, password, password_confirm]):
      return JsonResponse({'error': 'Missing values'})

    name = re.sub(r"[^a-zA-Z0-9']", '', name).split(' ', 1)
    first_name = name[0].strip()
    last_name = name[1].strip()
    email = re.sub(r"[^a-zA-Z0-9@.]", '', email).strip()

    if len(password) < 8:
      error = 'Make sure your password is at lest 8 letters'
    elif password != password_confirm:
      error = 'Passwords dont match'
    elif re.search('[0-9]',password) is None:
      error = 'Make sure your password has a number in it'

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


class UserInfoView(APIView):
  def get(self, request):
    email = request.GET.get('email', None)
    email = re.sub(r"[^a-zA-Z0-9@.]", '', email).strip()

    user = User.objects.filter(email=email).first()

    if user:
      return JsonResponse({'exists': True})
    else:
      return JsonResponse({'exists': False})
  
  # def post(self, request):


