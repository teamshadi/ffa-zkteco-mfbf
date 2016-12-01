<?php

namespace FfaZktecoMfbf;

class Locks extends Mysql {
  function withStates() {

    // Do the query
    $secQ = "SELECT MF_USERS_LOCK.*,
      case
         -- default is unlocked if not there
        -- this should be in sync with the default in update_MF_USERS_LOCK
        when MF_USERS_STATE.state is NULL then 'unlock'
        else MF_USERS_STATE.state
      end as state
      from MF_USERS_LOCK 
      left join MF_USERS_STATE on MF_USERS_STATE.USERID = MF_USERS_LOCK.USERID
      where MF_USERS_LOCK.USERID!='NULL'
       order by Locked, DEPTNAME, MF_USERS_LOCK.Name;
      ";
    return $this->dbh->query($secQ);
  }


  function raw() {
    // Do the query
    $secQ = "SELECT * from MF_USERS_LOCK -- limit 5;";
    return $this->dbh->query($secQ);
  }

  function update() {
    $this->dbh->exec("truncate MF_USERS_LOCK;");
    $sql = file_get_contents(__DIR__.'/update_MF_USERS_LOCK.sql');
    return $this->dbh->exec($sql);
  }

}
