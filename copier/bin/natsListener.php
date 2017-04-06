<?php

require_once 'vendor/autoload.php';

echo("Commencing copy".PHP_EOL);

$copier = new \FfaZktecoMfbf\Copier();
$copier->locks->update();
$copier->copyLocksToOdbc(true);

// save to a temporary file the last update timestamp
$api = new \FfaZktecoMfbf\API();
$fn = $api->lastupdateFilename();
if(!file_exists($fn)) {
  $parent = dirname($fn);
  if(!file_exists($parent)) {
    mkdir($parent, 0777, true);
  }
}
file_put_contents($fn,date("Y-m-d H:i:s"));

echo("Completed copy".PHP_EOL);
