# Generated by Django 3.1.1 on 2021-03-08 20:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0012_events_sold_out'),
    ]

    operations = [
        migrations.AddField(
            model_name='events',
            name='tickets_bought',
            field=models.IntegerField(default=0),
        ),
    ]
