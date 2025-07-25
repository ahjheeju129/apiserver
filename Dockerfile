FROM --platform=linux/amd64  python:3.11-slim as build

RUN apt update
WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY . .

EXPOSE 80
CMD ["python","./apiserver/manage.py","runserver","0.0.0.0:80"]