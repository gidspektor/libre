from api.models import Events
from django.db import models
from django.contrib.auth.models import User


class UserEventsAssoc(models.Model):
    event = models.ForeignKey(Events, on_delete=models.CASCADE, blank=False)
    user = models.ForeignKey(User, on_delete=models.CASCADE, blank=False)
    quantity = models.IntegerField(blank=False)
