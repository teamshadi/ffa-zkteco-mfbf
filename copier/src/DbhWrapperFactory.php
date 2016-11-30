<?php

namespace FfaZktecoMfbf;

class DbhWrapperFactory {

  function __construct(PdoFactory $pdo=null, array $env=null, OdbcIni $odbcIni=null) {
    if(is_null($pdo)) {
      $pdo=new PdoFactory();
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
      $required = ['UPDATER_MYSQLHOST', 'MYSQL_DATABASE', 'MYSQL_USER', 'MYSQL_PASSWORD'];
      foreach($required as $key) {
        if(!$this->env[$key]) {
          throw new \Exception("Missing env var $key");
        }
      }

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

    // alert about missing fields
    $required = ['Database','UID','PWD'];
    $missing = array_diff($required,array_keys($selected));
    if(count($missing)>0) {
      throw new \Exception("odbc.ini file for $name is missing fields: ".implode(', ',$missing));
    }

    // make connection
    $dbh = $this->pdo->odbc(
      $name,
      $selected['Database'],
      $selected['UID'],
      $selected['PWD']
    );

    return new DbhWrapper($dbh,$name);
  }
}
