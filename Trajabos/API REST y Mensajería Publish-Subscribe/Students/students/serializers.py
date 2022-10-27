from rest_framework import serializers
from .models import Student



class StudentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Student
        fields = ['id', 'name', 'lang']

    def to_representation(self,instance):
        # instance is the model object. create the custom json format by accessing instance attributes normaly and return it
        identifiers = dict()
        identifiers['id'] = instance.id
        identifiers['name'] = instance.name

        representation = {
            'id': instance.id,
            'content': 'Hello, ' + instance.name + '!',
            
        }
        return representation


class StudentSerializer_add(serializers.ModelSerializer):
    class Meta:
        model = Student
        fields = ['id','name', 'lang']