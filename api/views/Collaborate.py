from rest_framework.views import APIView
import json, operator
from django.http import JsonResponse
from api.middleware.authentication import JwtAuthentication
from django.db.models import Q
from api.views.LocationSearch import SearchLocationView
from api.tools import sanitize_search_string, sanitize_message_string, sanitize_numeric_string
from api.models import UserPosts, UserComments, UserPostCommentsAssoc


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
          'id': post.id,
          'location': post.city.city,
          'title': post.title,
          'description': post.description,
          'date_time': post.date_time,
          'user_name': post.user.first_name
        }

      data = {
        'results': sorted(response_dict.values(), key=operator.itemgetter('date_time')),
        'location': location_string
      }

      return JsonResponse(data)
    else:
      return JsonResponse({'error': error})


class CreateComment(APIView):
  authentication_classes = (JwtAuthentication,)

  def post(self, request):
    error = ''
    request_json = json.loads(request.body)
    
    comment = sanitize_message_string(request_json.get('comment', ''))
    post_id = request_json.get('post_id', '')

    if any([not comment, not post_id, not isinstance(post_id, int)]):
      error = 'Missing data'

    post = UserPosts.objects.get(id=post_id)

    if not post:
      error = 'Post doesnt exist'

    if not error:
      user_comment = UserComments.objects.create(
        comment=comment,
        user=request.user
      )

      UserPostCommentsAssoc.objects.create(
        user_post=post,
        user_comment=user_comment
      ).save()

      user_comment.save()

      return JsonResponse({'success': True})
    else:
      return JsonResponse({'error': error})


class GetComments(APIView):
  def get(self, request, post_id):
    error = ''
    post_id = sanitize_numeric_string(post_id)

    if not post_id:
      error = 'Bad data'

    if not error:
      comments = UserPostCommentsAssoc.objects.filter(user_post__id=post_id)

      response_dict = {}

      for comment in comments:
        response_dict[comment.user_comment] = {
          'comment': comment.user_comment.comment,
          'date_time': comment.user_comment.date_time,
          'user_name': comment.user_comment.user.first_name
        }
      
      data = {
        'results': sorted(response_dict.values(), key=operator.itemgetter('date_time'))
      }
      return JsonResponse(data)
    else:
      return JsonResponse({'error': error})