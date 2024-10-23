from django.db import models
from django.contrib.auth import models as auth_model
from datetime import date


class UserManager(auth_model.BaseUserManager):
    def create_user(self, first_name:str, last_name:str, email:str,username :str,
                    date_joined:str,
                    dob:str, address:str, password:str=None, is_staff=False, is_superuser=False)->'User':
        if not email:
            raise ValueError('Email is required.')
        if not first_name:
            raise ValueError('First Name is required.')
        if not last_name:
            raise ValueError('Last Name is required.')
        if not username:
            raise ValueError('Username is required.')
        if not date_joined:
            raise ValueError('Date joined is required.')
        if not address:
            raise ValueError('Address is required.')
        if not dob:
            raise ValueError('Date of birth is required.')
        user = self.model(email= self.normalize_email(email))
        user.first_name= first_name
        user.last_name= last_name
        user.username= username
        user.date_joined= date_joined
        user.address= address
        user.dob = dob
        user.set_password(password)
        user.is_active=True
        user.is_staff=is_staff
        user.is_superuser=is_superuser
        user.save()
        return user
    def create_superuser(self, first_name:str, last_name:str, email:str, username:str,password:str,
                         date_joined:str,
                         dob:str, address:str,)->'User':
        user = self.create_user(first_name=first_name, last_name=last_name, email=email,username=username,
                                date_joined=date_joined,
                                dob=dob, address=address, password=password, is_staff=True, is_superuser=True)
        user.save()
        return user
class User(auth_model.AbstractUser):
    first_name=models.CharField(max_length=255, verbose_name='First Name')
    last_name=models.CharField(max_length=255, verbose_name='Last Name')
    email= models.EmailField(verbose_name='Email', max_length=255, unique=True)
    password= models.CharField(max_length=255)
    username = models.CharField(max_length=255, unique=True)
    date_joined= models.DateField(auto_now_add=True) 
    dob= models.DateField()
    address  = models.CharField(max_length=100, default='add it now')
    objects=UserManager()
    USERNAME_FIELD='username'
    REQUIRED_FIELDS=['email','first_name', 'last_name', 'dob', 'address', 'date_joined']
    def __str__(self):
        return self.first_name+' '+str(self.date_joined)
def get_current_year():
    return date.today().year
class EmployeeData(models.Model):
    CHOICES=[('Exceptional','Exceptional'),('Very Good','Very Good'),('Above Average','Above Average'),('Average','Average'),('Below Average','Below Average')]
    employee = models.ForeignKey(User, blank=False, null=False, on_delete=models.CASCADE)
    is_admin=models.BooleanField(default=False)
    assesment = models.CharField(max_length=30, choices=CHOICES)
    assesment_year = models.IntegerField(default=get_current_year)
    def __str__(self):
        return self.employee_id.first_name
    

