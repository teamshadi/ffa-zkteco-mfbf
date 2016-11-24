#!/bin/bash

set -e
ROOT=`dirname $0` # http://stackoverflow.com/a/59916
source $ROOT/../config.sh

echo "Checking existence of: '${mdbf0}/Program Files'"
if [ ! -d "${mdbf0}/Program Files" ]; then
    echo "Share not mounted, remounting"
    mount /mnt/fingerprints
    if [ ! -d "${mdbf0}/Program Files" ]; then
        echo "mount failed"
        exit $? # The script will exit with exit status from If statement.
    else
        echo "Remount successful"
    fi
else
    echo "Share already mounted. Not doing anything"
fi

curl -s "http://192.168.125.58/taskLogger/taskLogger.php?task=fingerprints_remount.sh" > /dev/null

