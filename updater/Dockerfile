FROM ubuntu

# PREPARE with APT
RUN apt-get -qq update > /dev/null \
 && DEBIAN_FRONTEND=noninteractive \
    apt-get -qq -y install \
      mdbtools mysql-client bc \
      expect cron man-db time golang \
      > /dev/null
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get -qq -y install \
    git

# Set a volume that can be mounted from host
VOLUME /data/ZKTeco

# business as usual
WORKDIR /code
COPY . .

RUN touch /var/log/cron.log

# install
ENV GOPATH=/code
RUN go get github.com/nats-io/go-nats

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
CMD init.sh
