FROM php:7-apache
MAINTAINER TEDhouse
RUN apt-get update

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
COPY start-apache /usr/local/bin
RUN a2enmod rewrite

COPY . /var/www/
RUN chown -R www-data:www-data /var/www

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

WORKDIR /var/www
RUN composer install

ARG DB_HOST=localhost
ENV DB_HOST ${DB_HOST}
ARG DB_USERNAME=root
ENV DB_USERNAME ${DB_USERNAME}
ARG DB_PASSWORD=root
ENV DB_PASSWORD ${DB_PASSWORD}
ARG DB_NAME=root
ENV DB_NAME ${DB_NAME}


RUN echo "DB_HOST=${DB_HOST}" >> .env
RUN echo "DB_USERNAME=${DB_USERNAME}" >> .env
RUN echo "DB_PASSWORD=${DB_PASSWORD}" >> .env
RUN echo "DB_NAME=${DB_NAME}" >> .env

CMD ["start-apache"]