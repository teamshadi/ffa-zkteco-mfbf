#!/bin/bash
# Test that the share for fingerprints is up

set -e
ROOT=`dirname $0` # http://stackoverflow.com/a/59916
source $ROOT/../config.sh

ff=${fpetc}/notified_ffamfe_test01_fingerprintsShare.txt
url=http://192.168.125.58/taskLogger/taskLogger.php?task=ffamfe_test01_fingerprintsShare.sh
f2="${mdbf0}/Program Files/ZKTeco/"

echo "Testing: ${f2}"
if [ -f $ff ]; then
  # if already notified, check if exists now and fix
	if [ -d "$f2" ]; then
		rm $ff;
		echo -e "Fingerprints shared folder $f2 found now.\nRunning rm $ff on your behalf." | mail -s "FFA-MFE test 01 passed" s.akiki@ffaprivatebank.com M.Moawad@ffaprivatebank.com;
	fi
elif [ -d "$f2" ]; then
  # if not notified, and if exists
  echo "Found mount. Doing nothing"
else
  # if not notified and if not exists
	touch $ff;
	echo -e "Fingerprints shared folder $f2 not found.\nPlease run rm $ff when fixed." | mail -s "FFA-MFE test 01 failed" s.akiki@ffaprivatebank.com M.Moawad@ffaprivatebank.com;
fi

# touch task logger
curl -s $url > /dev/null;

