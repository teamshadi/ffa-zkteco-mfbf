# fingerprints-adapter
This is a server-side program that links the fingerprints machine database in FFA to Marketflow/Bankflow.

It is divided into 2 main workers:
1. updater:
 * copies the ZKTeco database (access mdb file) from a laptop to the local machine
 * imports copied access file to server database (MySql)
 * does so every 2 mins
 * triggers the processor worker (below)
2. processor:
 * reads tables in MySql database and spits out table of lock/unlock for each user
 * copies lock/unlock table from local database (MySql) to a foreign database (SQL Server)
 * triggers a user-defined web-hook

# Usage
`docker-compose up --build --abort-on-container-exit`

# Operation
2. Read admin settings for users (auto/lock/unlock) from Mongo database
3. Combine the admin settings with the users state (in/out of building)
4. Calculate if the user should be locked out of Marketflow/Bankflow or not
5. Copy this calculation to the Marketflow/Bankflow database (MS Sql Server)

# Important SQL queries
Please check [importantQueries.txt](importantQueries.txt)

# Installation
Check [INSTALL.md](INSTALL.md)

# Testing
1. Run the test in `databases-api/tests/test_01_FingerprintsClient.php`
2. `php tests/*`

