# Generated by Django 4.1.3 on 2022-11-01 14:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('djangoredis', '0003_alter_student_codigo'),
    ]

    operations = [
        migrations.AlterField(
            model_name='student',
            name='codigo',
            field=models.CharField(max_length=200),
        ),
    ]