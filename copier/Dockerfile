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

RUN wget https://github.com/shadiakiki1986/nats-cli/releases/download/0.0.4.2/nats-amd64 -O /sbin/nats && chmod +x /sbin/nats

VOLUME /etc/ffa-zkteco-mfbf-copier

# Continue
WORKDIR /code
COPY . .

# LAUNCH
CMD composer install --quiet \
  && bash init.sh
