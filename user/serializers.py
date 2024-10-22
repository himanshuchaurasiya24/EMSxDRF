from rest_framework import serializers

from user.models import *

class UserSerializer(serializers.ModelSerializer):
    date_joined = serializers.DateField(format="%d-%m-%Y")
    dob = serializers.DateField(format="%d-%m-%Y")
    
    class Meta:
        model = User
        fields = '__all__'