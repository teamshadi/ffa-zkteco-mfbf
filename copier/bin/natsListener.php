<?php

require_once 'vendor/autoload.php';

echo("Commencing copy".PHP_EOL);
$copier = new \FfaZktecoMfbf\Copier();
$copier->locks->update();
$copier->copyLocksToOdbc(true);
echo("Completed copy".PHP_EOL);
