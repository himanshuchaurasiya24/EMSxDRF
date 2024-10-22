# Generated by Django 5.1.2 on 2024-10-22 04:48

import datetime
from django.db import migrations, models, transaction

def set_default_start_time(apps, schema_editor):
    User = apps.get_model('user', 'User')
    default_time = datetime.date(2024, 10, 22,)  # set your desired default time here
    try:
        with transaction.atomic():
            for user in User.objects.all():
                print(str(user.date_joined))
                if not user.date_joined==None:
                    user.date_joined = default_time
                    print(str(user.date_joined))    
                print(str(user.date_joined))
    except Exception as e:
        # Handle the error
        print(e)
class Migration(migrations.Migration):

    dependencies = [
        ('user', '0009_alter_user_address'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='address',
            field=models.CharField(default='add it noww', max_length=100),
        ),                 
        migrations.RunPython(set_default_start_time),

    ]
