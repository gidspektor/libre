# Generated by Django 3.1.1 on 2021-04-16 19:27

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0019_remove_usersociallogin_social_login'),
    ]

    operations = [
        migrations.AddField(
            model_name='usercomments',
            name='post',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='api.userposts'),
            preserve_default=False,
        )
    ]
