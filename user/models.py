from django.db import models
from django.contrib.auth import models as auth_model
class UserManager(auth_model.BaseUserManager):
    def create_user(self, first_name:str, last_name:str, email:str,age:int,username :str, password:str=None, is_staff=False, is_superuser=False)->'User':
        if not email:
            raise ValueError('Email is required.')
        if not first_name:
            raise ValueError('First Name is required.')
        if not last_name:
            raise ValueError('Last Name is required.')
        if not age:
            raise ValueError('Age is required.')
        if not username:
            raise ValueError('Username is required.')
        user = self.model(email= self.normalize_email(email))
        user.first_name= first_name
        user.last_name= last_name
        user.username= username
        user.age= age
        user.set_password(password)
        user.is_active=True
        user.is_staff=is_staff
        user.is_superuser=is_superuser
        user.save()
        return user
    def create_superuser(self, first_name:str, last_name:str, email:str,age:str, username:str,password:str)->'User':
        user = self.create_user(first_name=first_name, last_name=last_name, email=email,age = age,username=username, password=password, is_staff=True, is_superuser=True)
        user.save()
        return user
class User(auth_model.AbstractUser):
    first_name=models.CharField(max_length=255, verbose_name='First Name')
    last_name=models.CharField(max_length=255, verbose_name='Last Name')
    email= models.EmailField(verbose_name='Email', max_length=255, unique=True)
    password= models.CharField(max_length=255)
    username = models.CharField(max_length=255, unique=True)
    age= models.IntegerField(default=18, verbose_name='age')
    objects=UserManager()
    USERNAME_FIELD='username'
    REQUIRED_FIELDS=['email','first_name', 'last_name', 'age']