from django.db import models


class Countries(models.Model):
  country = models.CharField(max_length=30)