FROM python:3.8

WORKDIR /app

COPY requirements.txt .

RUN apt-get update \
    && apt-get intall -y default-libmysqlclient-dev build-essential \
    && pip install -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python", "app1.py"]


