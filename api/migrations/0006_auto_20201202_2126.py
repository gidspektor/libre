# Generated by Django 2.2.4 on 2020-12-02 21:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0005_auto_20201202_2111'),
    ]

    operations = [
        migrations.AlterField(
            model_name='cities',
            name='city',
            field=models.CharField(max_length=30, unique=True),
        ),
    ]
