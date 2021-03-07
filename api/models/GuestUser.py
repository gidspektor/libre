from django.db import models

class GuestUser(models.Model):
  email = models.EmailField(max_length=70, unique=True)
  first_name = models.CharField(max_length=100)
  last_name = models.CharField(max_length=100)