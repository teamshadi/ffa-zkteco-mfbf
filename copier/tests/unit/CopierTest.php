<?php

namespace FfaZktecoMfbf;

class CopierTest extends \PHPUnit_Framework_TestCase {

  public function test() {
    $locks = $this->getMockBuilder('\FfaZktecoMfbf\Locks')
                 ->disableOriginalConstructor() 
                 ->getMock();
    $locks->method('raw')
        ->willReturn(OdbcTest::$locksRaw);

    $odbc = $this->getMockBuilder('\FfaZktecoMfbf\Odbc')
                 ->disableOriginalConstructor() 
                 ->getMock();
    $odbc->method('set')
        ->willReturn(null);

    $copier = new Copier($locks,$odbc);
    $copier->copyLocksToOdbc();
  }

} // end class
