from django.db import models

class Cities(models.Model):
  city = models.CharField(max_length=30, unique=True)

  def __str__(self):
    return self.city