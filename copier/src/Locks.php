<?php

namespace FfaZktecoMfbf;

class Locks extends Mysql {
  function withStates() {

    // Do the query
    $secQ = "SELECT MF_USERS_LOCK.*,
      case
        when MF_USERS_STATE.state is NULL then 'auto'
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
    $secQ = "SELECT * from MF_USERS_LOCK;";
    return $this->dbh->query($secQ);
  }

}
