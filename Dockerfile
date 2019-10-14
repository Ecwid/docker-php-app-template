FROM php:7.0-apache

RUN rm -rf *

COPY code/ /var/www/html/

RUN chmod -R 777 .
RUN mkdir -m 777 /logs

EXPOSE  80
