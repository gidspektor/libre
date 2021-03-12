from api.models import Cities
from django.db import models
from django.contrib.auth.models import User


class UserPosts(models.Model):
  user = models.ForeignKey(User, on_delete=models.CASCADE, blank=False)
  title = models.CharField(max_length=100, blank=False, null=True)
  description = models.CharField(max_length=1000, blank=False, null=True)
  city = models.ForeignKey(Cities, on_delete=models.CASCADE)
  date_time = models.DateTimeField(auto_now_add=True, blank=False)

  def __str__(self):
    return self.title
