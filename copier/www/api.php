<?php

require_once __DIR__.'/../vendor/autoload.php';

$api = new \FfaZktecoMfbf\API();
try {
  // if CLI usage, set variables to simulate API usage
  if(isset($argc)) {
    echo($api->cli($argc,$argv));
    return;
  }

  echo($api->handle($_SERVER,$_GET,$_POST));

} catch(\Exception $e) {
  echo($e->getMessage());
  exit(1);
}
