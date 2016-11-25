<?php

namespace FfaZktecoMfbf;

class PdoFactory {

  static private $dbh = null;

  private function setPdo(\PDO $dbh) {
    if(!is_null(self::$dbh)) {
      throw new \Exception("Please disconnect before reconnecting");
    }

    self::$dbh = $dbh;
  }

  public function query(string $sql) {
    if(is_null(self::$dbh)) {
      throw new \Exception("Need to call a connect function first");
    }

      /*** fetch into an PDOStatement object ***/
      $stmt = self::$dbh->query($sql);

      if(!$stmt) {
        throw new \Exception("Failed to execute query: $sql");
      }

      /*** echo number of columns ***/
      $result = $stmt->fetch(\PDO::FETCH_ASSOC);

      return $result;
  }

  public function disconnect() {
      /*** close the database connection ***/
      self::$dbh = null;
  }

  // https://phpro.org/tutorials/Introduction-to-PHP-PDO.html#8
  public function connectMysql(string $hostname = 'localhost', string $dbname = 'ffa_price_farm', string $username = 'username', $password = 'password') {
      $this->setPdo( new \PDO("mysql:host=$hostname;dbname=$dbname", $username, $password) );
  }

  public function connectOdbcDsn(string $dsn = 'MarketflowAcc', string $dbname, string $username = 'username', $password = 'password') {
      $this->setPdo(new \PDO("odbc:$dsn",$username,$password));
      $this->query("use $dbname;");
  }

}
