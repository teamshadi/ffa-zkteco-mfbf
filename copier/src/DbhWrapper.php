<?php

namespace FfaZktecoMfbf;

class DbhWrapper {

  public $dbh;
  public $name;
  function __construct(\PDO $dbh, string $name) {
    $this->dbh = $dbh;
    $this->name = $name;
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
    $result = $stmt->fetchAll(\PDO::FETCH_ASSOC);

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
