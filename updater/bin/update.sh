#!/bin/bash

set -e

# http://stackoverflow.com/a/59916
ROOT=`dirname $0` 
# echo "Root is ${ROOT}"

source $ROOT/checkEnv.sh

#
mkdir -p $UPDATER_WORKDIR

# base filename
# http://stackoverflow.com/a/2664746/4126114
mdbLocal="${UPDATER_WORKDIR}/${UPDATER_REMOTEMDB##*/}"
lastupdate="${UPDATER_WORKDIR}/lastupdate.txt"
lockfile="${UPDATER_WORKDIR}/lock.txt"

# emailTo="s.akiki@ffaprivatebank.com"
# emailTo="s.akiki@ffaprivatebank.com M.Moawad@ffaprivatebank.com"
notiffile="${UPDATER_WORKDIR}/fingerprints-notif.txt"

# lockfile management
if [ -f $lockfile ]; then
	echo "`date -R`: Fingerprints update already in progress..."

	lockts=`cat $lockfile`
	nowts=`date +%s`
	dt=`echo $nowts-$lockts|bc`
	if [ $dt -gt 600 ]; then # If older than 10 minutes
    if [ -f $notiffile ]; then
      echo "Already notified about stale lock file"
    else
      mm="`date -R`: Lock file looks stale ($dt seconds old). Running an automatic: rm $lockfile"
		  echo $mm
		  # TODO # echo $mm | mail -s "Fingerprints stale lock" $emailTo
		  rm $lockfile
    fi
	else
		echo "`date -R`: lock file exists but is not stale ($dt secs old) ... aborting: " $lockfile
		exit
	fi
else
  echo "`date -R`: fingerprints-adapter update.sh start"
fi

date +%s > $lockfile

#
echo "Copying mdb file to local: $UPDATER_REMOTEMDB -> $mdbLocal"
cpts=$( { \time -f "%e" cp "$UPDATER_REMOTEMDB" $UPDATER_WORKDIR; } 2>&1 )
cpts=`echo $cpts|awk -F. '{print $1}'` # truncate decimal

# Calculate copy time and alert if too slow
#echo rsync -v $UPDATER_REMOTEMDB $UPDATER_WORKDIR|bash
if [ $cpts -gt 60 ]; then
  mm="`date -R`: Copy took $cpts seconds, which is more than 60 seconds... emailing about it"
	echo $mm
	# TODO # echo $mm|mail -s "Fingerprints slow cp" $emailTo 
fi

# perform sync
# Tables needed are: acc_monitor_log USERINFO DEPARTMENTS
bash $UPDATER_WORKDIR/MDBtoMySQL/MDBtoMySQL.sh \
  -m "$mdbLocal" \
  -d "$MYSQL_DATABASE" \
  -u "$MYSQL_USER" \
  -p "$MYSQL_PASSWORD" \
  -h "$UPDATER_MYSQLHOST" \
  -g acc_monitor_log \
  -t USERINFO,DEPARTMENTS,acc_monitor_log
# acc_monitor_log \

#
#echo "Updating MF_USERS_LOCK table"
#mysqlCmd="/usr/bin/mysql \
#  --host=$UPDATER_MYSQLHOST \
#  --user=$MYSQL_USER \
#  --password=$MYSQL_PASSWORD \
#  $MYSQL_DATABASE"
# --silent 
#  --port=3306
# TODO
# try to use mysql_config_editor in the dockerfile
# to avoid the warning about inline password in mysql call above
#mysqlCmd="mysql --login-path=myhostalias ffa_price_farm --silent"

# unlock
rm $lockfile
date > $lastupdate

# publish even to nats server
nats --server ${UPDATER_NATSURI} pub foo "help me"

# TRIGGER webhooks
# echo "updateLocks.php"
# instdir="/home/shadi/Development/ffa-zkteco-mfbf"
# php $instdir/scripts/updateLocks.php true
# 
# echo "tasklogger"
# curl -s "http://192.168.125.58/taskLogger/taskLogger.php?task=MF_Fingerprint_mirror_update.sh" --connect-timeout 2 > /dev/null

echo "`date -R`: fingerprints-adapter update.sh end"
