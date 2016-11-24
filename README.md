# fingerprints-adapter
This is a server-side program that links the fingerprints machine database in FFA to Marketflow/Bankflow.

# Operation
1. Copy fingerprints database (access file) to server database (MySql)
2. Read admin settings for users (auto/lock/unlock) from Mongo database
3. Combine the admin settings with the users state (in/out of building)
4. Calculate if the user should be locked out of Marketflow/Bankflow or not
5. Copy this calculation to the Marketflow/Bankflow database (MS Sql Server)

# Important SQL queries
Please check [importantCommands.txt](importantCommands.txt)

# Installation
Check [INSTALL.md](INSTALL.md)

# Testing
1. Run the test in `databases-api/tests/test_01_FingerprintsClient.php`
2. `php tests/*`

# docker
`docker-compose up`
