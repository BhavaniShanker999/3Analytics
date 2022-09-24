
from django.urls import path
from .views import *


urlpatterns = [
    path('create_user/',CreateUser.as_view()),
    path('login_user/',UserLogin.as_view()),
    path('user_profile/',UserProfile.as_view()),
   
]
