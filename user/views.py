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
    