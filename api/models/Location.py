from django.db import models
from api.models import Countries, Cities

class Location(models.Model):
  address = models.CharField(max_length=100, blank=False, null=True)
  address_name = models.CharField(max_length=100, blank=False, null=True)
  post_code = models.CharField(max_length=10, blank=False, null=True)
  city = models.ForeignKey(Cities.Cities, on_delete=models.CASCADE, blank=False, null=True)
  country = models.ForeignKey(Countries.Countries, on_delete=models.CASCADE, blank=False, null=True)
  price_per_day = models.IntegerField(blank=False, null=True)
  price_per_hour = models.IntegerField(blank=False, null=True)
  capacity = models.IntegerField(blank=False, null=True)
  allows_own_drinks = models.BooleanField(blank=False, null=True)
