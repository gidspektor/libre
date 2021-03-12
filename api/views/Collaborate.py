from rest_framework.views import APIView
import json, operator
from django.http import JsonResponse
from api.middleware.authentication import JwtAuthentication
from django.db.models import Q
from api.views.LocationSearch import SearchLocationView
from api.tools import sanitize_search_string, sanitize_message_string
from api.models import UserPosts


class CreatePost(APIView, SearchLocationView):
  authentication_classes = (JwtAuthentication,)

  def post(self, request):
    error = ''
    request_json = json.loads(request.body)

    description = sanitize_message_string(request_json.get('description', ''))
    title = sanitize_message_string(request_json.get('title', ''))
    location_string = sanitize_search_string(request_json.get('location', ''))

    if not location_string:
      error = 'Incomplete data'

    location = SearchLocationView.grab_one_location(self, location_string)

    if not location.get('location', ''):
      error = 'Location not found'

    if not error:
      UserPosts.objects.create(
        user=request.user,
        title=title,
        description=description,
        city=location.get('location').city
      ).save()

      return JsonResponse({'success': True})
    else:
      return JsonResponse({'error': error})


class SearchPosts(APIView, SearchLocationView):
  def get(self, request, location):
    error = ''
    search_term = sanitize_message_string(request.GET.get('search-term', ''))
    location_string = sanitize_search_string(location)
    location = SearchLocationView.grab_one_location(self, location_string)
    location_object = location.get('location', '')

    if not location_object:
      error = 'Location not found'
    
    if not error:
      query = Q(city=location_object.city) & (Q(title__icontains=search_term) | Q(description__icontains=search_term))

      if not search_term:
        query = Q(city=location_object.city)

      posts = UserPosts.objects.filter(query)

      
      response_dict = {}

      for post in posts:
        response_dict[post.id] = {
          'location': post.city.city,
          'title': post.title,
          'description': post.description,
          'date_time': post.date_time
        }

      data = {
        'results': sorted(response_dict.values(), key=operator.itemgetter('date_time')),
        'location': location_string
      }

      return JsonResponse(data)
    else:
      return JsonResponse({'error': error})
