from rest_framework import serializers

from user.models import *

class UserSerializer(serializers.ModelSerializer):
    date_joined = serializers.DateField(format="%d-%m-%Y")
    dob = serializers.DateField(format="%d-%m-%Y")
    
    class Meta:
        model = User
        fields = '__all__'
class LoginSerializer(serializers.Serializer):
    username = serializers.CharField()
    password = serializers.CharField()
    
class RegisterSerializer(serializers.Serializer):
    first_name = serializers.CharField()
    last_name = serializers.CharField()
    email = serializers.EmailField()
    password = serializers.CharField()
    date_joined = serializers.DateField(format="%d-%m-%Y")
    dob = serializers.DateField(format="%d-%m-%Y")
    address = serializers.CharField()
    username = serializers.CharField()
    def validate(self, data):
        if data['username']:
            if User.objects.filter(username = data['username']).exists():
                raise serializers.ValidationError('This username is taken, please try another one.')
            for char in data['username']:
                if char.isdigit():
                    raise serializers.ValidationError('username can not contain a number.')
        if data['email']:
            if User.objects.filter(email = data['email']).exists():
                raise serializers.ValidationError('This email is taken, please try another one.')
        if data['first_name'] and data['last_name']:
            for char in data['first_name']:
                if char.isdigit():
                    raise serializers.ValidationError('Name can not contain a digit.')
            for char in data['last_name']:
                if char.isdigit():
                    raise serializers.ValidationError('Name can not contain a digit.')
        return data
    def create(self, validated_data):
        user = User.objects.create(username = validated_data['username'],email = validated_data['email'],dob = validated_data['dob'],date_joined = validated_data['date_joined'],address = validated_data['address'],first_name = validated_data['first_name'],last_name = validated_data['last_name'])
        user.set_password(validated_data['password'])
        user.save()
        return validated_data
            
