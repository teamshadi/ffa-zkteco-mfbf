<?php

require_once dirname(__FILE__).'/../config.php';
require_once ROOT_DB_API.'/lib/FingerprintsClient.php';

function putUserAll($data) {
# $data = array( array("USERID"=>"sakiki","state"=>"auto"), array(...) )

	foreach(array("Lebanon","Dubai") as $l) {
		$fpDb=new FingerprintsClient($l,"Beirut"); # Test
		$fpDb->connect();
		$secD=$fpDb->putStates($data);
		$fpDb->putLocks(); // update locks based on updated states
		$fpDb->copyLocksToMf(); 
		$fpDb->disconnect();
	}
}
