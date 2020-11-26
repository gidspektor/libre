from django.db import models
from api.models import Countries, Cities

class Location(models.Model):
  address = models.CharField(max_length=100)
  address_name = models.CharField(max_length=100)
  post_code = models.CharField(max_length=10)
  city = models.ForeignKey(Cities.Cities, on_delete=models.CASCADE)
  country = models.ForeignKey(Countries.Countries, on_delete=models.CASCADE)
  price = models.IntegerField()
