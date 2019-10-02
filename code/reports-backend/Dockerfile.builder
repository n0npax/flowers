FROM python:3.8.0b4-slim-buster

COPY . .
RUN apt-get update
RUN apt-get install -y make
RUN pip3 install -r requirements.txt
