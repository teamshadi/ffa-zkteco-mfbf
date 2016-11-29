<?php

namespace FfaZktecoMfbf;

class LocksTest extends DbhWrapperTest {

  public function test() {
    $locks = new Locks(self::$dbh);

    $locks->dbh->exec(file_get_contents(__DIR__.'/../../../initdb/updater.sql'));

    $this->assertNotNull($locks->withStates());
    $this->assertNotNull($locks->raw());
  }

} // end class
