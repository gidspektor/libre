from django.db import models

from api.models import Location

class Events(models.Model):
  description = models.CharField(max_length=500, blank=True, null=True)
  date_time = models.DateTimeField(blank=False)
  location = models.ForeignKey(Location, on_delete=models.CASCADE)
