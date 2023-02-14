FROM python:3

COPY . .

WORKDIR /app

RUN apt -qq -y update \
&& apt -qq -y upgrade


COPY requirements.txt .
RUN pip install -r requirements.txt 


EXPOSE 5000

ENTRYPOINT ["python"]

CMD ["python", "-m", "flask", "run", "--host=0.0.0.0", "app.py"]


