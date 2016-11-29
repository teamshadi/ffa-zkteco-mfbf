<?php

namespace FfaZktecoMfbf;

class Mysql {

  function __construct(DbhWrapper $dbh=null) {
    if(is_null($dbh)) {
      $fac = new DbhWrapperFactory();
      $dbh = $fac->mysql();
    }

    $this->dbh = $dbh;
  }

}
