<?php

namespace FfaZktecoMfbf;

class OdbcIni {

  function __construct(string $fn=null) {
    if(is_null($fn)) {
      $fn='/etc/odbc.ini';
    }
    if(!file_exists($fn)) {
      throw new \Exception("File does not exist: $fn");
    }
    $this->fn = $fn;
  }

  public function parse() {
    // parse odbc.ini file
    // should not contain hash marks for comments
    // use ; instead
    return parse_ini_file($this->fn,true);
  }


}
