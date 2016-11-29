<?php

namespace FfaZktecoMfbf;

class DbhWrapper {

  public $dbh;
  function __construct(\PDO $dbh) {
    $this->dbh = $dbh;
  }

  public function query(string $sql) {
    if(is_null($this->dbh)) {
      throw new \Exception("Need to call a connect function first");
    }

    /*** fetch into an PDOStatement object ***/
    $stmt = $this->dbh->query($sql);

    if(!$stmt) {
      throw new \Exception("Failed to execute query: $sql");
    }

    /*** echo number of columns ***/
    $result = $stmt->fetch(\PDO::FETCH_ASSOC);

    return $result;
  }

  public function disconnect() {
      /*** close the database connection ***/
      $this->dbh = null;
  }

  public function exec(string $query) {
    return $this->dbh->exec($query);
  }

}
