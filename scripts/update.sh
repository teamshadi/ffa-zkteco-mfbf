#!/bin/sh
# This is tailored for mdb-export 0.5.0

set -e
ROOT=`dirname $0` # http://stackoverflow.com/a/59916
source $ROOT/../config.sh

emailTo="s.akiki@ffaprivatebank.com"
# emailTo="s.akiki@ffaprivatebank.com M.Moawad@ffaprivatebank.com"
notiffile="${fpetc}/fingerprints-notif.txt"
mysqlCmd="mysql --host pmo.ffaprivatebank.com --port 3306 --user=${mysqlUser} --password=${mysqlPass} ffa_price_farm"

# Test mdb-export is installed
# This would fail if not
# http://stackoverflow.com/a/677212
hash mdb-export 

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
		  echo $mm | mail -s "Fingerprints stale lock" $emailTo
		  rm $lockfile
    fi
	else
		echo "`date -R`: lock file exists but is not stale ($dt secs old) ... aborting"
		exit
	fi
else
  echo "`date -R`: fingerprints-adapter update.sh start"
fi

date +%s > $lockfile

function truncateTable {
	tableName=$1
	echo "truncating $tableName"
	echo "truncate $tableName;"|$mysqlCmd
}

function updateTable {
	tableName=$1
	echo "updating $tableName from $mdbf using mdb-export $mdbexv"

	grepv=""
	if [ $tableName == "CHECKINOUT" ]; then
		grepv=`date +%Y-%m-%d`
	fi

	if [ $mdbexv == "0.5" ]; then
		mdb-export -D "%Y-%m-%d %H:%M:%S" -I -R ";\r\n" $mdbf $tableName | grep "$grepv" | $mysqlCmd
	else
		if [ $mdbexv == "0.7.1" ]; then
			mdb-export -D "%Y-%m-%d %H:%M:%S" -I mysql -R ";\r\n" $mdbf $tableName | grep "$grepv" | $mysqlCmd
		else
			echo "mdb-export version $mdbexv unsupported yet"
			exit
		fi
	fi
}

mdbexv=`man mdb-export|tail -n 1|awk '{print $1}'`
if [ $mdbexv == "MDBTools" ]; then
	mdbexv=`man mdb-export|tail -n 1|awk '{print $2}'`;
fi

#sqlf="~/Development/ffa-mfe/databases-api/sql/update_MF_USERS_LOCK.sql"

echo "Copying mdb file to local: $mdbf2 -> $mdbf"
cpts=$( { \time -f "%e" cp "$mdbf2" $fpetc; } 2>&1 )
cpts=`echo $cpts|awk -F. '{print $1}'` # truncate decimal
#echo rsync -v $mdbf2 $fpetc|bash
if [ $cpts -gt 60 ]; then
  mm="`date -R`: Copy took $cpts seconds, which is more than 60 seconds... emailing about it"
	echo $mm
	echo $mm|mail -s "Fingerprints slow cp" $emailTo 
fi

truncateTable CHECKINOUT
truncateTable USERINFO
truncateTable DEPARTMENTS
updateTable CHECKINOUT
updateTable USERINFO
updateTable DEPARTMENTS

echo "updateLocks.php"
php $instdir/scripts/updateLocks.php true
date > $df

rm $lockfile

echo "tasklogger"
curl -s "http://192.168.125.58/taskLogger/taskLogger.php?task=MF_Fingerprint_mirror_update.sh" --connect-timeout 2 > /dev/null


echo "done"
