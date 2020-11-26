from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import os
from bs4 import BeautifulSoup

def create_parser(page_source, page_type):
    '''
    This takes in the page source and a page type
    e.g. html or lxml to parse and returns 
    the parser for that page.
    '''
    soup = BeautifulSoup(page_source, page_type)
    return soup

def create_web_driver():
    '''
    This creates a webdriver.
    ''' 
    chrome_options = Options()
    chrome_options.add_argument('--headless')
    driver = webdriver.Chrome(executable_path=r'./api/driver/chromedriver', chrome_options=chrome_options)
    # driver = webdriver.Chrome(r'./api/driver/chromedriver')
    return driver
