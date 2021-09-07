FROM php:7.2-apache

MAINTAINER Matteo Vitturi matt.vitturi@gmail.com

LABEL description="Brackets"

RUN yum install -y httpd && yum clean all

COPY ./src /var/www/html

EXPOSE 80

CMD ["httpd", "-D", "FOREGROUND"]

