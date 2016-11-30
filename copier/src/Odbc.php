<?php

namespace FfaZktecoMfbf;

class Odbc {

  function __construct(DbhWrapper $dbh=null) {
    if(is_null($dbh)) {
      $fac = new DbhWrapperFactory();
      $dbh = $fac->odbc();
    }
    $this->dbh = $dbh;
  }

  // secD: output from Locks->raw
  public function set(array $secD) {

    // set suffix
    $db='lb';
    if(in_array($this->dbh->name,['MarketflowAccDB','MarketflowBsalimDxb'])) {
      $db='db';
    }

    // variable name in sync with updater/bin/update_MF_USERS_LOCK.sql
    $mfid='mfid_'.$db;
    $bfid='bfid_'.$db;

    $this->dbh->exec("truncate table MF_USERS_LOCK");

    // if no data
    if(count($secD)==0) {
      return;
    }

    $query = [];
    foreach($secD as $x) {
      array_push(
        $query,
        sprintf(
          'insert into MF_USERS_LOCK values ("%s","%s","%s","%s","%s")',
          $x['DEPTNAME'],
          $x[$mfid],
          $x[$bfid],
          $x['Name'],
          $x['Locked']
        )
      );
    }

    $this->dbh->exec(implode('; ',$query));
  }

}
