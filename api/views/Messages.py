from rest_framework.views import APIView
from django.core.mail import send_mail
from api.tools import sanitize_message_string
import json
from django.http import JsonResponse


class HostMessageRequest(APIView):
  def post(self, request):
    error = ''
    request_json = json.loads(request.body)

    name = sanitize_message_string(request_json.get('name', ''))
    email = request_json.get('email', '')
    comment = sanitize_message_string(request_json.get('comment', ''))

    if not all([name, email, comment]):
      error = 'Bad request'

    if not error:
      send_mail(
        'Host request',
        'Hi {} says {}'.format(name, comment),
        'admin@libre.com',
        [email],
        fail_silently=False,
      )
      return JsonResponse({'success': True})
    else:
      return JsonResponse({'error': error})
