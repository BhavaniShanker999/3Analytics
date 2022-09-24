from rest_framework import serializers
from .models import *


class productSerializer(serializers.ModelSerializer):
      class Meta:
         model = Products
         fields = '__all__'

class CategorySerializer(serializers.ModelSerializer):
      class Meta:
         model = Category
         fields = '__all__'

class CategorySerializerForNestedData(serializers.ModelSerializer):
      class Meta:
         model = Category
         fields = 'id','name'

class NestedCategorySerializer(serializers.ModelSerializer):
    self_category = CategorySerializerForNestedData(many=True)

    class Meta:
        model = Category
        fields = 'id','name','self_category'
