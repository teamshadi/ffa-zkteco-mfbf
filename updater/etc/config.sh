# windows share mount ... should match with /etc/fstab
# mdbRemote="/data/ZKTeco/att2000.mdb"
mdbRemote="/mnt/fingerprints/Program Files/ZKTeco/att2000.mdb"

# workspace folder
workdir="/tmp/ffa-zkteco-mfbf"

# command to use for mysql
mysqlCmd="mysql
  --host=pmo.ffaprivatebank.com --port=3306 \
  --user=ffaFingerprints --password=fp1298 \
  --silent ffa_price_farm"

# TODO
# try to use mysql_config_editor in the dockerfile
# to avoid the warning about inline password in mysql call above
#mysqlCmd="mysql --login-path=myhostalias ffa_price_farm --silent"

