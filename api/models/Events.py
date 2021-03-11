from django.db import models

from api.models import Location


class Events(models.Model):
  description = models.CharField(max_length=500, blank=True, null=True)
  date_time = models.DateTimeField(blank=False)
  location = models.ForeignKey(Location, on_delete=models.CASCADE)
  name = models.CharField(max_length=100, blank=False, null=True)
  show = models.BooleanField(blank=True, default=0)
  sold_out = models.BooleanField(blank=True, default=0)
  tickets_bought = models.IntegerField(blank=False, default=0)

  def __str__(self):
    return self.location.name + ' / ' + str(self.date_time)
