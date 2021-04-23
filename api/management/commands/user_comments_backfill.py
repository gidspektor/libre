from django.core.management.base import BaseCommand
from api.models import UserPostCommentsAssoc, UserComments, UserPosts


class Command(BaseCommand):
  def handle(self, *args, **options):
    user_comments = UserPostCommentsAssoc.objects.all()

    for user_comment in user_comments:
      comment = UserComments.objects.get(id=user_comment.comment.id)
      post = UserPosts.objects.get(id=user_comment.post.id)
      comment.post = post
      comment.save()
