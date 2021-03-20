from rest_framework.views import APIView
import json, operator
from django.http import JsonResponse
from api.middleware.authentication import JwtAuthentication
from django.db.models import Q
from api.views.LocationSearch import LocationDetailView
from api.tools import sanitize_search_string, sanitize_message_string, sanitize_numeric_string
from api.models import UserPosts, UserComments, UserPostCommentsAssoc


class Posts(APIView, LocationDetailView):
  def create_post(self, request):
    error = ''
    request_json = json.loads(request.body)

    description = sanitize_message_string(request_json.get('description', ''))
    title = sanitize_message_string(request_json.get('title', ''))
    location_string = sanitize_search_string(request_json.get('location', ''))

    if not location_string:
      error = 'Incomplete data'

    location = LocationDetailView.grab_one_location(self, location_string)

    if not location.get('location', ''):
      error = 'Location not found'

    if not error:
      UserPosts.objects.create(
        user=request.user,
        title=title,
        description=description,
        city=location.get('location').city
      ).save()

      return {'success': True}
    else:
      return {'error': error}

  def get_posts(self, request, location):
    error = ''
    search_term = sanitize_message_string(request.GET.get('search-term', ''))
    location_string = sanitize_search_string(location)

    location = LocationDetailView.grab_one_location(self, location_string)
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
          'id': post.id,
          'location': post.city.city,
          'title': post.title,
          'description': post.description,
          'date_time': post.date_time,
          'user_name': post.user.first_name
        }

      return {
        'results': sorted(response_dict.values(), key=operator.itemgetter('date_time')),
        'location': location.get('location_string', '')
      }
    else:
      return {'error': error}

  def get_user_posts(self, request):
    user_posts = UserPosts.objects.filter(user=request.user)

    response_dict = {}

    for user_post in user_posts:
      response_dict[user_post.id] = {
        'id': user_post.id,
        'location': user_post.city.city,
        'title': user_post.title,
        'description': user_post.description,
        'date_time': user_post.date_time,
        'user_name': user_post.user.first_name
      }

    return {'results': sorted(response_dict.values(), key=operator.itemgetter('date_time'))}

  def get_posts_user_commented_on(self, request):
    user_posts_commented_on = UserPostCommentsAssoc.objects.filter(user_comment__user=request.user)

    response_dict = {}

    for post in user_posts_commented_on:
      if post.user_post.id not in response_dict:
        response_dict[post.user_post.id] = {
          'id': post.user_post.id,
          'location': post.user_post.city.city,
          'title': post.user_post.title,
          'description': post.user_post.description,
          'date_time': post.user_post.date_time,
          'user_name': post.user_post.user.first_name
        }

    return {'results': sorted(response_dict.values(), key=operator.itemgetter('date_time'))}


class CreatePost(Posts):
  authentication_classes = (JwtAuthentication,)

  def post(self, request):
    data = self.create_post(request)

    return JsonResponse(data)


class PostsListView(Posts):
  def get(self, request, location):
    data = self.get_posts(request, location)

    return JsonResponse(data)


class UserPostsListView(Posts):
  authentication_classes = (JwtAuthentication,)

  def get(self, request):
    data = self.get_user_posts(request)

    return JsonResponse(data)


class UserCommentedOnPostsListView(Posts):
  authentication_classes = (JwtAuthentication,)

  def get(self, request):
    data = self.get_posts_user_commented_on(request)

    return JsonResponse(data)