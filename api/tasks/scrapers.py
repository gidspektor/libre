from api import config
from api.models import Location
from api.tools import create_parser
import urllib
import uuid

def scrape_venuu(url, driver):
  driver.get(config.WEBSITES.get('venuu').get('base_url') + url)
  page_source = driver.page_source
  soup = create_parser(page_source, 'html')

  with open('api/images/' + str(uuid.uuid1()), 'wb') as f:
    f.write(urllib.request.urlopen(soup.find('img')['src']).read())

  

def navigate_venuu(driver, url):
  driver.get(url)
  page_source = driver.page_source
  soup = create_parser(page_source, 'html')

  ul = soup.find('ul', {'data-testid': 'search-results'})

  for li in ul:
    scrape_venuu(li.find('a')['href'], driver)
    break
