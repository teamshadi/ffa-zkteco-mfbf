<?php

namespace FfaZktecoMfbf;

class DbhWrapperFactoryTest extends \PHPUnit_Framework_TestCase {

  public function setUp() {
    $dbh = new \Pdo('sqlite::memory:');

    $this->pdo = $this->getMockBuilder('\FfaZktecoMfbf\PdoFactory')
                 ->disableOriginalConstructor() 
                 ->getMock();
    $this->pdo->method('mysql')
        ->willReturn($dbh);
    $this->pdo->method('odbc')
        ->willReturn($dbh);
  }

  public function testMysql() {
    $env=array_flip(['UPDATER_MYSQLHOST','MYSQL_DATABASE','MYSQL_USER','MYSQL_PASSWORD']);

    $fac = new DbhWrapperFactory($this->pdo,$env);
    $dbh = $fac->mysql();
    $this->assertInstanceOf(DbhWrapper::class,$dbh);
  }

  public function testOdbc() {
    $env=array_flip(['COPIER_TO_1_ODBC','COPIER_TO_1_DATABASE','COPIER_TO_1_USER','COPIER_TO_1_PASSWORD']);

    $fac = new DbhWrapperFactory($this->pdo,$env);
    $dbh = $fac->odbc(1);
    $this->assertInstanceOf(DbhWrapper::class,$dbh);
  }

} // end class
