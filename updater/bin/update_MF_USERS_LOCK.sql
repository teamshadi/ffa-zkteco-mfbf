-- each user's current state in/out of bank based on CHECKTIME but based on last-added row
insert into MF_USERS_LOCK
select distinct
USERINFO.USERID,
DEPARTMENTS.DEPTNAME,

-- below mfid/bfid variables also used in copier/src/Odbc#set()
USERINFO.MINZU as mfid_lb,
USERINFO.TITLE as bfid_lb,
USERINFO.SSN as mfid_db,
USERINFO.OPHONE as bfid_db,

USERINFO.Name,
case(MF_USERS_STATE.state)
	when 'lock' then TRUE
	when 'unlock' then FALSE
	else
		case
			when CHECKTIME>=curdate() -- and CHECKTIME<now()
			then 
				case(CHECKINOUT.CHECKTYPE)
					when 'O' then TRUE
					else FALSE
				end
			else TRUE -- lock absent users
		end
end as Locked,
case
	when CHECKTIME>=curdate() -- and CHECKTIME<now()
	then 
		case(CHECKINOUT.CHECKTYPE)
			when 'O' then FALSE
			else TRUE
		end
	else FALSE -- lock absent users
end as inBldg
from (
	select CHECKINOUT.USERID,CHECKTYPE,CHECKTIME
	from CHECKINOUT
	right join (
	    SELECT max(CHECKTIME) as id,USERID -- id, CHECKTIME
	    FROM CHECKINOUT
	    where CHECKTIME>=curdate()
	    group by USERID
	) a on a.USERID=CHECKINOUT.USERID and a.id=CHECKINOUT.CHECKTIME -- id / CHECKTIME
--	union -- add absent people ... this is very slow
--	(
--		select USERINFO.USERID,'O' as CHECKTYPE,'1990-01-01' as id
--		from USERINFO
--		where USERINFO.USERID not in (
--			SELECT distinct USERID
--			FROM CHECKINOUT
--			where CHECKTIME>=curdate()
--		)
--	)

) CHECKINOUT
left join USERINFO on CHECKINOUT.USERID=USERINFO.USERID
left join DEPARTMENTS on DEPARTMENTS.DEPTID=USERINFO.DEFAULTDEPTID
left join MF_USERS_STATE on USERINFO.USERID=MF_USERS_STATE.USERID
;
