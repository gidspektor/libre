from api.models import Cities, Countries, Countries_cities
from api import config
from django.core.management.base import BaseCommand


class Command(BaseCommand):
  def add_arguments(self, parser):
    parser.add_argument(
      '--country',
      dest='country',
      default='spain'
    )

  def handle(self, *args, **options):
    cities = config.CITIES_LIST.get(options['country'])
    country = Countries.objects.get(country=options['country'])

    for city in cities:
      city_object = Cities.objects.get(city=city)
      
      countries_cities = Countries_cities()
      countries_cities.city = city_object
      countries_cities.country = country

      countries_cities.save()
