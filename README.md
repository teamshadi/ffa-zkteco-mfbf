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

# Remote shutdown
I did some research about how to to shutdown windows machines remotely.
The purpose was to use the `fingerprints-adapter` not only to lock users out of Marketflow/Bankflow,
but also out of the machines themselves.
However, that part of the project never saw the light, mostly because it was not requested.
All the files are in [clientWinShutdown](clientWinShutdown).

# Problems
It turned out that the fingperints machine itself sometimes missed recording
a user state change (going out of bldg or getting in) into its own database.
That created problems with the users because their being locked out was inconsistent with their
actual presence inside or outside of the building.
