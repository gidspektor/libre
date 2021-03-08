from django.db import models
from api.models import Countries, Cities

class CountriesCities(models.Model):
  city = models.ForeignKey(Cities, on_delete=models.CASCADE, blank=False, null=True)
  country = models.ForeignKey(Countries, on_delete=models.CASCADE, blank=False, null=True)
