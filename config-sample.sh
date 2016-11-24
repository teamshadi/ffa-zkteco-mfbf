mdbf0="/mnt/fingerprints" # windows share mount ... should match with /etc/fstab
mdbf2="${mdbf0}/path/to/att2000.mdb"
fpetc="/etc/ffa-mfe" # workspace folder
mdbf="${fpetc}/att2000.mdb"
df="${fpetc}/fingerprints-adapter-lastupdate.txt"
lockfile="${fpetc}/fingerprints-lock.txt"

instdir="/path/to/ffa-mfe/fingerprints-adapter"

mysqlUser="fingerprints user"
mysqlPass="fingerprints pass"
