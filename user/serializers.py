from rest_framework import serializers
from user.models import *
from rest_framework.response import Response
class LoginSerializer(serializers.Serializer):
    username = serializers.CharField()
    password = serializers.CharField()
    def validate(self, data):
        for char in data['username']:
            if char.isdigit():
                raise serializers.ValidationError('username can not contain a digit')
        return data
    
class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = '__all__'
    def validate(self, data):
        if data['username']:
            request = self.context.get('request')
            if request and request.method == 'POST':
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
        user = User.objects.create(
                                username = validated_data['username'].lower(),
                                email = validated_data['email'],
                                dob = validated_data['dob'],
                                date_joined = validated_data['date_joined'],
                                address = validated_data['address'],
                                first_name = validated_data['first_name'],
                                last_name = validated_data['last_name'],
                                )
        user.set_password(validated_data['password'])            
        user.save()
        return user            
class EmployeeDataSerializer(serializers.ModelSerializer):
    employee = serializers.PrimaryKeyRelatedField(queryset=User.objects.all())
    class Meta:
        model = EmployeeData
        fields= '__all__'
    def validate(self, data):
        employee_data_list = EmployeeData.objects.filter(employee=data['employee'].id)
        request = self.context.get('request')
        if request and request.method == 'POST':
            for employee in employee_data_list:
                if employee.assesment_year==data['assesment_year']:
                    raise serializers.ValidationError('an Assessment for this year already exists')
        return data
            

