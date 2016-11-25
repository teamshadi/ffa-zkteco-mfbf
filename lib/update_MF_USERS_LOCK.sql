-- each user's current state in/out of bank based on CHECKTIME but based on last-added row
insert into MF_USERS_LOCK
select distinct
USERINFO.USERID,
DEPARTMENTS.DEPTNAME,
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
			when time>=curdate() -- and time<now()
			then 
				case(acc_monitor_log.state)
					when '1' then TRUE
					else FALSE
				end
			else TRUE -- lock absent users
		end
end as Locked,
case
	when time>=curdate() -- and TIME<now()
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
	) a on a.pin=acc_monitor_log.pin and a.id=acc_monitor_log.time -- id / CHECKTIME
	union -- add absent people ... this is very slow
	(
		select USERINFO.USERID,'O' as CHECKTYPE,'1990-01-01' as id
		from USERINFO
		where USERINFO.USERID not in (
			SELECT distinct pin
			FROM acc_monitor_log
			where time>=curdate()
		)
	)

) acc_monitor_log
left join USERINFO on acc_monitor_log.pin=USERINFO.USERID
left join DEPARTMENTS on DEPARTMENTS.DEPTID=USERINFO.DEFAULTDEPTID
left join MF_USERS_STATE on USERINFO.USERID=MF_USERS_STATE.USERID
;
