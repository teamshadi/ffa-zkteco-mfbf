FROM shadiakiki1986/php7-apache-odbc-and-other
MAINTAINER Shadi Akiki

VOLUME /data/odbc
COPY /data/odbc/odbc.ini /etc/
COPY /data/odbc/odbcinst.ini /etc/

# Continue
WORKDIR /code
COPY . .
RUN composer install --quiet

# assert config availability
RUN test -f etc/config.yml && \
    test -d etc/ssl

# LAUNCH
ENTRYPOINT ["bash","entrypoint.sh"]
