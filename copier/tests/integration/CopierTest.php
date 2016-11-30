<?php

namespace FfaZktecoMfbf;

class CopierTest extends \PHPUnit_Framework_TestCase {

  public function test() {
    $copier = new \FfaZktecoMfbf\Copier();
    $copier->copyLocksToOdbc();

    $data = $copier->locks->raw();

    $odbc=new Odbc();
    $res=$odbc->get();
    $this->assertEquals(count($data),count($res));
  }

} // end class
