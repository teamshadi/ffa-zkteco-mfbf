<?php

namespace FfaZktecoMfbf;

class OdbcTest extends DbhWrapperTest {

  static public $locksRaw = [
    ['DEPTNAME'=>'pmo','mfid_lb'=>'shadi',  'bfid_lb'=>'shadi',  'Name'=>'Shadi Akiki','Locked'=>1],
    ['DEPTNAME'=>'pmo','mfid_lb'=>'minerva','bfid_lb'=>'minerva','Name'=>'Minerva Moawad','Locked'=>0]
  ];

  public function setUp() {
    $this->odbc = new Odbc(self::$dbh);
  }

  public function testConstruct() {
    $this->assertInstanceOf(
      DbhWrapper::class,
      $this->odbc->dbh
    );
  }

  public function testSetEmpty() {
    $this->odbc->set([]);
  }

  public function testSetNonEmpty() {
    $this->odbc->set(self::$locksRaw);
  }

} // end class
