from django.db import models
from django.contrib.auth.models import User
from api.models import UserPosts


class UserComments(models.Model):
  comment = models.CharField(max_length=1000, blank=False, null=True)
  user = models.ForeignKey(User, on_delete=models.CASCADE, blank=False)
  date_time = models.DateTimeField(auto_now_add=True, blank=False)
  post = models.ForeignKey(UserPosts, on_delete=models.CASCADE, blank=False, null=True)
