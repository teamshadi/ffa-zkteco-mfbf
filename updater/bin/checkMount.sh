#!/bin/bash
# Test that the share for fingerprints is up

set -e
ROOT=`dirname $0` # http://stackoverflow.com/a/59916
source $ROOT/../etc/config.sh

mkdir -p $workdir

ff=${workdir}/notified_ffamfe_test01_fingerprintsShare.txt

echo "`date -R`: Testing: ${mdbRemote}"
if [ -f $ff ]; then
  # if already notified, check if exists now and fix
	if [ -f "$mdbRemote" ]; then
		rm $ff;
    mm="`date -R`: Fingerprints shared folder $mdbRemote found now.\nRunning rm $ff on your behalf."
    echo $mm
		#echo -e $mm | mail -s "FFA-MFE test 01 passed" s.akiki@ffaprivatebank.com M.Moawad@ffaprivatebank.com;
	fi
elif [ -f "$mdbRemote" ]; then
  # if not notified, and if exists
  echo "`date -R`: Found mount. Doing nothing"
else
  # if not notified and if not exists
	touch $ff;
  mm="`date -R`: Fingerprints shared folder $mdbRemote not found.\nPlease run rm $ff when fixed."
  echo $mm
	#echo -e $mm | mail -s "FFA-MFE test 01 failed" s.akiki@ffaprivatebank.com M.Moawad@ffaprivatebank.com;
fi

# touch task logger
#url=http://192.168.125.58/taskLogger/taskLogger.php?task=ffamfe_test01_fingerprintsShare.sh
#curl -s $url > /dev/null;

