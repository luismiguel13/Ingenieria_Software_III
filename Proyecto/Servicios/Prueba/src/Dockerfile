FROM python:3

WORKDIR /app

COPY . .

RUN apt -qq -y update \
&& apt -qq -y upgrade


COPY requirements.txt .
RUN pip install -r requirements.txt 

ENV MYSQL_DB_HOST = 'U_CommerceBD'
ENV MYSQL_DB_PORT = 3306
ENV MYSQL_DB_USER = 'root' 
ENV MYSQL_DB_PASSWORD = '1234'

EXPOSE 5000

#ENTRYPOINT ["python"]

#CMD ["python", "-m", "flask", "run", "--host=0.0.0.0", "app.py"]

CMD ["python", "app.py"]


