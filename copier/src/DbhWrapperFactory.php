<?php

namespace FfaZktecoMfbf;

class DbhWrapperFactory {

  function __construct(PdoFactory $pdo=null, array $env=null) {
    if(is_null($pdo)) {
    }
    $this->pdo=$pdo;

    if(is_null($env)) {
      $env = Copier::getenv();
    }
    $this->env = $env;
  }

  public function mysql() {
    $dbhTemp = $this->pdo->mysql(
      $this->env['UPDATER_MYSQLHOST'],
      $this->env['MYSQL_DATABASE'],
      $this->env['MYSQL_USER'],
      $this->env['MYSQL_PASSWORD']
    );

    return new DbhWrapper($dbhTemp);
  }

  public function odbc(int $db) {
    $dbh = $this->pdo->odbc(
      $this->env['COPIER_TO_'.$db.'_ODBC'],
      $this->env['COPIER_TO_'.$db.'_DATABASE'],
      $this->env['COPIER_TO_'.$db.'_USER'],
      $this->env['COPIER_TO_'.$db.'_PASSWORD']
    );

    return new DbhWrapper($dbh);
  }
}
