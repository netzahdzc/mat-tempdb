# Parent images
FROM python:3
FROM mysql:5.7.18

ENV MYSQL_ROOT_PASSWORD=password_fiware_server

# Working directory to:
ADD init-development.sql /docker-entrypoint-initdb.d
ADD notificationsBuilder.py /

CMD ["python", "./notificationsBuilder.py"]