from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework.views import APIView
from user.serializers import *
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework import status
from rest_framework.decorators import action
from django.contrib.auth import authenticate
# Create your views here.
class LoginAPI(APIView):
    def post(self, request):
        data = request.data
        serializer= LoginSerializer(data=data)
        if not serializer.is_valid():
            return Response({'message':'invalid format passed.'}, status=status.HTTP_400_BAD_REQUEST)
        user = authenticate(username = serializer.data['username'], password = serializer.data['password'])
        if not user :
            return Response({'message':'Invalid credentials'}, status=status.HTTP_404_NOT_FOUND)
        refresh= RefreshToken.for_user(user)
        return Response({'message':'success', 'refresh':str(refresh), 'access':str(refresh.access_token)}, status=status.HTTP_200_OK)
class RegisterAPI(APIView):
    def post(self , request):
        data = request.data
        serializer= RegisterSerializer(data= data)
        if not serializer.is_valid():
            return Response({'message':serializer.errors}, status=status.HTTP_400_BAD_REQUEST)
        serializer.save()
        return Response({'message':'created'}, status=status.HTTP_201_CREATED)
from rest_framework import generics
from rest_framework_simplejwt.authentication import JWTAuthentication
from rest_framework.permissions import IsAuthenticated 




class EmployeeDataView(APIView):
    def get(self, request):
        try:
            employee_data = EmployeeData.objects.all()
            if not employee_data:
                return Response({"error": "No employee data found"}, status=status.HTTP_404_NOT_FOUND)
            serializer = EmployeeDataSerializer(employee_data, many=True)
            return Response(serializer.data, status=status.HTTP_200_OK)
        except EmployeeData.DoesNotExist:
            return Response({"error":  "EmployeeData not found"}, status=status.HTTP_404_NOT_FOUND)


    