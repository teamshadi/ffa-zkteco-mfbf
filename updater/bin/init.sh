#!/bin/bash

# SET CRON
RUN envsubst < etc/cron.env > /etc/cron.d/fingerprints

# below sleep is to wait for mysql server
# https://docs.docker.com/compose/startup-order/

sleep 5


# these 2 bash calls are already in the cron, but this is just a first run
bash /code/bin/checkMount.sh
bash /code/bin/update.sh

# start cron and tail
service cron start
tail -f /var/log/cron.log
