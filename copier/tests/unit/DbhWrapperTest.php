<?php

namespace FfaZktecoMfbf;

class DbhWrapperTest extends \PHPUnit_Framework_TestCase {

  static public $dbh;
  static public function setUpBeforeClass() {
    self::$dbh = new DbhWrapper(new \PDO("sqlite::memory:"));
  }

  public function test() {
    self::$dbh->exec('create table bla');

    $this->assertNotNull(self::$dbh->query('select 1 as a'));
    $this->assertNotNull(self::$dbh->exec('drop table bla'));
  }

} // end class
