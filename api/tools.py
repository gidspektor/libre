from bs4 import BeautifulSoup
from selenium.webdriver.chrome.options import Options
import os
import re
from selenium import webdriver

def create_parser(page_source, page_type):
  '''
  This takes in the page source and a page type
  e.g. html or lxml to parse and returns 
  the parser for that page.
  '''
  soup = BeautifulSoup(page_source, features=page_type)
  return soup

def create_web_driver():
  '''
  This creates a webdriver.
  ''' 
  chrome_options = Options()
  chrome_options.add_argument('--headless')
  driver = webdriver.Chrome(executable_path=r'./api/driver/chromedriver', chrome_options=chrome_options)
  return driver

def sanitize_url_string(string):
    return re.sub(r"[^a-zA-Z0-9'-]", '', string).strip()

def sanitize_numeric_string(string):
  return re.sub(r"[^0-9']", '', string).strip()

def sanitize_string(string):
  return re.sub(r"[^a-zA-Z0-9]", '', string).strip()
