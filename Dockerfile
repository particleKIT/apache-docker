FROM ubuntu:20.04

RUN apt-get upgrade && apt-get update -y &&\
    DEBIAN_FRONTEND=noninteractive apt-get install apache2 rsync libxml2-utils tzdata -y &&\
    ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime &&\
    dpkg-reconfigure -f noninteractive tzdata

RUN a2enmod ssl headers expires

VOLUME ["/var/www/html", "/etc/apache2/ssl", "/etc/apache2/sites-enabled"]

EXPOSE 80 443
