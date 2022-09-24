from rest_framework import serializers
from .models import *


class UserSerializer(serializers.ModelSerializer):

      class Meta:
         model = User
         fields = (  'email', 
                     'name',
                     'phone',
                     'password'
                  )

      def create(self, validated_data):
        user = User( email=validated_data['email'], 
                     name=validated_data['name'], 
                     phone = validated_data['phone'],
                     is_active = 1
                     
                  )
        user.set_password(validated_data['password'])
        user.save()
        return user

class EditUserSerializer(serializers.ModelSerializer):
      
      class Meta:
         model = User
         fields = '__all__'

class LoginSerializer(serializers.Serializer):
      email = serializers.CharField()
      password = serializers.CharField()

class UserProfileSerializer(serializers.ModelSerializer):
    
      class Meta:
         model = User
         fields = (  'email', 'name','phone')

     