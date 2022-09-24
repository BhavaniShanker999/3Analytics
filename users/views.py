from django.contrib.auth import authenticate
from .models import *
from rest_framework import generics
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .serializers import *
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework.permissions import IsAuthenticated

def get_refresh_tokens(user_data):
    refresh = RefreshToken.for_user(user_data)
    return {'refresh':str(refresh),
    'access': str(refresh.access_token)}

# Create your views here.
class CreateUser(generics.CreateAPIView):
    serializer_class = UserSerializer

    def post(self, request, format=None):

        result = {}
        result['status'] = 'NOK'
        result["result"] = {'message': 'In valid inputs'}
     
        serializer = UserSerializer(data=request.data)
        if serializer.is_valid():
            try:
                user_data=serializer.save()
                token_data= get_refresh_tokens(user_data)
                # result['result']['token']=token_data
            except:
                return Response(result, status=status.HTTP_422_UNPROCESSABLE_ENTITY)

            result['status'] = 'OK'
            result['result']['message'] = "User created successfully !"
            return Response(result, status=status.HTTP_201_CREATED)
        else:
            result['result']['message'] = (list(serializer.errors.keys())[
                0]+' - '+list(serializer.errors.values())[0][0]).capitalize()
            return Response(result, status=status.HTTP_422_UNPROCESSABLE_ENTITY)

class UserLogin(APIView):
    serializer_class = LoginSerializer

    def post(self, request, format=None):
        result = {}
        result['status'] = 'NOK'
        result["result"] = {'message': 'In-valid Credentials'}

        serializer = LoginSerializer(data=request.data)
        if serializer.is_valid():
            email =  serializer.data.get('email')
            password =  serializer.data.get('password')        
            user = authenticate(email=email,password=password)
   
            if user is not None:
                token_data = get_refresh_tokens(user)
                result['status'] = 'OK'
                result['result']['message'] = "User Login successfull !"
                result['result']['token']=token_data
                return Response(result, status=status.HTTP_200_OK)

            else:
                return Response(result, status=status.HTTP_404_NOT_FOUND)
            
        else:
            result['result']['message'] = (list(serializer.errors.keys())[
                0]+' - '+list(serializer.errors.values())[0][0]).capitalize()
            return Response(result, status=status.HTTP_400_BAD_REQUEST)

class UserProfile(APIView):
    serializer_class = LoginSerializer
    permission_classes=[IsAuthenticated]

    def get(self, request, format=None):
        result = {}
        result['status'] = 'NOK'
        result["result"] = {'message': 'In-valid Credentials'}

        serializer = UserProfileSerializer(request.user)
        print(serializer)
        
        result['status'] = 'OK'
        result["result"] = {'message': 'user profile fetched successfully','data':serializer.data}
        return Response(result,status.HTTP_200_OK)

        