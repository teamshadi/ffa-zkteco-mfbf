<?php

if($argc>1) {
  $skipCopyToMf=strtolower($argv[1])=="true";
} else {
  throw new Exception(sprintf(
    "%s\n%s\n%s\n",
    "Usage: php updateLocks.php [copy to marketflow: true|false]",
    "       php updateLocks.php false"
  ));
}

require_once dirname(__FILE__).'/../config.php';
require_once ROOT_DB_API.'/lib/FingerprintsClient.php';

foreach(array("Lebanon","Dubai") as $l) {
	$fpDb=new FingerprintsClient($l,"Beirut"); # Test
	$fpDb->connect();
	$fpDb->putLocks(); // update locks based on updated states
	if(!$skipCopyToMf) $fpDb->copyLocksToMf(); 
	$fpDb->disconnect();
}
