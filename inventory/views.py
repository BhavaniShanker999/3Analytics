from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from inventory.models import Category, Products

from inventory.serializers import CategorySerializer, NestedCategorySerializer, productSerializer
from .serializers import *

# Create your views here.

class CrudProducts(APIView):
    serializer_class = productSerializer

    def get(self,request):
        result = {}
        queryset = Products.objects.all().values()
        result['status'] = 'OK'
        result["result"] = {'message': 'fetched successfully','data':queryset}
        
        return Response(result,status.HTTP_200_OK)
    
    def post(self, request, format=None):
        result = {}
        result['status'] = 'NOK'
        result["result"] = {'message': ''}
        serializer = productSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()

            result['status'] = 'OK'
            result["result"] = {'message': 'saved successfully'}
            return Response(result,status.HTTP_201_CREATED)
        else:
            result["result"]['message'] = (list(serializer.errors.keys())[
                0]+' - '+list(serializer.errors.values())[0][0]).capitalize()
            return Response(result,status.HTTP_422_UNPROCESSABLE_ENTITY)

    def patch(self,request,format=None):
        result = {}
        result['status'] = 'NOK'
        result["result"] = {'message': ''}
        
        try:
            id = request.data.get('id')
            if id !="":
                id = id.split(",")
                product = Products.objects.filter(id__in=id)
                
                for i in product:
                    serializer = productSerializer(i, data=request.data, partial=True)
                    if serializer.is_valid():
                        serializer.save()

                result['status'] = 'OK'
                result["result"] = {'message': 'updated successfully'}
                return Response(result,status.HTTP_200_OK)

            else:
                result["result"]["message"]="Invalid id"
                return Response(result,status.HTTP_422_UNPROCESSABLE_ENTITY)
        except:
            result["result"]["message"]="Invalid request : id missing"
            return Response(result,status.HTTP_400_BAD_REQUEST)

    def delete(self,request,format=None):

        result = {}
        result['status'] = 'NOK'
        result["result"] = {'message': ''}
        
        try:
            id = request.data.get('id')
            if id !="":
                id = id.split(",")
                Products.objects.filter(id__in=id).delete()
                
                result['status'] = 'OK'
                result["result"] = {'message': 'deleted successfully'}
                return Response(result,status.HTTP_200_OK)

            else:
                result["result"]["message"]="Invalid id"
                return Response(result,status.HTTP_422_UNPROCESSABLE_ENTITY)
        except:
            result["result"]["message"]="Invalid request : id missing"
            return Response(result,status.HTTP_400_BAD_REQUEST)


class CrudCategory(APIView):
    serializer_class = CategorySerializer

    def get(self,request):
        result = {}
        queryset = Category.objects.all()
        serialzer = NestedCategorySerializer(instance = queryset,many=True)
        print(serialzer)
        result['status'] = 'OK'
        result["result"] = {'message': 'fetched successfully','data':serialzer.data}
        
        return Response(result,status.HTTP_200_OK)
    
    def post(self, request, format=None):
        result = {}
        result['status'] = 'NOK'
        result["result"] = {'message': ''}
        data={}
        data['name']= request.data['name']
        if request.data['self_category'] != "":
            data['self_category'] = request.data['self_category'].split(',')
        serializer = CategorySerializer(data=data)
        if serializer.is_valid():
            serializer.save()

            result['status'] = 'OK'
            result["result"] = {'message': 'saved successfully'}
            return Response(result,status.HTTP_201_CREATED)
        else:
            result["result"]['message'] = serializer.errors
            return Response(result,status.HTTP_422_UNPROCESSABLE_ENTITY)

    def patch(self,request,format=None):
        result = {}
        result['status'] = 'NOK'
        result["result"] = {'message': ''}
        
        try:
            id = request.data.get('id')
            if id !="":
                product = Category.objects.get(id=id)
                data={}
                data['name'] = request.data['name']
                data['self_category']=request.data['self_category'].split(',') or None
                serializer = CategorySerializer(product, data=data, partial=True)
               
                if serializer.is_valid():
                    serializer.save()
                else:
                    result["result"] = {'message': serializer.errors}
                    return Response(result,status.HTTP_422_UNPROCESSABLE_ENTITY)

                result['status'] = 'OK'
                result["result"] = {'message': 'updated successfully'}
                return Response(result,status.HTTP_200_OK)

            else:
                result["result"]["message"]="Invalid id"
                return Response(result,status.HTTP_422_UNPROCESSABLE_ENTITY)
        except:
            result["result"]["message"]="Invalid request : id missing"
            return Response(result,status.HTTP_400_BAD_REQUEST)

    def delete(self,request,format=None):
        result = {}
        result['status'] = 'NOK'
        result["result"] = {'message': ''}
        
        try:
            id = request.data.get('id')
            if id !="":
                id = id.split(",")
                Category.objects.filter(id__in=id).delete()
                
                result['status'] = 'OK'
                result["result"] = {'message': 'deleted successfully'}
                return Response(result,status.HTTP_200_OK)

            else:
                result["result"]["message"]="Invalid id"
                return Response(result,status.HTTP_422_UNPROCESSABLE_ENTITY)
        except:
            result["result"]["message"]="Invalid request : id missing"
            return Response(result,status.HTTP_400_BAD_REQUEST)
