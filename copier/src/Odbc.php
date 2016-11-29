<?php

namespace FfaZktecoMfbf;

class Odbc {

  function __construct(DbhWrapper $dbh=null, array $env) {
    if(is_null($dbh)) {
      $fac = new DbhWrapperFactory();
      $dbh = $fac->odbc();
    }
    $this->dbh = $dbh;

    if(is_null($env)) {
      $env=Copier::getenv();
    }
    $this->env=$env;
  }

  // secD: output from Locks->raw
  public function set(int $db, array $secD) {
    $mfid=$this->env['COPIER_TO_'.$db.'_FIELD_MF'];
    $bfid=$this->env['COPIER_TO_'.$db.'_FIELD_BF'];

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
