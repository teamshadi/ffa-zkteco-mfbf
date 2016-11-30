<?php

namespace FfaZktecoMfbf;

class APITest extends \PHPUnit_Framework_TestCase {

  public function setUp() {
    $states = $this->getMockBuilder('\FfaZktecoMfbf\States')
                 ->disableOriginalConstructor() 
                 ->getMock();
    $states->method('get')
        ->willReturn([]);
    $states->method('put')
        ->willReturn(null);

    $checkinout = $this->getMockBuilder('\FfaZktecoMfbf\Checkinout')
                 ->disableOriginalConstructor() 
                 ->getMock();
    $checkinout->method('getMax')
        ->willReturn('1234-12-34');

    $locks = $this->getMockBuilder('\FfaZktecoMfbf\Locks')
                 ->disableOriginalConstructor() 
                 ->getMock();
    $locks->method('raw')
        ->willReturn(OdbcTest::$locksRaw);

    $this->api = new API($states,$checkinout,$locks);
  }

  /**
   * @expectedException Exception
   */
  public function testCliWrong() {
    $x = $this->api->cli(1,['api.php']);
  }

  public function testCliRight() {
    $x = $this->api->cli(3,['api.php','GET','lastUpdate']);
  }

  public function testHandleGetLastupdate() {
    $s=['REQUEST_METHOD'=>'GET'];
    $g=['action'=>'lastUpdate'];
    $x = $this->api->handle($s,$g,[]);
    $this->assertNotNull($x);
  }

  public function testHandleGetUsers() {
    $s=['REQUEST_METHOD'=>'GET'];
    $g=['action'=>'users'];
    $x = $this->api->handle($s,$g,[]);
    $this->assertNotNull($x);
  }

  public function testHandlePost() {
    $s=['REQUEST_METHOD'=>'POST'];
    $p=['data'=>'[]'];
    $x = $this->api->handle($s,[],$p);
    $this->assertNotNull($x);
  }

} // end class
