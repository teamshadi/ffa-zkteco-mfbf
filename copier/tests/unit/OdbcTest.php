<?php

namespace FfaZktecoMfbf;

class OdbcTest extends DbhWrapperTest {

  static public $locksRaw = [
    ['DEPTNAME'=>'pmo','mf'=>'shadi',  'bf'=>'shadi',  'Name'=>'Shadi Akiki','Locked'=>1],
    ['DEPTNAME'=>'pmo','mf'=>'minerva','bf'=>'minerva','Name'=>'Minerva Moawad','Locked'=>0]
  ];

  public function setUp() {
    $env = ['COPIER_TO_1_FIELD_MF'=>'mf','COPIER_TO_1_FIELD_BF'=>'bf'];
    $this->odbc = new Odbc(self::$dbh,$env);
  }

  public function testConstruct() {
    $this->assertInstanceOf(
      DbhWrapper::class,
      $this->odbc->dbh
    );
  }

  public function testSetEmpty() {
    $this->odbc->set(1,[]);
  }

  public function testSetNonEmpty() {
    $this->odbc->set(1,self::$locksRaw);
  }

} // end class
