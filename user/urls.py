from django.urls import path, include
from .views import *
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)
urlpatterns = [
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('login/', LoginAPI.as_view()),
    path('register/', RegisterAPI.as_view()),
    path('userlist/', UserGenerics.as_view()),
    path('userlist/<id>/', UserGenericsUD.as_view()),
    path('employee/', EmployeeDataGenericsGP.as_view()),
    path('employee/<id>/', EmployeeDataGenericsUD.as_view()),
]
