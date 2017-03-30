FROM ubuntu

# PREPARE with APT
RUN apt-get -qq update > /dev/null \
 && DEBIAN_FRONTEND=noninteractive \
    apt-get -qq -y install \
      mdbtools mysql-client bc \
      expect cron man-db time \
      git gettext \
      > /dev/null

# merge with top apt for a later build
RUN apt-get -qq update > /dev/null \
 && DEBIAN_FRONTEND=noninteractive \
    apt-get -qq -y install \
      wget

RUN wget --quiet https://github.com/shadiakiki1986/nats-cli/releases/download/0.0.4.2/nats-amd64 -O /sbin/nats && chmod +x /sbin/nats

RUN  apt-get -qq    update \
  && DEBIAN_FRONTEND=noninteractive \
         apt-get -qq -y install rsyslog

# install MDBtoMysql if not there
ENV UPDATER_WORKDIR /tmp/ffa-zkteco-mfbf

# Set a volume that can be mounted from host
VOLUME /data/ZKTeco

WORKDIR /code

# business as usual
COPY . .
RUN  ln -s /code/MDBtoMySQL/MDBtoMySQL.sh /usr/bin/MDBtoMySQL.sh \
  && ls -al /usr/bin/MDBtoMySQL.sh \
  && chmod +x /usr/bin/MDBtoMySQL.sh

# CONFIGURE MYSQL PASSWORD
# TODO, use mysql_config_editor to avoid the warnings of "password is not safe to pass in mysql CLI call"
# When done, change mysqlCmd in etc/config.sh
#
# References
# expect:  http://stackoverflow.com/a/4786000/4126114
# mysql_config_editor: http://serverfault.com/a/504841
# https://github.com/docker-library/mysql/issues/105
#RUN expect ./bin/configMysql.exp \
#  && mysql_config_editor print --all

# Fix timezone: http://serverfault.com/a/683651
ENV TZ=Asia/Beirut
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# SET CMD
RUN chmod +x bin/entry.sh
CMD bin/entry.sh
