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

    $ini = [
      'marketflow' => [
        'Database' => 'database',
        'PWD' => 'password',
        'UID' => 'user'
      ]
    ];
    $this->odbcIni = $this->getMockBuilder('\FfaZktecoMfbf\OdbcIni')
                 ->disableOriginalConstructor() 
                 ->getMock();
    $this->odbcIni->method('parse')
        ->willReturn($ini);
  }

  public function testMysql() {
    $env=array_flip(['UPDATER_MYSQLHOST','MYSQL_DATABASE','MYSQL_USER','MYSQL_PASSWORD']);

    $fac = new DbhWrapperFactory($this->pdo,$env,$this->odbcIni);
    $dbh = $fac->mysql();
    $this->assertInstanceOf(DbhWrapper::class,$dbh);
  }

  public function testOdbc() {
    $env=[];

    $fac = new DbhWrapperFactory($this->pdo,$env,$this->odbcIni);
    $dbh = $fac->odbc('marketflow');
    $this->assertInstanceOf(DbhWrapper::class,$dbh);
  }

} // end class
