FROM php:7-apache
LABEL maintainer=TE3DHouse
LABEL email=admin@tedhouse.org

RUN apt-get update
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
COPY start-apache /usr/local/bin
RUN cd /usr/local/bin && chmod 755 start-apache
RUN a2enmod rewrite

COPY . /var/www/
RUN chown -R www-data:www-data /var/www

CMD ["start-apache"]