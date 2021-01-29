import logging
from api.models import Location
from django.core.management.base import BaseCommand

from api import config
from api.tools import create_web_driver, create_parser
from api.tasks import scrapers

logger = logging.getLogger('command')


class Command(BaseCommand):
  help = "Scrapes venue information from websites and stores them in the db."

  def add_arguments(self, parser):
    parser.add_argument(
      '--website',
      dest='website',
      default='venuu'
    )

    parser.add_argument(
      '--country',
      dest='country',
      default='spain'
    )

    parser.add_argument(
      '--city',
      dest='city',
      default='barcelona'
    )

  def handle(self, *args, **options):
    website = options['website']
    country = options['country']
    city = options['city']

    url = config.WEBSITES.get(website).get(country).format(city)
    driver = create_web_driver()

    if website == 'venuu':
      scrapers.navigate_venuu(driver, url, city)
