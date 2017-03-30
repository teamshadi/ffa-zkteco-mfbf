#!/bin/bash

set -e

# SET CRON
envsubst < etc/cron.env > /etc/cron.d/fingerprints

# below sleep is to wait for mysql server
# https://docs.docker.com/compose/startup-order/
echo "Sleeping 15 secs for mysql server to start"
sleep 15
echo "Waking up"

# these 2 bash calls are already in the cron, but this is just a first run
bash /code/bin/checkMount.sh
bash /code/bin/update.sh

