<?php

namespace FfaZktecoMfbf;

class DbhWrapperTest extends \PHPUnit_Framework_TestCase {

  public function test() {
    $fac = new PdoFactory();
    $dbh1=$fac->mysql('127.0.0.1','ffa_price_farm','ffaFingerprints','fp1298');
    $dbh2 = new DbhWrapper($dbh1,'mysql phpunit');
    $res = $dbh2->query('select * from MF_USERS_LOCK');
    $this->assertLessThan(2,1);
    $this->assertLessThan(count($res),1);
    $this->assertTrue(is_array(array_values($res)[0]));
  }

} // end class
