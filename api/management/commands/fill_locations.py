import logging

from django.core.management.base import BaseCommand

from api import config
from api.tasks import scrapers
from api.tools import create_web_driver, create_parser

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
            '--location',
            dest='location',
            default='barcelona'
        )

    def handle(self, *args, **options):
        website = options['website']
        location = options['location']
        url = config.WEBSITES.get(website).get(location)
        driver = create_web_driver()

        if website == 'venuu':
            scrapers.scrape_venuu(driver, url)