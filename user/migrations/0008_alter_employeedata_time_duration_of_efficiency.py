# Generated by Django 5.1.2 on 2024-10-23 16:41

import user.models
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0007_alter_employeedata_time_duration_of_efficiency'),
    ]

    operations = [
        migrations.AlterField(
            model_name='employeedata',
            name='time_duration_of_efficiency',
            field=models.IntegerField(default=user.models.get_current_year),
        ),
    ]
