FROM python:3.8.0b4-slim-buster
ENV PATH=$PATH:$HOME/.local/bin
COPY . .
RUN apt-get update
RUN apt-get install -y make git
RUN pip3 install -r requirements.txt
