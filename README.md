# fingerprints-adapter
This is a server-side program that links the ZKTeco fingerprints machine database (MS Access file from ZKAccess 3.5)
in FFA to Marketflow/Bankflow to log out users who are not in the building (and not let them log in).

It is divided into the following parts:

1. [updater](updater):
 * runs every 2 mins
 * copies the ZKTeco database (access mdb file) from a laptop to the local machine
 * imports copied access file to server database (MySql) using [MDBtoMySQL](https://github.com/shadiakiki1986/MDBtoMySQL), which wraps [mdbtools](https://github.com/brianb/mdbtools)
 * reads tables in MySql database and spits out table of lock/unlock for each user
 * triggers the copier worker (below)

2. [copier](copier):
 * copies lock/unlock table from local database (MySql) to a foreign database (SQL Server)
 * triggers a user-defined web-hook

3. [ui](ui):
 * user web interface served at port 80
 * javascript+angular

# Usage

1. Create on target MF/BF databases

    ```sql
    -- On Mf PriceFarm ms sql d/b (once for lebanon and once for dubai)
    CREATE TABLE MF_USERS_LOCK(
    DEPTNAME                        varchar (60),
    mfid  varchar (40),
    bfid  varchar (40),
    Name varchar (40),
    Locked boolean
    );
    ```
2. Copy odbc.ini and odbcinst.ini to an `etc` folder in the root folder
 * all sources in the `odbc.ini` file will be used to copy to
 * note that fields `mfid_lb` and `bfid_lb` are used by default.
  * When the ODBC DSN is `MarketflowAccDB` or `MarketflowBsalimDxb`, then `mfid_db` and `bfid_db` are used
 * mf/bf userids are input in the ZKAccess program, user info, under fields:
  * marketflow lebanon: MINZU
  * bankflow lebanon: TITLE
  * marketflow dubai: SSN
  * bankflow dubai: OPHONE

3.
```
export MYSQL_PASSWORD=choosepass
docker-compose up --build --abort-on-container-exit
```

# Testing
## `updater`
* The `MDBtoMySQL` script is already tested on travis-ci
* for the `bin/update.sh` script wrapping it, just run an example usage
 * test that a local run lock is set to avoid parallel runs if a run is slower than 2 mins
 * test that stale lock is automatically removed
 * test that a locks table is updated
 * test that nats signal is sent out at end of update

## `copier`
### Unit tests
`vendor/bin/phpunit tests/unit`
### Integration test
```bash
export MYSQL_PASSWORD=somepass
docker-compose up db

export MYSQL_DATABASE=test
export UPDATER_MYSQLHOST=localhost
export MYSQL_DATABASE=ffa_price_farm
export MYSQL_USER=ffaFingerprints
export MYSQL_PASSWORD=somepass
export UPDATER_MYSQLHOST=127.0.0.1

vendor/bin/phpunit tests/integration
```
### End-to-end test:
* check that `api.php` is running
* check that `natsListener.php` is listening and can trigger a copy
```bash
export MYSQL_PASSWORD=somepass
docker-compose up nats db

export UPDATER_MYSQLHOST=127.0.0.1
export MYSQL_DATABASE=ffa_price_farm
export MYSQL_USER=ffaFingerprints
php bin/natsListener.php

GOPATH=`pwd` go run bin/publish.go 
```

# TODO
Important
* updater: why does cron job not output mysql warnings?
* add "date of last update"
* add check if MF ID is valid
* add copyLocksToMf (similar to putLocks) to FingerprintsClient

Nice
* split out from updater a docker-MDBtoMySQL repo that has cron+nats capability
* replace cron with [jobber](https://github.com/dshearer/jobber)
* add plot total users in bank versus time
* add socket connection for live update in open window
 * add audio notification + highlight of rows most recently updated
* add register email alert for "in bldg" change of a user


# Useful notes

Please check [importantQueries.txt](importantQueries.txt)

```
--- On FFA 2.0 mysql datbabase
--- The following is how I got to this file: mdb-schema ~/att2000.mdb mysql > att2000.sql
-
-----------------
--- Before launching this, create the user for fingerprints
--- Use the same username and pass as in config.sh mysqlUser and mysqlPass
--- CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';
--- GRANT ALL PRIVILEGES ON ffa_price_farm.* To 'username'@'localhost' IDENTIFIED BY 'password';
-----------------
--- CREATE DATABASE IF NOT EXISTS ffa_price_farm;
--- use ffa_price_farm;
-----------------
-- Note that datatime fields in ms sql server become timestamp
--
```
