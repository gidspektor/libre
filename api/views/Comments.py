from rest_framework.views import APIView
import json, operator
from django.http import JsonResponse
from api.middleware.authentication import JwtAuthentication
from django.db.models import Q
from api.views.LocationSearch import LocationDetailView
from api.tools import sanitize_search_string, sanitize_message_string, sanitize_numeric_string
from api.models import UserComments, UserPostCommentsAssoc, UserPosts


class Comments(APIView):
  def create_comment(self, request):
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

      return {'success': True}
    else:
      return {'error': error}
    
  def get_comments(self, request, post_id):
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

      return {'results': sorted(response_dict.values(), key=operator.itemgetter('date_time'))}
    else:
      return {'error': error}


class CreateComment(Comments):
  authentication_classes = (JwtAuthentication,)

  def post(self, request):
    data = self.create_comment(request)

    return JsonResponse(data)


class CommentsListView(Comments):
  def get(self, request, post_id):
    data = self.get_comments(request, post_id)

    return JsonResponse(data)
