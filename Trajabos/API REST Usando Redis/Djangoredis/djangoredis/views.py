from django.http import JsonResponse
from .models import Student
from .serializers import StudentSerializer
from rest_framework.decorators import api_view


@api_view(['GET','POST'])
def student_list(request):
    #22:41
    students = Student.objects.all()
    serializer = StudentSerializer(students, many=True)
    return JsonResponse({'students': serializer.data})
    