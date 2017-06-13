-- each user's current state in/out of bank based on "time" field but based on last-added row
insert into INTERNAL_USERS_LOCK
select distinct
USERINFO.Badgenumber as USERID,
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
	when 'auto' then
		case
			when time>=curdate() -- and time<now()
			then 
				case(acc_monitor_log.state)
					when '1' then TRUE
					else FALSE
				end
			else TRUE -- lock absent users
		end
  else FALSE -- default at initialization is all users unlocked
end as Locked,
case
	when time>=curdate() -- and time<now()
	then 
		case(acc_monitor_log.state)
			when '1' then FALSE
			else TRUE
		end
	else FALSE -- lock absent users
end as inBldg
from (
	select acc_monitor_log.pin,state,time
	from acc_monitor_log
	right join (
	    SELECT max(time) as id,pin -- id, time
	    FROM acc_monitor_log
	    where time>=curdate()
	    group by pin
	) a on a.pin=acc_monitor_log.pin and a.id=acc_monitor_log.time -- id / time
	union -- add absent people ... this is very slow
	(
		select USERINFO.Badgenumber as pin,'1' as state,'1990-01-01' as time
		from USERINFO
		where USERINFO.Badgenumber not in (
			SELECT distinct pin
			FROM acc_monitor_log
			where time>=curdate()
		)
	)

) acc_monitor_log
left join USERINFO on acc_monitor_log.pin=USERINFO.Badgenumber
left join DEPARTMENTS on DEPARTMENTS.DEPTID=USERINFO.DEFAULTDEPTID
left join MF_USERS_STATE on USERINFO.Badgenumber=MF_USERS_STATE.USERID
;
