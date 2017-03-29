-- This is run for initializing the local MySql database
CREATE TABLE INTERNAL_USERS_LOCK(
USERID int,
DEPTNAME                        varchar (60),
mfid_lb  varchar (40),
bfid_lb  varchar (40),
mfid_db  varchar (40),
bfid_db  varchar (40),
Name varchar (40),
Locked boolean,
inBldg boolean
);

CREATE TABLE MF_USERS_STATE(
USERID int,
state varchar(10)
);

