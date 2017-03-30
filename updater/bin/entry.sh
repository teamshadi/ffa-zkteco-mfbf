#!/bin/sh

service rsyslog start
service cron start
bash bin/init.sh 2>&1 | logger -t "init.sh" &
tail -f /var/log/syslog
