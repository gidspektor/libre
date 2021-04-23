from rest_framework.views import APIView
from api.serializers import CommentsSerializer
from django.http import Http404
from api.middleware.authentication import JwtAuthentication
from rest_framework.response import Response
from rest_framework import status
from api.tools import sanitize_message_string
from api.models import UserComments
from django.db.models import Q


class CommentsDetail(APIView):
  authentication_classes = (JwtAuthentication,)

  def post(self, request):
    request.data['comment'] = sanitize_message_string(request.data['comment'])
    serializer = CommentsSerializer.CommentsSerializer(data=request.data)

    if serializer.is_valid():
      serializer.save()
      return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class CommentsList(APIView):
  user_comments = False

  def get_object(self, query):
    return UserComments.objects.filter(query)

  def get(self, request, post_id = ''):
    query = Q(post=post_id)

    if self.user_comments:
      query = Q(user=request.data['user'])

    user_comments = self.get_object(query)
    serializer = CommentsSerializer.CommentsSerializer(user_comments, many=True)

    return Response(serializer.data)


class UserCommentsList(CommentsList):
  authentication_classes = (JwtAuthentication,)
  user_comments = True
