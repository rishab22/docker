#FROM php:7.2-apache

#MAINTAINER sawan

#RUN apt-get update

#COPY ./ /var/www/html 
#CMD ["echo", "Hello World"]

FROM php:7.4-apache

COPY . /var/www/html 
COPY .docker/vhost.conf /etc/apache2/sites-available/000-default.conf


RUN chown -R www-data:www-data /var/www/html \
    && a2enmod rewrite \
    && chown -R 777 /var/www/html \
CMD service apache2 restart
