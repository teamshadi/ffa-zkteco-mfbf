<?php

namespace FfaZktecoMfbf;

class Copier {

  function __construct(Locks $locks=null, DbhWrapperFactory $fac=null, OdbcIni $odbcIni=null) {
    if(is_null($locks)) {
      $locks = new Locks();
    }
    $this->locks = $locks;

    if(is_null($fac)) {
      $fac = new DbhWrapperFactory();
    }
    $this->fac = $fac;

    if(is_null($odbcIni)) {
      $odbcIni = new OdbcIni();
    }
    $this->odbcIni = $odbcIni;
  }

  static public function getenv() {
    $env = [
      'MYSQL_DATABASE' => false,
      'MYSQL_USER' => false,
      'MYSQL_PASSWORD' => false,

      'UPDATER_MYSQLHOST' => false
    ];

    foreach($env as $k=>&$v) {
      $v = getenv($k);
    }

    return $env;
  }

  public function copyLocksToOdbc() {
    $secD = $this->locks->raw();

    $ini = $this->odbcIni->parse();

    foreach($ini as $name=>$value) {
      $odbc = $this->fac->odbc($name);
      $odbc->set($secD);
    }
  }

}
