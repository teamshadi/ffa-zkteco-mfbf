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

    $fac = $this->getMockBuilder('\FfaZktecoMfbf\DbhWrapperFactory')
                 ->disableOriginalConstructor() 
                 ->getMock();
    $fac->method('odbc')
        ->willReturn($odbc);

    $ini = [
      'marketflow' => [
        'Database' => 'database',
        'PWD' => 'password',
        'UID' => 'user'
      ]
    ];
    $odbcIni = $this->getMockBuilder('\FfaZktecoMfbf\OdbcIni')
                 ->disableOriginalConstructor() 
                 ->getMock();
    $odbcIni->method('parse')
        ->willReturn($ini);

    $copier = new Copier($locks,$fac,$odbcIni);
    $copier->copyLocksToOdbc();
  }

} // end class
