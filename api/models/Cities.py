from django.db import models

class Cities(models.Model):
  city = models.CharField(max_length=30)