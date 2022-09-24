from django.db import models

# Create your models here.
class Products(models.Model):
    name = models.CharField(max_length=100,null=False,blank=False)
    price =  models.IntegerField(null=True,blank=True)
        
class Category(models.Model):
    self_category = models.ManyToManyField('self', null=True, blank=True)
    name  = models.CharField(unique=True, max_length=255,null=True,blank=True)

