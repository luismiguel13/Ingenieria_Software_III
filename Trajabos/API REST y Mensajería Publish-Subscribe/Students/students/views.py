from django.http import JsonResponse
from .models import Student
from .serializers import StudentSerializer, StudentSerializer_add
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status

@api_view(['GET'])
def student_list(request):
    if request.method == 'GET':
        students = Student.objects.all()
        serializer = StudentSerializer(students, many=True)
        return JsonResponse(serializer.data, safe=False)

@api_view(['POST'])
def student_add(request):
    if request.method == 'POST':
        serializer = StudentSerializer_add(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)