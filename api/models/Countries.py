from django.db import models


class Countries(models.Model):
  country = models.CharField(max_length=100, unique=True)

  def __str__(self):
    return self.country