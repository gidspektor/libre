from api.models import Cities
from django.core.management.base import BaseCommand


class Command(BaseCommand):
  def handle(self, *args, **options):
    cities_list = [
      'Sabadell',
      'Terrassa',
      'Tarragona',
      'Girona',
      'Castello d\'Empuries',
      'Lleida',
      'Aude',
      'Palma',
      'Huesca',
      'Toulouse',
      'Zaragoza',
      'Herault',
      'Parisot',
      'Montpellier',
      'Valencia',
      'Aveyron',
      'Marseille',
      'Correze',
      'Barcelona',
      'Sant Adrio de Besos',
      'L\'Hospitalet de Llobregat',
      'Esplugues de Llobregat',
      'Santa Coloma de Gramenet',
      'Sant Just Desvern',
      'Cornella',
      'El Prat de Llobregat',
      'Badalona',
      'Sant Joan Despi',
      'Sant Feliu de Llobregat',
      'Montcada i Reixac',
      'Sant Boi de Llobregat',
      'Cerdanyola',
      'Sant Cugat',
      'Ripollet',
      'Montgat',
      'Santa Coloma de Cervello',
      'Molins de Rei',
      'Sant Vicenc dels Horts',
      'La Llagosta',
      'Badia del Valles',
      'Barbera del Valles',
      'Sant Fost de Campsentelles',
      'Santa Perpetua de Mogoda',
      'Polinya'
    ]

    for city in cities_list:
      cities = Cities()
      cities.city = city
      cities.save()
    
