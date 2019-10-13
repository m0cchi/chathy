FROM python:3.7.4-slim-buster

RUN pip install pipenv

COPY . /opt/app
WORKDIR /opt/app

RUN pipenv install
CMD pipenv run hy app.hy
