<?php

namespace FfaZktecoMfbf;

class DbhWrapperFactory {

  function __construct(PdoFactory $pdo=null, array $env=null, OdbcIni $odbcIni=null) {
    if(is_null($pdo)) {
    }
    $this->pdo=$pdo;

    if(is_null($env)) {
      $env = Copier::getenv();
    }
    $this->env = $env;

    if(is_null($odbcIni)) {
      $odbcIni = new OdbcIni();
    }
    $this->odbcIni = $odbcIni;

  }

  public function mysql() {
    $dbhTemp = $this->pdo->mysql(
      $this->env['UPDATER_MYSQLHOST'],
      $this->env['MYSQL_DATABASE'],
      $this->env['MYSQL_USER'],
      $this->env['MYSQL_PASSWORD']
    );

    return new DbhWrapper($dbhTemp,'mysql');
  }

  // $name    name of odbc dsn, as in /etc/odbc.ini
  public function odbc(string $name) {
    $ini = $this->odbcIni->parse();

    if(!array_key_exists($name,$ini)) {
      throw new \Exception("ODBC DSN \"$name\" does not exist. Use one of: ".implode(', ',array_keys($ini)));
    }

    $selected = $ini[$name];
    $dbh = $this->pdo->odbc(
      $name,
      $selected['Database'],
      $selected['UID'],
      $selected['PWD']
    );

    return new DbhWrapper($dbh,$name);
  }
}
