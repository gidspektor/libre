from django.db import models
from api.models import Countries, Cities

class Location(models.Model):
  street_address = models.CharField(max_length=100, blank=False, null=True)
  name = models.CharField(max_length=100, blank=False, null=True)
  post_code = models.CharField(max_length=10, blank=False, null=True)
  city = models.ForeignKey(Cities, on_delete=models.CASCADE, blank=False, null=True)
  country = models.ForeignKey(Countries, on_delete=models.CASCADE, blank=False, null=True)
  price_per_day = models.IntegerField(blank=False, null=True)
  price_per_hour = models.IntegerField(blank=False, null=True)
  capacity = models.IntegerField(blank=False, null=True)
  allows_own_drinks = models.BooleanField(blank=False, null=True)
  image = models.CharField(max_length=100, blank=False, null=True)
  description = models.CharField(max_length=2000, blank=False, null=True)
  basic_sound_system = models.BooleanField(blank=False, null=True)
  professional_sound_system = models.BooleanField(blank=False, null=True)
  serves_alcohol = models.BooleanField(blank=False, null=True)
