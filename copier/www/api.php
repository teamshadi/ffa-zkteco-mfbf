<?php

require_once __DIR__.'/../vendor/autoload.php';
require_once __DIR__.'/../../../config.php';

$action=$_GET['action'];

switch($_GET['action']) {
  case "lastUpdate":
    $cio = new Checkinout();
    $maxt = $cio->getMax();
    if(!$maxt) $maxt="N/A";

    $line="N/A";
    $fn="/tmp/ffa-zkteco-mfbf";
    if(file_exists($fn)) {
      $line = trim(file_get_contents($fn));
    }

    echo "{\"lastUpdate\":\"$line\",\"lastcheckinout\":\"$maxt\"}";
    break;
  default:
    echo "Unsupported action";
}
