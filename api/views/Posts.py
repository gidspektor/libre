from rest_framework.views import APIView
from api.middleware.authentication import JwtAuthentication
from api.views.LocationSearch import LocationDetailMixin
from rest_framework.exceptions import NotFound
from django.db.models import Q
from rest_framework.response import Response
from rest_framework import status
from api.tools import sanitize_message_string, sanitize_search_string
from api.models import UserPosts, UserComments
from api.serializers import UserPostsSerializer


class PostDetail(APIView, LocationDetailMixin):
  authentication_classes = (JwtAuthentication,)

  def post(self, request):
    location = LocationDetailMixin.grab_one_location(self, sanitize_search_string(request.data['location']))
    location = location.get('location', '')

    if not location:
      return Response({'error': 'Location not found'}, status=status.HTTP_404_NOT_FOUND)

    request.data['city'] = location.city.id if location else ''
    request.data['title'] = sanitize_message_string(request.data['title'])
    request.data['description'] = sanitize_message_string(request.data['description'])

    serializer = UserPostsSerializer.UserPostsSerializer(data=request.data)

    if serializer.is_valid():
      serializer.save()
      return Response(serializer.data, status=status.HTTP_201_CREATED)

    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class PostList(APIView, LocationDetailMixin):
  search_all_posts = False
  user_posts = False

  def get_object(self, query):
    return UserPosts.objects.filter(query)

  def get(self, request, location = ''):
    data = {}
    query = ''

    if self.search_all_posts:
      location = LocationDetailMixin.grab_one_location(self, sanitize_search_string(location))
      location_string = location.get('location_string', '')
      location = location.get('location', '')
      data['location'] = location_string

      if not location:
        raise NotFound('Location not found')

      search_term = sanitize_message_string(request.query_params['search-term'])
      query = Q(city=location.city) & (Q(title__icontains=search_term) | Q(description__icontains=search_term))

      if not search_term:
        query = Q(city=location.city)
    elif self.user_posts:
      query = Q(user=request.data['user'])

    user_posts_object = self.get_object(query)

    serializer = UserPostsSerializer.UserPostsSerializer(user_posts_object, many=True)

    data['data'] = serializer.data

    return Response(data, status=status.HTTP_200_OK)


class AllPostsList(PostList):
  search_all_posts = True


class UserPostsList(PostList):
  authentication_classes = (JwtAuthentication,)
  user_posts = True
