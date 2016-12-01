<?php

namespace FfaZktecoMfbf;

class Checkinout extends Mysql {

  function getMax() {

    // Do the query
    $secQ = "SELECT max(time) time from acc_monitor_log;";
    $secD = $this->dbh->query($secQ);
    return $secD[0]['time'];
  }


}
