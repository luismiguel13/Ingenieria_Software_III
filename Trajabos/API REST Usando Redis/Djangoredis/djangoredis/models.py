from django.db import models

class Student(models.Model):
    codigo = models.CharField(max_length=200)
    nombre = models.CharField(max_length=200)
    email = models.CharField(max_length=200)
    carrera = models.CharField(max_length=200)
    nivel = models.CharField(max_length=200)

    def __str__(self):
        return str(self.codigo) + ' ' + self.nombre