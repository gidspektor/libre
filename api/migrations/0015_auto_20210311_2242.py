# Generated by Django 3.1.1 on 2021-03-11 22:42

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0014_usercomments_userpostcommentsassoc_userposts'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='userposts',
            name='location',
        ),
        migrations.AddField(
            model_name='userposts',
            name='city',
            field=models.ForeignKey(default=11, on_delete=django.db.models.deletion.CASCADE, to='api.cities'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='userposts',
            name='date_time',
            field=models.DateTimeField(auto_now_add=True),
        ),
    ]