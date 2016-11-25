-- On FFA 2.0 mysql datbabase
-- The following is how I got to this file: mdb-schema ~/att2000.mdb mysql > att2000.sql

-- Before launching this, create the user for fingerprints
-- Use the same username and pass as in config.sh mysqlUser and mysqlPass
-- CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';
-- GRANT ALL PRIVILEGES ON ffa_price_farm.* To 'username'@'localhost' IDENTIFIED BY 'password';

CREATE DATABASE IF NOT EXISTS ffa_price_farm;

use ffa_price_farm;

CREATE TABLE CHECKINOUT
 (
 id int(10) unsigned NOT NULL auto_increment, -- added by Shadi... not in original table from fingerprint peopl
        USERID                  int,
        CHECKTIME                       TIMESTAMP, # For MS SQL, use DATETIME
        CHECKTYPE                       varchar (2),
        VERIFYCODE                      int,
        SENSORID                        varchar (10),
        Memoinfo                        varchar (60),
        sn                      varchar (40),
        UserExtFmt                      int,
        WorkCode                        varchar (48),
        UNIQUE KEY `id` (`id`)
);
 CREATE TABLE acc_monitor_log
 (
 id int(10) unsigned NOT NULL auto_increment, -- added by Shadi... not in original table from fingerprint peopl
        id                 int,
        change_operator          varchar (60),
        change_time              TIMESTAMP,
        create_operator          varchar (60),
        create_time              TIMESTAMP,
        delete_operator           varchar (60),
        delete_time               TIMESTAMP,
        status                    int,
        log_tag                   int,
        time                      TIMESTAMP, # For MS SQL, use DATETIME
        pin                       int,
        card_no                   int
        device_id                 int,
        device_sn                 varchar (40),
        verified                   int,
        state                       varchar (2),
        even_type                   int,
        description                 varchar (60),
        event_point_type
        event_point_id              int,
        event_point_name            varchar (40),
       
        UNIQUE KEY `id` (`id`)
);
CREATE TABLE USERINFO
 (
        USERID                  int,
        SSN                     varchar (40),
        TITLE                   varchar (40),
        PAGER                   varchar (40),
        BIRTHDAY                        date,
        HIREDDAY                        date,
        CITY                    varchar (4),
        STATE                   varchar (4),
        ZIP                     varchar (24),
        OPHONE                  varchar (40),
        FPHONE                  varchar (40),
        VERIFICATIONMETHOD                      int,
        DEFAULTDEPTID                   int,
        SECURITYFLAGS                   int,
        ATT                     int,
        INLATE                  int,
        OUTEARLY                        int,
        OVERTIME                        int,
        SEP                     int,
        HOLIDAY                 int,
        MINZU                   varchar (16),
        LUNCHDURATION                   int,
        PHOTO                   varchar (255),
        mverifypass                     varchar (20),
        Notes                   varchar (255),
        privilege                       int,
        InheritDeptSch                  int,
        InheritDeptSchClass                     int,
        AutoSchPlan                     int,
        MinAutoSchInterval                      int,
        RegisterOT                      int,
        InheritDeptRule                 int,
        EMPRIVILEGE                     int,
        CardNo                  varchar (40),
        Badgenumber                     varchar (48),
        street                  varchar (160),
        Gender                  varchar (16),
        Name                    varchar (80),
        PASSWORD                        varchar (100),
        FaceGroup                       int,
        AccGroup                        int,
        UseAccGroupTZ                   int,
        VerifyCode                      int,
        Expires                 int,
        ValidCount                      int,
        ValidTimeBegin                  date,
        ValidTimeEnd                    date,
        TimeZone1                       int,
        TimeZone2                       int,
        TimeZone3                       int
);

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


CREATE TABLE DEPARTMENTS
 (
        DEPTID                  int,
        DEPTNAME                        varchar (60),
        SUPDEPTID                       int,
        InheritParentSch                        int,
        InheritDeptSch                  int,
        InheritDeptSchClass                     int,
        AutoSchPlan                     int,
        InLate                  int,
        OutEarly                        int,
        InheritDeptRule                 int,
        MinAutoSchInterval                      int,
        RegisterOT                      int,
        DefaultSchId                    int,
        ATT                     int,
        Holiday                 int,
        OverTime                        int
);

