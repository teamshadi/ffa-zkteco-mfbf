<?php

namespace FfaZktecoMfbf;

class PdoFactoryTest extends \PHPUnit_Framework_TestCase {

  static public $pdoh, $env;
  static public function setUpBeforeClass() {
    self::$env = Copier::getenv();
    $notfound = array_filter(self::$env,function($x) { return !$x; });
    if(count($notfound)>0) {
      self::markTestSkipped("Missing env variable: ".implode(', ',array_keys($notfound)));
    }

    self::$pdoh = new PdoFactory();
  }
  public function tearDown() {
    self::$pdoh->disconnect();
  }

  public function testMysql() {
    self::$pdoh->mysql(
      self::$env['UPDATER_MYSQLHOST'].':3306',
      self::$env['MYSQL_DATABASE'],
      self::$env['MYSQL_USER'],
      self::$env['MYSQL_PASSWORD']
    );
    $res = self::$pdoh->query('select count(*) as n from USERINFO');
    $this->assertLessThan(2,1);
    $this->assertLessThan(count($res),0);
  }

  public function testSqlserver() {
    self::$pdoh->connectOdbcDsn(
      self::$env['COPIER_TO_1_ODBC'], // from /etc/odbc.ini
      self::$env['COPIER_TO_1_DATABASE'],
      self::$env['COPIER_TO_1_USER'],
      self::$env['COPIER_TO_1_PASSWORD']
    );
    $res = self::$pdoh->query('select count(*) as n from MF_USERS_LOCK');
    $this->assertLessThan(2,1);
    $this->assertLessThan(count($res),0);
  }

} // end class
