from api import config
from api.models import Location, Cities, Countries
from api.tools import create_parser

import requests
import shutil
import urllib
import uuid

def scrape_venuu(url, driver):
  driver.get(config.WEBSITES.get('venuu').get('base_url') + url)
  page_source = driver.page_source
  soup = create_parser(page_source, 'html')

  location = Location()

  location.name = soup.find('h1', {'itemprop': 'name'}).text

  image_name = str(uuid.uuid1())

  image_file = open('api/images/' + image_name + '.jpg', 'wb')

  response = requests.get(soup.find('img')['src'], stream=True)
  response.raw.decode_content = True

  shutil.copyfileobj(response.raw, image_file)
  image_file.close()

  location.image = image_name

  country = Countries.objects.get(country='Spain')
  location.country = country

  labels = soup.findAll('div', {'class': 'b-venue-info-box__label'})

  for label in labels:
    # Characters need to be checked here because these fields can return bad data.
    if 'Standing' in label.text and label.find_next_sibling('div').text.isalnum():
      location.capacity = label.find_next_sibling('div').text

    if 'Own drinks' in label.text and label.find_next_sibling('div').text.isalnum():
      location.allows_own_drinks = 1 if 'Yes' in label.find_next_sibling('div').text else 0

    if 'Rent per day' in label.text and label.find_next_sibling('div').text.isalnum():
      location.price_per_day = label.find_next_sibling('div').text

    if 'Price / hour' in label.text and label.find_next_sibling('div').text.isalnum():
      location.price_per_hour = label.find_next_sibling('div').text

  description = soup.find('div', {'class': 'b-venue-description'})

  # Characters need to be checked here because these fields can return bad data
  if description.find('div', {'data-reactroot': ''}).select('div div:nth-of-type(2)')[0].find('div').text.isalpha():
    location.description = description.find('div', {'data-reactroot': ''}).select('div div:nth-of-type(2)')[0].find('div').text

  address = soup.find('div', {'class': 'b-venue-map__address'})

  location.street_address = address.find('span', {'itemprop': 'streetAddress'}).text
  location.post_code = address.find('span', {'itemprop': 'postalCode'}).text

  city = address.find('span', {'itemprop': 'addressLocality'}).text
  # city = city.replace("'", "\'").encode('utf-8')
  print(city)
  city_object = Cities.objects.extra(where=["%s LIKE city + '%%'"], params=[city])
  print(city_object)
  location.city = city_object

  available_extras = soup.findAll('i', {'class': 'fa fa-check m-service-list-available'})

  for available_extra in available_extras:
    if 'Alcohol from venue' in available_extra.parent.text: location.serves_alcohol = 1

    if 'Professional sound system' in available_extra.parent.text: location.professional_sound_system = 1

    if 'Basic sound system' in available_extra.parent.text: location.basic_sound_system = 1

  location.save()

def navigate_venuu(driver, url):
  driver.get(url)
  page_source = driver.page_source
  soup = create_parser(page_source, 'html')

  ul = soup.find('ul', {'data-testid': 'search-results'})

  for li in ul:
    scrape_venuu(li.find('a')['href'], driver)
    print('scraped')
    break
