# Generated by Django 3.1.1 on 2021-01-20 11:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0004_events_name'),
    ]

    operations = [
        migrations.AddField(
            model_name='events',
            name='show',
            field=models.BooleanField(blank=True, default=0),
        ),
    ]
