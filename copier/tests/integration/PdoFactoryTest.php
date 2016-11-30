<?php

namespace FfaZktecoMfbf;

class PdoFactoryTest extends \PHPUnit_Framework_TestCase {

  static public $pdoh, $env;
  static public function setUpBeforeClass() {
    // get env vars
    self::$env = Copier::getenv();

    // append test variables
    // set from /etc/odbc.ini ?
    self::$env = array_merge(
      self::$env,
      ['TEST_ODBC', 'TEST_DATABASE', 'TEST_USER', 'TEST_PASSWORD']
    );

    // check which were not found
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
    self::$pdoh->odbc(
      self::$env['TEST_ODBC'], 
      self::$env['TEST_DATABASE'],
      self::$env['TEST_USER'],
      self::$env['TEST_PASSWORD']
    );
    $res = self::$pdoh->query('select count(*) as n from MF_USERS_LOCK');
    $this->assertLessThan(2,1);
    $this->assertLessThan(count($res),0);
  }

} // end class
