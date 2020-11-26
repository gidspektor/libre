from api.tools import create_parser

def scrape_venuu(driver, url):
  # LOOKUP_DICT = {
  #   'venuu': {
  #     'class_name': '_1S2QWR-np6_1B_ONqb0_2y'
  #   }
  # }

  driver.get(url)
  page_source = driver.page_source
  soup = create_parser(page_source, 'html')
  
  ul = soup.find('ul', {'data-testid': 'search-results'})

  for item in ul:
    li = item.find('li')
    print(li)
