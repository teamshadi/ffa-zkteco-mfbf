FROM shadiakiki1986/php7-apache-odbc-and-other
MAINTAINER Shadi Akiki

# PREPARE with APT
RUN apt-get -qq update > /dev/null \
 && DEBIAN_FRONTEND=noninteractive \
    apt-get -qq -y install \
      php-mysql php-sqlite3 \
      > /dev/null

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
