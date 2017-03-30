<?php

namespace FfaZktecoMfbf;

class Odbc {

  function __construct(DbhWrapper $dbh=null) {
    if(is_null($dbh)) {
      // use 1st odbc source by default
      $odbcIni=new OdbcIni();
      $ini=$odbcIni->parse();
      $first=array_keys($ini)[0];
      $fac = new DbhWrapperFactory();
      $dbh = $fac->odbc($first);
    }
    $this->dbh = $dbh;
    $this->tableName = $this->getenvOrFail("SQL_SERVER_TABLE");
  }

  private function getenvOrFail(string $name) {
    $value = getenv($name);
    if(!$value) {
      throw new \Exception("Env var $name undefined");
    }
    return $value;
  }

  // secD: output from Locks->raw
  public function set(array $secD) {

    // set suffix
    $db='lb';
    if(in_array($this->dbh->name,['MarketflowAccDB','MarketflowBsalimDxb'])) {
      $db='db';
    }

    // variable name in sync with updater/bin/update_INTERNAL_USERS_LOCK.sql
    $mfid='mfid_'.$db;
    $bfid='bfid_'.$db;

    $this->dbh->exec("truncate table ".$this->tableName);

    // if no data
    if(count($secD)==0) {
      return;
    }

    $query = [];
    foreach($secD as $x) {
      array_push(
        $query,
        sprintf(
          'insert into %s values ("%s","%s","%s","%s","%s")',
          $this->tableName,
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

  public function get() {
    return $this->dbh->query("select * from ".$this->tableName);
  }

}
