-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------

-- That file uses encoding UTF-8

CREATE TABLE `acc_antiback`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`device_id`			int, 
	`one_mode`			char NOT NULL, 
	`two_mode`			char NOT NULL, 
	`three_mode`			char NOT NULL, 
	`four_mode`			char NOT NULL, 
	`five_mode`			char NOT NULL, 
	`six_mode`			char NOT NULL, 
	`seven_mode`			char NOT NULL, 
	`eight_mode`			char NOT NULL, 
	`nine_mode`			char NOT NULL, 
	`AntibackType`			int
);

CREATE TABLE `acc_door`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`device_id`			int, 
	`door_no`			int, 
	`door_name`			varchar (100), 
	`lock_delay`			int, 
	`back_lock`			char NOT NULL, 
	`sensor_delay`			int, 
	`opendoor_type`			int, 
	`inout_state`			int, 
	`lock_active_id`			int, 
	`long_open_id`			int, 
	`wiegand_fmt_id`			int, 
	`card_intervaltime`			int, 
	`reader_type`			int, 
	`is_att`			char NOT NULL, 
	`door_sensor_status`			int, 
	`map_id`			int, 
	`duration_apb`			int, 
	`force_pwd`			varchar (200), 
	`supper_pwd`			varchar (200), 
	`reader_io_state`			int, 
	`open_door_delay`			int, 
	`door_normal_open`			char NOT NULL, 
	`enable_normal_open`			char NOT NULL, 
	`disenable_normal_open`			char NOT NULL, 
	`wiegandInType`			int, 
	`wiegandOutType`			int, 
	`wiegand_fmt_out_id`			int, 
	`SRBOn`			int, 
	`ManualCtlMode`			int, 
	`ErrTimes`			int, 
	`SensorAlarmTime`			int, 
	`InTimeAPB`			int
);

CREATE TABLE `acc_firstopen`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`door_id`			int, 
	`timeseg_id`			int
);

CREATE TABLE `acc_firstopen_emp`
 (
	`id`			int, 
	`accfirstopen_id`			int, 
	`employee_id`			int
);

CREATE TABLE `acc_holidays`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int NOT NULL, 
	`holiday_name`			varchar (100), 
	`holiday_type`			int, 
	`start_date`			datetime NOT NULL, 
	`end_date`			datetime NOT NULL, 
	`loop_by_year`			int, 
	`memo`			varchar (100), 
	`HolidayNo`			int, 
	`HolidayTZ`			int
);

CREATE TABLE `acc_interlock`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			int, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`device_id`			int, 
	`one_mode`			char NOT NULL, 
	`two_mode`			char NOT NULL, 
	`three_mode`			char NOT NULL, 
	`four_mode`			char NOT NULL, 
	`InterlockType`			int
);

CREATE TABLE `acc_levelset`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`level_name`			varchar (100), 
	`level_timeseg_id`			int
);

CREATE TABLE `acc_levelset_door_group`
 (
	`id`			int, 
	`acclevelset_id`			int NOT NULL, 
	`accdoor_id`			int NOT NULL, 
	`accdoor_no_exp`			int, 
	`accdoor_device_id`			int, 
	`level_timeseg_id`			int
);

CREATE TABLE `acc_linkageio`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			varchar (100), 
	`status`			int NOT NULL, 
	`linkage_name`			varchar (100), 
	`device_id`			int, 
	`trigger_opt`			int, 
	`in_address_hide`			int, 
	`in_address`			int, 
	`out_type_hide`			int, 
	`out_address_hide`			int, 
	`out_address`			int, 
	`action_type`			int, 
	`delay_time`			int, 
	`video_linkageio_id`			int, 
	`lchannel_num`			int
);

CREATE TABLE `acc_map`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int NOT NULL, 
	`map_name`			varchar (100), 
	`map_path`			text (255), 
	`area_id`			int, 
	`width`			int, 
	`height`			int
);

CREATE TABLE `acc_mapdoorpos`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int NOT NULL, 
	`map_door_id`			int, 
	`map_id`			int, 
	`width`			int, 
	`left`			int, 
	`top`			int
);

CREATE TABLE `acc_morecardempgroup`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`group_name`			varchar (100), 
	`memo`			varchar (100), 
	`StdGroupNo`			int, 
	`StdGroupTz`			int, 
	`StdGroupVT`			int, 
	`StdValidOnHoliday`			char NOT NULL
);

CREATE TABLE `acc_morecardgroup`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`comb_id`			int, 
	`group_id`			int, 
	`opener_number`			int
);

CREATE TABLE `acc_timeseg`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`timeseg_name`			varchar (100), 
	`memo`			varchar (100), 
	`sunday_start1`			datetime, 
	`sunday_end1`			datetime, 
	`sunday_start2`			datetime, 
	`sunday_end2`			datetime, 
	`sunday_start3`			datetime, 
	`sunday_end3`			datetime, 
	`monday_start1`			datetime, 
	`monday_end1`			datetime, 
	`monday_start2`			datetime, 
	`monday_end2`			datetime, 
	`monday_start3`			datetime, 
	`monday_end3`			datetime, 
	`tuesday_start1`			datetime, 
	`tuesday_end1`			datetime, 
	`tuesday_start2`			datetime, 
	`tuesday_end2`			datetime, 
	`tuesday_start3`			datetime, 
	`tuesday_end3`			datetime, 
	`wednesday_start1`			datetime, 
	`wednesday_end1`			datetime, 
	`wednesday_start2`			datetime, 
	`wednesday_end2`			datetime, 
	`wednesday_start3`			datetime, 
	`wednesday_end3`			datetime, 
	`thursday_start1`			datetime, 
	`thursday_end1`			datetime, 
	`thursday_start2`			datetime, 
	`thursday_end2`			datetime, 
	`thursday_start3`			datetime, 
	`thursday_end3`			datetime, 
	`friday_start1`			datetime, 
	`friday_end1`			datetime, 
	`friday_start2`			datetime, 
	`friday_end2`			datetime, 
	`friday_start3`			datetime, 
	`friday_end3`			datetime, 
	`saturday_start1`			datetime, 
	`saturday_end1`			datetime, 
	`saturday_start2`			datetime, 
	`saturday_end2`			datetime, 
	`saturday_start3`			datetime, 
	`saturday_end3`			datetime, 
	`holidaytype1_start1`			datetime, 
	`holidaytype1_end1`			datetime, 
	`holidaytype1_start2`			datetime, 
	`holidaytype1_end2`			datetime, 
	`holidaytype1_start3`			datetime, 
	`holidaytype1_end3`			datetime, 
	`holidaytype2_start1`			datetime, 
	`holidaytype2_end1`			datetime, 
	`holidaytype2_start2`			datetime, 
	`holidaytype2_end2`			datetime, 
	`holidaytype2_start3`			datetime, 
	`holidaytype2_end3`			datetime, 
	`holidaytype3_start1`			datetime, 
	`holidaytype3_end1`			datetime, 
	`holidaytype3_start2`			datetime, 
	`holidaytype3_end2`			datetime, 
	`holidaytype3_start3`			datetime, 
	`holidaytype3_end3`			datetime, 
	`TimeZone1Id`			int, 
	`TimeZone2Id`			int, 
	`TimeZone3Id`			int, 
	`TimeZoneHolidayId`			int
);

CREATE TABLE `acc_wiegandfmt`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`wiegand_name`			varchar (100), 
	`wiegand_count`			int, 
	`odd_start`			int, 
	`odd_count`			int, 
	`even_start`			int, 
	`even_count`			int, 
	`cid_start`			int, 
	`cid_count`			int, 
	`comp_start`			int, 
	`comp_count`			int
);

CREATE TABLE `ACGroup`
 (
	`GroupID`			int NOT NULL, 
	`Name`			varchar (60), 
	`TimeZone1`			int, 
	`TimeZone2`			int, 
	`TimeZone3`			int, 
	`holidayvaild`			char NOT NULL, 
	`verifystyle`			int
);

CREATE TABLE `acholiday`
 (
	`primaryid`			int, 
	`holidayid`			int, 
	`begindate`			datetime, 
	`enddate`			datetime, 
	`timezone`			int
);

CREATE TABLE `ACTimeZones`
 (
	`TimeZoneID`			int NOT NULL, 
	`Name`			varchar (60), 
	`SunStart`			datetime, 
	`SunEnd`			datetime, 
	`MonStart`			datetime, 
	`MonEnd`			datetime, 
	`TuesStart`			datetime, 
	`TuesEnd`			datetime, 
	`WedStart`			datetime, 
	`WedEnd`			datetime, 
	`ThursStart`			datetime, 
	`ThursEnd`			datetime, 
	`FriStart`			datetime, 
	`FriEnd`			datetime, 
	`SatStart`			datetime, 
	`SatEnd`			datetime
);

CREATE TABLE `action_log`
 (
	`id`			int, 
	`action_time`			datetime, 
	`user_id`			int, 
	`content_type_id`			int, 
	`object_id`			int, 
	`object_repr`			varchar (100), 
	`action_flag`			int, 
	`change_message`			varchar (100)
);

CREATE TABLE `AlarmLog`
 (
	`ID`			int NOT NULL, 
	`Operator`			varchar (40), 
	`EnrollNumber`			varchar (60), 
	`LogTime`			datetime, 
	`MachineAlias`			varchar (40), 
	`AlarmType`			int
);

CREATE TABLE `areaadmin`
 (
	`id`			int, 
	`user_id`			int, 
	`area_id`			int
);

CREATE TABLE `att_attreport`
 (
	`ItemName`			varchar (100), 
	`ItemType`			varchar (100), 
	`Author_id`			int, 
	`ItemValue`			varchar (100), 
	`Published`			int
);

CREATE TABLE `att_waitforprocessdata`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`UserID_id`			int, 
	`starttime`			datetime, 
	`endtime`			datetime, 
	`flag`			int
);

CREATE TABLE `attcalclog`
 (
	`id`			int, 
	`DeptID`			int, 
	`UserId`			int, 
	`StartDate`			datetime, 
	`EndDate`			datetime, 
	`OperTime`			datetime, 
	`Type`			int
);

CREATE TABLE `attexception`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`UserId`			int, 
	`StartTime`			datetime, 
	`EndTime`			datetime, 
	`ExceptionID`			int, 
	`AuditExcID`			int, 
	`OldAuditExcID`			int, 
	`OverlapTime`			int, 
	`TimeLong`			int, 
	`InScopeTime`			int, 
	`AttDate`			datetime, 
	`OverlapWorkDayTai`			int, 
	`OverlapWorkDay`			int, 
	`schindex`			int, 
	`Minsworkday`			int, 
	`Minsworkday1`			int, 
	`schid`			int
);

CREATE TABLE `AuditedExc`
 (
	`AEID`			int NOT NULL, 
	`UserId`			int, 
	`CheckTime`			datetime NOT NULL, 
	`NewExcID`			int, 
	`IsLeave`			int, 
	`UName`			varchar (40), 
	`UTime`			datetime NOT NULL
);

CREATE TABLE `auth_group_permissions`
 (
	`id`			int, 
	`group_id`			int NOT NULL, 
	`permission_id`			int NOT NULL
);

CREATE TABLE `auth_message`
 (
	`id`			int, 
	`user_id`			int, 
	`message`			varchar (100)
);

CREATE TABLE `auth_permission`
 (
	`id`			int, 
	`name`			varchar (100), 
	`content_type_id`			int, 
	`codename`			varchar (100)
);

CREATE TABLE `auth_user`
 (
	`id`			int, 
	`username`			varchar (100), 
	`password`			varchar (100), 
	`Status`			int, 
	`last_login`			datetime, 
	`RoleID`			int, 
	`Remark`			text (255)
);

CREATE TABLE `auth_user_groups`
 (
	`id`			int, 
	`user_id`			int, 
	`group_id`			int
);

CREATE TABLE `auth_user_user_permissions`
 (
	`id`			int, 
	`user_id`			int, 
	`permission_id`			int
);

CREATE TABLE `base_additiondata`
 (
	`id`			int, 
	`create_time`			datetime, 
	`user_id`			int, 
	`content_type_id`			int, 
	`object_id`			varchar (100), 
	`key`			varchar (100), 
	`value`			varchar (100), 
	`data`			varchar (100), 
	`delete_time`			datetime
);

CREATE TABLE `base_appoption`
 (
	`id`			varchar (100), 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`optname`			varchar (100), 
	`value`			varchar (100), 
	`discribe`			varchar (100)
);

CREATE TABLE `base_basecode`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`content`			varchar (100), 
	`content_class`			int, 
	`display`			varchar (100), 
	`value`			varchar (100), 
	`remark`			varchar (100), 
	`is_add`			varchar (100)
);

CREATE TABLE `base_datatranslation`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`content_type_id`			int, 
	`property`			varchar (100), 
	`language`			varchar (100), 
	`value`			varchar (100), 
	`display`			varchar (100)
);

CREATE TABLE `base_operatortemplate`
 (
	`id`			varchar (100), 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`user_id`			int, 
	`template1`			varchar (255), 
	`finger_id`			int, 
	`valid`			int, 
	`fpversion`			varchar (100), 
	`bio_type`			int, 
	`utime`			datetime, 
	`bitmap_picture`			varchar (255), 
	`bitmap_picture2`			varchar (255), 
	`bitmap_picture3`			varchar (255), 
	`bitmap_picture4`			varchar (255), 
	`use_type`			int, 
	`template2`			varchar (255), 
	`template3`			varchar (255), 
	`template_flag`			char NOT NULL
);

CREATE TABLE `base_personaloption`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`option_id`			int, 
	`value`			varchar (100), 
	`user_id`			int
);

CREATE TABLE `base_strresource`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`app`			varchar (100), 
	`str`			varchar (100)
);

CREATE TABLE `base_strtranslation`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`str_id`			int, 
	`language`			varchar (100), 
	`display`			varchar (100)
);

CREATE TABLE `base_systemoption`
 (
	`id`			varchar (100), 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`option_id`			int, 
	`value`			varchar (100)
);

CREATE TABLE `CHECKEXACT`
 (
	`EXACTID`			int, 
	`USERID`			int, 
	`CHECKTIME`			datetime, 
	`CHECKTYPE`			varchar (4), 
	`ISADD`			int, 
	`YUYIN`			varchar (50), 
	`ISMODIFY`			int, 
	`ISDELETE`			int, 
	`INCOUNT`			int, 
	`ISCOUNT`			int, 
	`MODIFYBY`			varchar (40), 
	`DATE`			datetime
);

CREATE TABLE `CHECKINOUT`
 (
	`USERID`			int NOT NULL, 
	`CHECKTIME`			datetime NOT NULL, 
	`CHECKTYPE`			varchar (2), 
	`VERIFYCODE`			int, 
	`SENSORID`			varchar (10), 
	`Memoinfo`			varchar (60), 
	`WorkCode`			int, 
	`sn`			varchar (40), 
	`UserExtFmt`			int, 
	`LOGID`			int NOT NULL, 
	`MachineId`			int
);

CREATE TABLE `dbbackuplog`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`user_id`			int, 
	`starttime`			datetime, 
	`imflag`			char NOT NULL, 
	`successflag`			varchar (100)
);

CREATE TABLE `DEPARTMENTS`
 (
	`DEPTID`			int NOT NULL, 
	`DEPTNAME`			varchar (60), 
	`SUPDEPTID`			int NOT NULL, 
	`InheritParentSch`			int, 
	`InheritDeptSch`			int, 
	`InheritDeptSchClass`			int, 
	`AutoSchPlan`			int, 
	`InLate`			int, 
	`OutEarly`			int, 
	`InheritDeptRule`			int, 
	`MinAutoSchInterval`			int, 
	`RegisterOT`			int, 
	`DefaultSchId`			int, -- NOT NULL, -- commenting this out since it seems that the ZKAcess puts null
	`ATT`			int, 
	`Holiday`			int, 
	`OverTime`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`code`			varchar (100), 
	`type`			varchar (100), 
	`invalidate`			datetime
);

CREATE TABLE `deptadmin`
 (
	`id`			int, 
	`user_id`			int, 
	`dept_id`			int
);

CREATE TABLE `DeptUsedSchs`
 (
	`DeptId`			int, 
	`SchId`			int
);

CREATE TABLE `devcmds`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`SN_id`			int, 
	`CmdOperate_id`			int, 
	`CmdCommitTime`			datetime, 
	`CmdTransTime`			datetime, 
	`CmdOverTime`			datetime, 
	`CmdReturn`			int, 
	`CmdReturnContent`			varchar (100), 
	`CmdImmediately`			char NOT NULL, 
	`CmdContent`			text (255)
);

CREATE TABLE `devcmds_bak`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`SN_id`			int, 
	`CmdOperate_id`			int, 
	`CmdContent`			varchar (100), 
	`CmdCommitTime`			datetime, 
	`CmdTransTime`			datetime, 
	`CmdOverTime`			datetime, 
	`CmdReturn`			int, 
	`CmdReturnContent`			varchar (100), 
	`CmdImmediately`			char NOT NULL
);

CREATE TABLE `django_content_type`
 (
	`id`			int, 
	`name`			varchar (100), 
	`app_label`			varchar (100), 
	`model`			varchar (100)
);

CREATE TABLE `django_session`
 (
	`session_key`			varchar (100), 
	`session_data`			varchar (100), 
	`expire_date`			datetime
);

CREATE TABLE `EmOpLog`
 (
	`ID`			int NOT NULL, 
	`USERID`			int NOT NULL, 
	`OperateTime`			datetime NOT NULL, 
	`manipulationID`			int, 
	`Params1`			int, 
	`Params2`			int, 
	`Params3`			int, 
	`Params4`			int, 
	`SensorId`			varchar (10)
);

CREATE TABLE `empitemdefine`
 (
	`ItemName`			varchar (100), 
	`ItemType`			varchar (100), 
	`Author_id`			int, 
	`ItemValue`			varchar (100), 
	`Published`			int
);

CREATE TABLE `EXCNOTES`
 (
	`USERID`			int, 
	`ATTDATE`			datetime, 
	`NOTES`			varchar (400)
);

CREATE TABLE `FaceTemp`
 (
	`TEMPLATEID`			int NOT NULL, 
	`USERNO`			varchar (48), 
	`SIZE`			int, 
	`pin`			int, 
	`FACEID`			int, 
	`VALID`			int, 
	`RESERVE`			int, 
	`ACTIVETIME`			int, 
	`VFCOUNT`			int, 
	`TEMPLATE`			varchar (255), 
	`FaceType`			int
);

CREATE TABLE `iclock_dstime`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`dst_name`			varchar (100), 
	`mode`			int, 
	`start_time`			varchar (100), 
	`end_time`			varchar (100)
);

CREATE TABLE `iclock_oplog`
 (
	`id`			int, 
	`SN`			int, 
	`admin`			int, 
	`OP`			int, 
	`OPTime`			datetime, 
	`Object`			int, 
	`Param1`			int, 
	`Param2`			int, 
	`Param3`			int
);

CREATE TABLE `iclock_testdata`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`dept_id`			int, 
	`area_id`			int
);

CREATE TABLE `iclock_testdata_admin_area`
 (
	`id`			int, 
	`testdata_id`			int, 
	`area_id`			int
);

CREATE TABLE `iclock_testdata_admin_dept`
 (
	`id`			int, 
	`testdata_id`			int, 
	`department_id`			int
);

CREATE TABLE `LeaveClass`
 (
	`LeaveId`			int NOT NULL, 
	`LeaveName`			varchar (40) NOT NULL, 
	`MinUnit`			float NOT NULL, 
	`Unit`			int NOT NULL, 
	`RemaindProc`			int NOT NULL, 
	`RemaindCount`			int NOT NULL, 
	`ReportSymbol`			varchar (8) NOT NULL, 
	`Deduct`			float NOT NULL, 
	`Color`			int NOT NULL, 
	`Classify`			int, 
	`Code`			varchar (32)
);

CREATE TABLE `LeaveClass1`
 (
	`LeaveId`			int NOT NULL, 
	`LeaveName`			varchar (40) NOT NULL, 
	`MinUnit`			float NOT NULL, 
	`Unit`			int NOT NULL, 
	`RemaindProc`			int NOT NULL, 
	`RemaindCount`			int NOT NULL, 
	`ReportSymbol`			varchar (8) NOT NULL, 
	`Deduct`			float NOT NULL, 
	`LeaveType`			int NOT NULL, 
	`Color`			int NOT NULL, 
	`Classify`			int NOT NULL, 
	`Calc`			text (255), 
	`Code`			varchar (32)
);

CREATE TABLE `Machines`
 (
	`ID`			int NOT NULL, 
	`MachineAlias`			varchar (40), 
	`ConnectType`			int, 
	`IP`			varchar (40), 
	`SerialPort`			int, 
	`Port`			int, 
	`Baudrate`			int, 
	`MachineNumber`			int NOT NULL, 
	`IsHost`			char NOT NULL, 
	`Enabled`			char NOT NULL, 
	`CommPassword`			varchar (24), 
	`UILanguage`			int, 
	`DateFormat`			int, 
	`InOutRecordWarn`			int, 
	`Idle`			int, 
	`Voice`			int, 
	`managercount`			int, 
	`usercount`			int, 
	`fingercount`			int, 
	`SecretCount`			int, 
	`ProductType`			varchar (40), 
	`LockControl`			int, 
	`Purpose`			int, 
	`ProduceKind`			int, 
	`sn`			varchar (40), 
	`PhotoStamp`			varchar (40), 
	`IsIfChangeConfigServer2`			int, 
	`pushver`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`device_type`			int, 
	`last_activity`			datetime, 
	`trans_times`			varchar (100), 
	`TransInterval`			int, 
	`log_stamp`			varchar (100), 
	`oplog_stamp`			varchar (255), 
	`photo_stamp`			varchar (255), 
	`UpdateDB`			varchar (100), 
	`device_name`			varchar (100), 
	`transaction_count`			int, 
	`main_time`			varchar (100), 
	`max_user_count`			int, 
	`max_finger_count`			int, 
	`max_attlog_count`			int, 
	`alg_ver`			varchar (100), 
	`flash_size`			varchar (100), 
	`free_flash_size`			varchar (100), 
	`language`			varchar (100), 
	`lng_encode`			varchar (100), 
	`volume`			varchar (100), 
	`is_tft`			varchar (100), 
	`platform`			varchar (100), 
	`brightness`			varchar (100), 
	`oem_vendor`			varchar (100), 
	`city`			varchar (100), 
	`AccFun`			int, 
	`TZAdj`			int, 
	`comm_type`			int, 
	`agent_ipaddress`			varchar (100), 
	`subnet_mask`			varchar (100), 
	`gateway`			varchar (100), 
	`area_id`			int, 
	`acpanel_type`			int, 
	`sync_time`			char NOT NULL, 
	`four_to_two`			char NOT NULL, 
	`video_login`			varchar (100), 
	`fp_mthreshold`			int, 
	`Fpversion`			int, 
	`max_comm_size`			int, 
	`max_comm_count`			int, 
	`realtime`			char NOT NULL, 
	`delay`			int, 
	`encrypt`			char NOT NULL, 
	`dstime_id`			int, 
	`door_count`			int, 
	`reader_count`			int, 
	`aux_in_count`			int, 
	`aux_out_count`			int, 
	`IsOnlyRFMachine`			int, 
	`alias`			varchar (100), 
	`ipaddress`			varchar (100), 
	`com_port`			int, 
	`com_address`			int, 
	`DeviceNetmask`			varchar (32), 
	`DeviceGetway`			varchar (32), 
	`SimpleEventType`			int, 
	`FvFunOn`			int, 
	`fvcount`			int, 
	`deviceOption`			varchar (255), 
	`DevSDKType`			int, 
	`UTableDesc`			varchar (255), 
	`IsTFTMachine`			char NOT NULL, 
	`PinWidth`			int, 
	`UserExtFmt`			int, 
	`FP1_NThreshold`			int, 
	`FP1_1Threshold`			int, 
	`Face1_NThreshold`			int, 
	`Face1_1Threshold`			int, 
	`Only1_1Mode`			int, 
	`OnlyCheckCard`			int, 
	`MifireMustRegistered`			int, 
	`RFCardOn`			int, 
	`Mifire`			int, 
	`MifireId`			int, 
	`NetOn`			int, 
	`RS232On`			int, 
	`RS485On`			int, 
	`FreeType`			int, 
	`FreeTime`			int, 
	`NoDisplayFun`			int, 
	`VoiceTipsOn`			int, 
	`TOMenu`			int, 
	`StdVolume`			int, 
	`VRYVH`			int, 
	`KeyPadBeep`			int, 
	`BatchUpdate`			int, 
	`CardFun`			int, 
	`FaceFunOn`			int, 
	`FaceCount`			int, 
	`TimeAPBFunOn`			int, 
	`FirmwareVersion`			varchar (100), 
	`FingerFunOn`			varchar (10), 
	`CompatOldFirmware`			varchar (10), 
	`ParamValues`			varchar (255)
);

CREATE TABLE `NUM_RUN`
 (
	`NUM_RUNID`			int NOT NULL, 
	`OLDID`			int, 
	`NAME`			varchar (60) NOT NULL, 
	`STARTDATE`			datetime, 
	`ENDDATE`			datetime, 
	`CYLE`			int, 
	`UNITS`			int
);

CREATE TABLE `NUM_RUN_DEIL`
 (
	`NUM_RUNID`			int NOT NULL, 
	`STARTTIME`			datetime NOT NULL, 
	`ENDTIME`			datetime, 
	`SDAYS`			int NOT NULL, 
	`EDAYS`			int, 
	`SCHCLASSID`			int, 
	`OverTime`			int
);

CREATE TABLE `operatecmds`
 (
	`id`			varchar (100), 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`Author_id`			varchar (100), 
	`CmdContent`			varchar (100), 
	`CmdCommitTime`			datetime, 
	`commit_time`			datetime, 
	`CmdReturn`			int, 
	`process_count`			int, 
	`success_flag`			int, 
	`receive_data`			varchar (100), 
	`cmm_type`			int, 
	`cmm_system`			int
);

CREATE TABLE `personnel_area`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`areaid`			varchar (100), 
	`areaname`			varchar (100), 
	`parent_id`			int, 
	`remark`			varchar (100)
);

CREATE TABLE `personnel_cardtype`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`cardtypecode`			varchar (100), 
	`cardtypename`			varchar (100)
);

CREATE TABLE `personnel_empchange`
 (
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`changeno`			int, 
	`UserID_id`			int, 
	`changedate`			datetime, 
	`changepostion`			int, 
	`oldvalue`			varchar (100), 
	`newvalue`			varchar (100), 
	`changereason`			varchar (100), 
	`isvalid`			char NOT NULL, 
	`approvalstatus`			int, 
	`remark`			varchar (100)
);

CREATE TABLE `personnel_leavelog`
 (
	`id`			varchar (100), 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`UserID_id`			int, 
	`leavedate`			datetime, 
	`leavetype`			int, 
	`reason`			varchar (100), 
	`isReturnTools`			char NOT NULL, 
	`isReturnClothes`			char NOT NULL, 
	`isReturnCard`			char NOT NULL, 
	`isClassAtt`			char NOT NULL, 
	`isClassAccess`			char NOT NULL
);

CREATE TABLE `ReportItem`
 (
	`RIID`			int NOT NULL, 
	`RIIndex`			int, 
	`ShowIt`			int, 
	`RIName`			varchar (24), 
	`UnitName`			varchar (12), 
	`Formula`			varchar (255) NOT NULL, 
	`CalcBySchClass`			int, 
	`StatisticMethod`			int, 
	`CalcLast`			int, 
	`Notes`			varchar (255)
);

CREATE TABLE `SchClass`
 (
	`schClassid`			int NOT NULL, 
	`schName`			varchar (40) NOT NULL, 
	`StartTime`			datetime NOT NULL, 
	`EndTime`			datetime NOT NULL, 
	`LateMinutes`			int, 
	`EarlyMinutes`			int, 
	`CheckIn`			int, 
	`CheckOut`			int, 
	`Color`			int, 
	`AutoBind`			int, 
	`CheckInTime1`			datetime, 
	`CheckInTime2`			datetime, 
	`CheckOutTime1`			datetime, 
	`CheckOutTime2`			datetime, 
	`WorkDay`			float, 
	`SensorID`			varchar (10), 
	`WorkMins`			float
);

CREATE TABLE `SECURITYDETAILS`
 (
	`SECURITYDETAILID`			int NOT NULL, 
	`USERID`			int, 
	`DEPTID`			int, 
	`SCHEDULE`			int, 
	`USERINFO`			int, 
	`ENROLLFINGERS`			int, 
	`REPORTVIEW`			int, 
	`REPORT`			varchar (20), 
	`ReadOnly`			char NOT NULL, 
	`FullControl`			char NOT NULL
);

CREATE TABLE `ServerLog`
 (
	`ID`			int NOT NULL, 
	`EVENT`			varchar (60) NOT NULL, 
	`USERID`			int NOT NULL, 
	`EnrollNumber`			varchar (60), 
	`parameter`			int, 
	`EVENTTIME`			datetime NOT NULL, 
	`SENSORID`			varchar (10), 
	`OPERATOR`			varchar (40)
);

CREATE TABLE `SHIFT`
 (
	`SHIFTID`			int NOT NULL, 
	`NAME`			varchar (40), 
	`USHIFTID`			int, 
	`STARTDATE`			datetime NOT NULL, 
	`ENDDATE`			datetime, 
	`RUNNUM`			int, 
	`SCH1`			int, 
	`SCH2`			int, 
	`SCH3`			int, 
	`SCH4`			int, 
	`SCH5`			int, 
	`SCH6`			int, 
	`SCH7`			int, 
	`SCH8`			int, 
	`SCH9`			int, 
	`SCH10`			int, 
	`SCH11`			int, 
	`SCH12`			int, 
	`CYCLE`			int, 
	`UNITS`			int
);

CREATE TABLE `TBKEY`
 (
	`PreName`			varchar (24), 
	`ONEKEY`			int
);

CREATE TABLE `TBSMSALLOT`
 (
	`REFERENCE`			int NOT NULL, 
	`SMSREF`			int NOT NULL, 
	`USERREF`			int NOT NULL, 
	`GENTM`			varchar (40)
);

CREATE TABLE `TBSMSINFO`
 (
	`REFERENCE`			int NOT NULL, 
	`SMSID`			varchar (32) NOT NULL, 
	`SMSINDEX`			int NOT NULL, 
	`SMSTYPE`			int, 
	`SMSCONTENT`			text (255), 
	`SMSSTARTTM`			varchar (40), 
	`SMSTMLENG`			int, 
	`GENTM`			varchar (40)
);

CREATE TABLE `TEMPLATE`
 (
	`TEMPLATEID`			int NOT NULL, 
	`USERID`			int NOT NULL, 
	`FINGERID`			int NOT NULL, 
	`TEMPLATE`			varchar (255), 
	`TEMPLATE2`			varchar (255), 
	`BITMAPPICTURE`			varchar (255), 
	`BITMAPPICTURE2`			varchar (255), 
	`BITMAPPICTURE3`			varchar (255), 
	`BITMAPPICTURE4`			varchar (255), 
	`USETYPE`			int, 
	`EMACHINENUM`			varchar (6), 
	`TEMPLATE1`			varchar (255), 
	`Flag`			int, 
	`DivisionFP`			int, 
	`TEMPLATE4`			varchar (255), 
	`TEMPLATE3`			varchar (255), 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`Valid`			int, 
	`Fpversion`			varchar (100), 
	`bio_type`			int, 
	`SN`			int, 
	`UTime`			datetime, 
	`FP10SIZE`			int, 
	`DuressFlag`			int, 
	`TEMPLATESIZE`			int
);

CREATE TABLE `USER_OF_RUN`
 (
	`USERID`			int NOT NULL, 
	`NUM_OF_RUN_ID`			int NOT NULL, 
	`STARTDATE`			datetime NOT NULL, 
	`ENDDATE`			datetime NOT NULL, 
	`ISNOTOF_RUN`			int, 
	`ORDER_RUN`			int
);

CREATE TABLE `USER_SPEDAY`
 (
	`USERID`			int NOT NULL, 
	`STARTSPECDAY`			datetime NOT NULL, 
	`ENDSPECDAY`			datetime, 
	`DATEID`			int NOT NULL, 
	`YUANYING`			varchar (400), 
	`DATE`			datetime
);

CREATE TABLE `UserACMachines`
 (
	`UserID`			int NOT NULL, 
	`Deviceid`			int NOT NULL
);

CREATE TABLE `UserACPrivilege`
 (
	`UserID`			int NOT NULL, 
	`DeviceID`			int NOT NULL, 
	`ACGroupID`			int, 
	`IsUseGroup`			char NOT NULL, 
	`TimeZone1`			int, 
	`TimeZone2`			int, 
	`TimeZone3`			int, 
	`verifystyle`			int
);

CREATE TABLE `USERINFO`
 (
	`USERID`			int NOT NULL, 
	`Badgenumber`			varchar (100), 
	`SSN`			varchar (40), 
	`Gender`			varchar (16), 
	`TITLE`			varchar (40), 
	`PAGER`			varchar (40), 
	`BIRTHDAY`			datetime, 
	`HIREDDAY`			datetime, 
	`street`			varchar (160), 
	`CITY`			varchar (100), 
	`STATE`			varchar (100), 
	`ZIP`			varchar (100), 
	`OPHONE`			varchar (40), 
	`FPHONE`			varchar (40), 
	`VERIFICATIONMETHOD`			int, 
	`DEFAULTDEPTID`			int, 
	`SECURITYFLAGS`			int, 
	`ATT`			int NOT NULL, 
	`INLATE`			int NOT NULL, 
	`OUTEARLY`			int NOT NULL, 
	`OVERTIME`			int NOT NULL, 
	`SEP`			int NOT NULL, 
	`HOLIDAY`			int NOT NULL, 
	`MINZU`			varchar (16), 
	`PASSWORD`			varchar (40), 
	`LUNCHDURATION`			int NOT NULL, 
	`PHOTO`			varchar (255), 
	`mverifypass`			varchar (20), 
	`Notes`			varchar (255), 
	`privilege`			int, 
	`InheritDeptSch`			int, 
	`InheritDeptSchClass`			int, 
	`AutoSchPlan`			int, 
	`MinAutoSchInterval`			int, 
	`RegisterOT`			int, 
	`InheritDeptRule`			int, 
	`EMPRIVILEGE`			int, 
	`CardNo`			varchar (40), 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`lastname`			varchar (100), 
	`AccGroup`			int, 
	`TimeZones`			varchar (100), 
	`identitycard`			varchar (100), 
	`UTime`			datetime, 
	`Education`			varchar (100), 
	`OffDuty`			int, 
	`DelTag`			int, 
	`morecard_group_id`			int, 
	`set_valid_time`			char NOT NULL, 
	`acc_startdate`			datetime, 
	`acc_enddate`			datetime, 
	`birthplace`			varchar (100), 
	`Political`			varchar (100), 
	`contry`			varchar (100), 
	`hiretype`			int, 
	`email`			varchar (100), 
	`firedate`			datetime, 
	`isatt`			char NOT NULL, 
	`homeaddress`			varchar (100), 
	`emptype`			int, 
	`bankcode1`			varchar (100), 
	`bankcode2`			varchar (100), 
	`isblacklist`			int, 
	`Iuser1`			int, 
	`Iuser2`			int, 
	`Iuser3`			int, 
	`Iuser4`			int, 
	`Iuser5`			int, 
	`Cuser1`			varchar (100), 
	`Cuser2`			varchar (100), 
	`Cuser3`			varchar (100), 
	`Cuser4`			varchar (100), 
	`Cuser5`			varchar (100), 
	`Duser1`			datetime, 
	`Duser2`			datetime, 
	`Duser3`			datetime, 
	`Duser4`			datetime, 
	`Duser5`			datetime, 
	`reserve`			int, 
	`name`			varchar (100), 
	`OfflineBeginDate`			datetime, 
	`OfflineEndDate`			datetime, 
	`carNo`			varchar (100), 
	`carType`			varchar (100), 
	`carBrand`			varchar (100), 
	`carColor`			varchar (100)
);

CREATE TABLE `userinfo_attarea`
 (
	`id`			int, 
	`employee_id`			int, 
	`area_id`			int
);

CREATE TABLE `UsersMachines`
 (
	`ID`			int NOT NULL, 
	`USERID`			int NOT NULL, 
	`DEVICEID`			int NOT NULL
);

CREATE TABLE `UserUpdates`
 (
	`UpdateId`			int NOT NULL, 
	`BadgeNumber`			varchar (40)
);

CREATE TABLE `worktable_groupmsg`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`msgtype_id`			int, 
	`group_id`			int
);

CREATE TABLE `worktable_instantmsg`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`monitor last time`			datetime, 
	`msgtype_id`			int, 
	`content`			varchar (100)
);

CREATE TABLE `worktable_msgtype`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`msgtype_name`			varchar (100), 
	`msgtype_value`			varchar (100), 
	`msg_keep_time`			int, 
	`msg_ahead_remind`			int, 
	`type`			varchar (100)
);

CREATE TABLE `worktable_usrmsg`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`user_id`			int, 
	`msg_id`			varchar (100)
);

CREATE TABLE `ZKAttendanceMonthStatistics`
 (
	`Id`			int NOT NULL, 
	`USERID`			int, 
	`PortalSite`			int, 
	`Department`			int, 
	`Employee`			int, 
	`Year`			int, 
	`Month`			int, 
	`YingDao`			numeric (17), 
	`ShiDao`			numeric (17), 
	`ChiDao`			numeric (17), 
	`ZaoTui`			numeric (17), 
	`KuangGong`			numeric (17), 
	`JiaBan`			numeric (17), 
	`WaiChu`			numeric (17), 
	`YinGongWaiChu`			numeric (17), 
	`GongZuoShiJian`			numeric (17), 
	`YingQian`			numeric (17), 
	`QianDao`			numeric (17), 
	`QianTui`			numeric (17), 
	`WeiQianDao`			numeric (17), 
	`WeiQianTui`			numeric (17), 
	`QingJia`			numeric (17), 
	`PingRi`			numeric (17), 
	`ZhouMo`			numeric (17), 
	`JieJiaRi`			numeric (17), 
	`ChuQinShiJian`			numeric (17), 
	`PingRiJiaBan`			numeric (17), 
	`ZhouMoJiaBan`			numeric (17), 
	`JieJiaRiJiaBan`			numeric (17)
);

CREATE TABLE `acc_levelset_emp`
 (
	`id`			int, 
	`acclevelset_id`			int NOT NULL, 
	`employee_id`			int NOT NULL
);

CREATE TABLE `acc_morecardset`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`door_id`			int, 
	`comb_name`			varchar (100), 
	`CombNo`			int
);

CREATE TABLE `ACUnlockComb`
 (
	`UnlockCombID`			int NOT NULL, 
	`Name`			varchar (60), 
	`Group01`			int, 
	`Group02`			int, 
	`Group03`			int, 
	`Group04`			int, 
	`Group05`			int
);

CREATE TABLE `AttParam`
 (
	`PARANAME`			varchar (40) NOT NULL, 
	`PARATYPE`			varchar (4), 
	`PARAVALUE`			varchar (200) NOT NULL
);

CREATE TABLE `auth_group`
 (
	`id`			int, 
	`name`			varchar (100), 
	`Permission`			text (255), 
	`Remark`			text (255)
);

CREATE TABLE `AUTHDEVICE`
 (
	`ID`			int NOT NULL, 
	`USERID`			int NOT NULL, 
	`MachineID`			int NOT NULL
);

CREATE TABLE `base_option`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`name`			varchar (100), 
	`app_label`			varchar (100), 
	`catalog`			varchar (100), 
	`group`			varchar (100), 
	`widget`			varchar (100), 
	`required`			char NOT NULL, 
	`validator`			varchar (100), 
	`verbose_name`			varchar (100), 
	`help_text`			varchar (100), 
	`visible`			char NOT NULL, 
	`default`			varchar (100), 
	`read_only`			char NOT NULL, 
	`for_personal`			char NOT NULL, 
	`type`			varchar (100)
);

CREATE TABLE `dbapp_viewmodel`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`model_id`			int, 
	`name`			varchar (100), 
	`info`			varchar (100), 
	`viewtype`			varchar (100)
);

CREATE TABLE `FingerVein`
 (
	`FVID`			int, 
	`UserID`			int, 
	`FingerID`			int, 
	`Template`			varchar (255), 
	`Size`			int, 
	`DuressFlag`			int, 
	`UserCode`			varchar (100), 
	`Fv_ID_Index`			int
);

CREATE TABLE `devlog`
 (
	`id`			int, 
	`SN_id`			int, 
	`OP`			varchar (100), 
	`Object`			varchar (100), 
	`Cnt`			int, 
	`ECnt`			int, 
	`OpTime`			datetime
);

CREATE TABLE `HOLIDAYS`
 (
	`HOLIDAYID`			int NOT NULL, 
	`HOLIDAYNAME`			varchar (40), 
	`HOLIDAYYEAR`			int, 
	`HOLIDAYMONTH`			int, 
	`HOLIDAYDAY`			int, 
	`STARTTIME`			datetime, 
	`DURATION`			int, 
	`HOLIDAYTYPE`			int, 
	`XINBIE`			varchar (8), 
	`MINZU`			varchar (100), 
	`DeptID`			int
);

CREATE TABLE `personnel_issuecard`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`UserID_id`			int, 
	`cardno`			varchar (100), 
	`effectivenessdate`			datetime, 
	`isvalid`			char NOT NULL, 
	`cardpwd`			varchar (100), 
	`failuredate`			datetime, 
	`cardstatus`			varchar (100), 
	`issuedate`			datetime
);

CREATE TABLE `SystemLog`
 (
	`ID`			int NOT NULL, 
	`Operator`			varchar (40), 
	`LogTime`			datetime, 
	`MachineAlias`			varchar (40), 
	`LogTag`			int, 
	`LogDescr`			varchar (100)
);

CREATE TABLE `USER_TEMP_SCH`
 (
	`USERID`			int NOT NULL, 
	`COMETIME`			datetime NOT NULL, 
	`LEAVETIME`			datetime NOT NULL, 
	`TYPE`			int, 
	`FLAG`			int, 
	`SCHCLASSID`			int NOT NULL, 
	`OVERTIME`			int
);

CREATE TABLE `UserUsedSClasses`
 (
	`UserId`			int, 
	`SchId`			int
);

CREATE TABLE `acc_monitor_log`
 (
	`id`			int, 
	`change_operator`			varchar (100), 
	`change_time`			datetime, 
	`create_operator`			varchar (100), 
	`create_time`			datetime, 
	`delete_operator`			varchar (100), 
	`delete_time`			datetime, 
	`status`			int, 
	`log_tag`			int, 
	`time`			datetime, 
	`pin`			varchar (100), 
	`card_no`			varchar (100), 
	`device_id`			int, 
	`device_sn`			varchar (100), 
	`device_name`			varchar (100), 
	`verified`			int, 
	`state`			int, 
	`event_type`			int, 
	`description`			varchar (400), 
	`event_point_type`			int, 
	`event_point_id`			int, 
	`event_point_name`			varchar (100)
);

CREATE TABLE `OfflinePermitGroups`
 (
	`id`			int, 
	`GroupName`			varchar (48), 
	`BeginDate`			datetime, 
	`EndDate`			datetime
);

CREATE TABLE `OfflinePermitUsers`
 (
	`id`			int, 
	`GroupId`			int, 
	`Pin`			varchar (48), 
	`ChkPwd`			char NOT NULL, 
	`ChkFp`			char NOT NULL
);

CREATE TABLE `OfflinePermitDoors`
 (
	`id`			int, 
	`GroupId`			int, 
	`DeviceId`			int, 
	`DoorNo`			int
);

CREATE TABLE `LossCard`
 (
	`id`			int, 
	`Pin`			varchar (40), 
	`CardNo`			varchar (100), 
	`LossDate`			datetime
);

CREATE TABLE `TmpPermitGroups`
 (
	`id`			int, 
	`GroupName`			varchar (48), 
	`BeginDate`			datetime, 
	`EndDate`			datetime
);

CREATE TABLE `TmpPermitUsers`
 (
	`id`			int, 
	`GroupId`			int, 
	`CertifiNo`			varchar (100), 
	`UserName`			varchar (48), 
	`Gender`			varchar (4), 
	`CardNo`			varchar (40), 
	`OfflineBeginDate`			datetime, 
	`OfflineEndDate`			datetime
);

CREATE TABLE `TmpPermitDoors`
 (
	`id`			int, 
	`GroupId`			int, 
	`DeviceId`			int, 
	`DoorNo`			int
);

CREATE TABLE `ParamSet`
 (
	`ParamName`			varchar (40), 
	`ParamValue`			varchar (200)
);

CREATE TABLE `acc_reader`
 (
	`id`			int, 
	`door_id`			int, 
	`reader_no`			int, 
	`reader_name`			varchar (100), 
	`reader_state`			int
);

CREATE TABLE `acc_auxiliary`
 (
	`id`			int, 
	`device_id`			int, 
	`aux_no`			int, 
	`printer_number`			varchar (100), 
	`aux_name`			varchar (100), 
	`aux_state`			int
);

CREATE TABLE `STD_WiegandFmt`
 (
	`id`			int, 
	`DoorId`			int, 
	`OutWiegandFmt`			varchar (200), 
	`OutFailureId`			int, 
	`OutAreaCode`			int, 
	`OutPulseWidth`			int, 
	`OutPulseInterval`			int, 
	`OutContent`			int, 
	`InWiegandFmt`			varchar (200), 
	`InBitCount`			int, 
	`InPulseWidth`			int, 
	`InPulseInterval`			int, 
	`InContent`			int
);

CREATE TABLE `CustomReport`
 (
	`id`			int, 
	`ReportName`			varchar (100), 
	`Memo`			varchar (100)
);

CREATE TABLE `ReportField`
 (
	`CRId`			int, 
	`TableName`			varchar (100), 
	`FieldName`			varchar (100), 
	`ShowIndex`			int
);


