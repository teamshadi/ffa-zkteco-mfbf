-- On Mf PriceFarm ms sql d/b (once for lebanon and once for dubai)
CREATE TABLE MF_USERS_LOCK(
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

