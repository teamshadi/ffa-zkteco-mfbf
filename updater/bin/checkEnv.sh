#!/bin/bash

# check remote mdb file
if [ ! -f "$UPDATER_REMOTEMDB" ]; then
  echo "Remote mdb file does not exist. Aborting: $UPDATER_REMOTEMDB"
  exit 1
fi

# check env vars
# http://stackoverflow.com/a/8880633/4126114
# http://stackoverflow.com/a/1921337/4126114
declare -a arr=("UPDATER_MYSQLHOST" "MYSQL_DATABASE" "MYSQL_USER" "MYSQL_PASSWORD" "UPDATER_NATSURI" "UPDATER_REMOTEMDB" "UPDATER_WORKDIR")
for i in "${arr[@]}"
do
  if [ -z "${!i}" ]; then
    echo "Please define env var $i"
    exit 1
  fi
done

