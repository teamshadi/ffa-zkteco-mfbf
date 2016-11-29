<?php

namespace FfaZktecoMfbf;

class Copier {

  function __construct(Locks $locks=null, Odbc $odbc=null) {
    if(is_null($locks)) {
      $locks = new Locks();
    }
    $this->locks = $locks;

    if(is_null($odbc)) {
      $odbc = new Odbc();
    }
    $this->odbc = $odbc;
  }

  static public function getenv() {
    $env = [
      'MYSQL_DATABASE' => false,
      'MYSQL_USER' => false,
      'MYSQL_PASSWORD' => false,

      'UPDATER_MYSQLHOST' => false,

      'COPIER_TO_1_ODBC' => false,
      'COPIER_TO_1_DATABASE' => false,
      'COPIER_TO_1_USER' => false,
      'COPIER_TO_1_PASSWORD' => false,
      'COPIER_TO_1_FIELD_MF' => false,
      'COPIER_TO_1_FIELD_BF' => false,

      'COPIER_TO_2_ODBC' => false,
      'COPIER_TO_2_DATABASE' => false,
      'COPIER_TO_2_USER' => false,
      'COPIER_TO_2_PASSWORD' => false,
      'COPIER_TO_2_FIELD_MF' => false,
      'COPIER_TO_2_FIELD_BF' => false
    ];

    foreach($env as $k=>&$v) {
      $v = getenv($k);
    }

    return $env;
  }

  public function copyLocksToOdbc() {
    $secD = $this->locks->raw();
    $this->odbc->set(1,$secD);
    $this->odbc->set(2,$secD);
  }

}
