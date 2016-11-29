<?php

namespace FfaZktecoMfbf;

class Checkinout extends Mysql {

  function getMax() {

    // Do the query
    $secQ = "SELECT max(CHECKTIME) CHECKTIME from CHECKINOUT;";
    $secD = $this->dbh->query($secQ);
    return $secD[0]['CHECKTIME'];
  }


}
