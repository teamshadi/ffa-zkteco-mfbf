FROM shadiakiki1986/php7-apache-odbc-and-other
MAINTAINER Shadi Akiki

RUN docker-php-ext-install mysqli pdo_mysql > /dev/null

RUN cd /usr/src/php/ext/pdo_odbc \
 && phpize \
 && ./configure --with-pdo-odbc=unixODBC,/usr > /dev/null \
 && docker-php-ext-install pdo_odbc > /dev/null

RUN apt-get -qq update > /dev/null \
 && DEBIAN_FRONTEND=noninteractive \
    apt-get -qq -y install \
      gettext \
      > /dev/null

VOLUME /etc/ffa-zkteco-mfbf-copier

# Continue
WORKDIR /code
COPY . .
RUN composer install --quiet

# LAUNCH
CMD cp /etc/ffa-zkteco-mfbf-copier-odbc/odbc.ini /etc/ \
  && cp /etc/ffa-zkteco-mfbf-copier-odbc/odbcinst.ini /etc/ \
  && envsubst < ./etc/apache2/copier.conf > /etc/apache2/sites-available/copier.conf \
  && ln -s /etc/apache2/sites-available/copier.conf /etc/apache2/sites-enabled/copier.conf \
  && service apache2 start \
  && php bin/natsListener.php
