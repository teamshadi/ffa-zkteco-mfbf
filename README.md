# fingerprints-adapter
This is a server-side program that links the fingerprints machine database in FFA to Marketflow/Bankflow.

It is divided into 2 main workers:
1. [updater](updater):
 * copies the ZKTeco database (access mdb file) from a laptop to the local machine
 * imports copied access file to server database (MySql)
 * does so every 2 mins
 * triggers the processor worker (below)
2. [processor](processor):
 * reads tables in MySql database and spits out table of lock/unlock for each user
 * copies lock/unlock table from local database (MySql) to a foreign database (SQL Server)
 * triggers a user-defined web-hook

# Usage
`docker-compose up --build --abort-on-container-exit`

# Important SQL queries
Please check [importantQueries.txt](importantQueries.txt)

# Testing
1. Run the test in `databases-api/tests/test_01_FingerprintsClient.php`
2. `php tests/*`

