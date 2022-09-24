from django.urls import path
from .views import *

urlpatterns = [
    path('getproducts',CrudProducts.as_view()),
    path('getcategory',CrudCategory.as_view()),
    ]
