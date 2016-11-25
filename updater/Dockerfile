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

# install for nats
ENV GOPATH=/code
RUN go get github.com/nats-io/go-nats

# SET CRON
RUN touch /var/log/cron.log \
  && echo "*/1  * * * * root bash /code/bin/update.sh     2>&1 >> /var/log/cron.log" >> /etc/cron.d/fingerprints \
  && echo "*/15 * * * * root bash /code/bin/checkMount.sh 2>&1 >> /var/log/cron.log" >> /etc/cron.d/fingerprints
# TODO: re-add?
# 0 */1 * * * root bash /code/bin/remount.sh

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
# below sleep is to wait for mysql server
# https://docs.docker.com/compose/startup-order/
CMD sleep 5 \
  && echo "GOPATH=${GOPATH}\n$(cat /etc/cron.d/fingerprints)" > /etc/cron.d/fingerprints \
  && echo "NATS_URI=${NATS_URI}\n$(cat /etc/cron.d/fingerprints)" > /etc/cron.d/fingerprints \
  && bash /code/bin/checkMount.sh \
  && bash /code/bin/update.sh \
  && service cron start \
  && tail -f /var/log/cron.log
