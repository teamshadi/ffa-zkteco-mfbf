<?php

namespace FfaZktecoMfbf;

class MysqlTest extends DbhWrapperTest {

  public function test() {
    $mysql = new Mysql(self::$dbh);
    $this->assertInstanceOf(
      DbhWrapper::class,
      $mysql->dbh
    );
  }

} // end class
