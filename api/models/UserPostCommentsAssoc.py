from django.db import models
from api.models import UserPosts, UserComments


class UserPostCommentsAssoc(models.Model):
  user_post = models.ForeignKey(UserPosts, on_delete=models.CASCADE, blank=False)
  user_comment = models.ForeignKey(UserComments, on_delete=models.CASCADE, blank=False)
