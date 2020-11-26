from django.db import models

from api.models import Location

class Events(models.Model):
  name = models.CharField(max_length=30)
  description = models.CharField(max_length=500)
  date_time = models.DateTimeField(blank=False)
  location = models.ForeignKey(Location.Location, on_delete=models.CASCADE)
