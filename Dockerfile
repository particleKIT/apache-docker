FROM ubuntu:bionic

RUN apt-get upgrade && apt-get update -y &&\
    apt-get install apache2 rsync libxml2-utils -y

RUN a2enmod ssl headers

VOLUME ["/var/www/html", "/etc/apache2/ssl", "/etc/apache2/sites-enabled"]

EXPOSE 80 443
