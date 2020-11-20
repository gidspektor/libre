from django.test import TestCase
from django.db import connections


class DatabaseConnectionTestCase(TestCase):
  def test_connect_to_db(self):
    db_conn = connections['default']

    if db_conn.cursor():
      return True