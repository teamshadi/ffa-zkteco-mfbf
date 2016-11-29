# fingerprints-adapter
This is a server-side program that links the fingerprints machine database in FFA to Marketflow/Bankflow.

It is divided into 2 main workers:
1. [updater](updater):
 * copies the ZKTeco database (access mdb file) from a laptop to the local machine
 * imports copied access file to server database (MySql) using [mdbtools](https://github.com/brianb/mdbtools)
 * does so every 2 mins
 * triggers the processor worker (below)
2. [processor](processor):
 * reads tables in MySql database and spits out table of lock/unlock for each user
 * copies lock/unlock table from local database (MySql) to a foreign database (SQL Server)
 * triggers a user-defined web-hook

# Usage
1. Copy odbc.ini and odbcinst.ini to root folder
2.
```
docker-compose up --build --abort-on-container-exit \
  --env MYSQL_PASSWORD=something \
  --env COPIER_TO_1_PASSWORD=something \
  --env COPIER_TO_2_PASSWORD=something \
  --env COPIER_TO_3_PASSWORD=something \
  --env COPIER_TO_4_PASSWORD=something
```

# Important SQL queries
Please check [importantQueries.txt](importantQueries.txt)

# Testing
1. Run the test in `databases-api/tests/test_01_FingerprintsClient.php`
2. `php tests/*`

# TODO
* updater: why does cron job not output mysql warnings?

# initdb/updater.sql
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
