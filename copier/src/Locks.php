<?php

namespace FfaZktecoMfbf;

class Locks extends Mysql {
  function withStates() {

    // Do the query
    $secQ = "SELECT INTERNAL_USERS_LOCK.*,
      case
         -- default is unlocked if not there
        -- this should be in sync with the default in update_INTERNAL_USERS_LOCK
        when MF_USERS_STATE.state is NULL then 'unlock'
        else MF_USERS_STATE.state
      end as state
      from INTERNAL_USERS_LOCK 
      left join MF_USERS_STATE on MF_USERS_STATE.USERID = INTERNAL_USERS_LOCK.USERID
      where INTERNAL_USERS_LOCK.USERID!='NULL'
       order by Locked, DEPTNAME, INTERNAL_USERS_LOCK.Name;
      ";
    return $this->dbh->query($secQ);
  }


  function raw() {
    // Do the query
    $secQ = "SELECT * from INTERNAL_USERS_LOCK;"; #  -- limit 5;
    return $this->dbh->query($secQ);
  }

  function update() {
    $this->dbh->exec("truncate INTERNAL_USERS_LOCK;");
    $sql = file_get_contents(__DIR__.'/update_INTERNAL_USERS_LOCK.sql');
    return $this->dbh->exec($sql);
  }

}
