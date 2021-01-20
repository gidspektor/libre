from api.models import Cities
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

        for city in cities:
            cities = Cities()
            cities.city = city
            cities.save()

