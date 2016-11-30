<?php

namespace FfaZktecoMfbf;

class OdbcIniTest extends \PHPUnit_Framework_TestCase {

  public function test() {
    $fn = __DIR__.'/../../../etc/odbc-sample.ini';
    $odbcIni = new OdbcIni($fn);
    $ini=$odbcIni->parse();
    $this->assertTrue(is_array($ini));
  }

} // end class
