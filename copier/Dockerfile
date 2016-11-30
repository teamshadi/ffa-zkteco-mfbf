FROM shadiakiki1986/php7-apache-odbc-and-other
MAINTAINER Shadi Akiki

RUN docker-php-ext-install mysqli pdo_mysql > /dev/null

VOLUME /data/odbc

# Continue
WORKDIR /code
COPY . .
RUN composer install --quiet
RUN ln -s /code/www/api.php /var/www/html/api.php

# LAUNCH
CMD cp /data/odbc/odbc.ini /etc/ \
  && cp /data/odbc/odbcinst.ini /etc/ \
  && service apache2 start \
  && php bin/natsListener.php
