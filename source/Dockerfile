# Parent images
FROM python:3
FROM mysql:5.7.18

ENV MYSQL_ROOT_PASSWORD=password_fiware_server

# Working directory to:
ADD init-development.sql /docker-entrypoint-initdb.d
ADD requirements.txt /
ADD notificationsBuilder.py /

RUN apt-get update -y
RUN apt-get install python -y

RUN set -xe \
    && apt-get update  -y\
    && apt-get install python-pip -y
RUN pip install --upgrade pip
RUN pip install -r ./requirements.txt

#CMD which python
CMD python ./notificationsBuilder.py