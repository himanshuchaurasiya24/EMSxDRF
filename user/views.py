from rest_framework import generics
from rest_framework_simplejwt.authentication import JWTAuthentication
from rest_framework.permissions import IsAuthenticated
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
        
        return Response({'message':'success', 'refresh':str(refresh), 'access':str(refresh.access_token),'user':{'id':user.id, 'username':user.username,'first_name':user.first_name, 'last_name':user.last_name,}}, status=status.HTTP_200_OK)
class RegisterAPI(APIView):
    def post(self , request):
        data = request.data
        serializer= UserSerializer(data= data)
        if not serializer.is_valid():
            return Response({'message':serializer.errors}, status=status.HTTP_400_BAD_REQUEST)
        serializer.save()
        return Response({'message':'created', 'data':serializer.data}, status=status.HTTP_201_CREATED)
class EmployeeDataGenericsGP(generics.ListAPIView, generics.CreateAPIView):
    queryset= EmployeeData.objects.all()
    serializer_class= EmployeeDataSerializer
class EmployeeDataGenericsUD(generics.UpdateAPIView, generics.DestroyAPIView):
    queryset = EmployeeData.objects.all()
    serializer_class= EmployeeDataSerializer
    lookup_field= 'id'    
class UserGenerics(generics.ListAPIView):
    queryset = User.objects.all()
    serializer_class= UserSerializer
class UserGenericsUD(generics.UpdateAPIView, generics.DestroyAPIView):
    queryset = User.objects.all()
    serializer_class= UserSerializer
    lookup_field= 'id' 
    