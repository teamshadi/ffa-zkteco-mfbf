<?php

require_once dirname(__FILE__).'/../config.php';
require_once ROOT_DB_API.'/lib/FingerprintsClient.php';

function getUserAll() {

	// retrieval from fingeprints db table
	$fpDb=new FingerprintsClient();
	$fpDb->connect();
	$secD=$fpDb->getData();
	$fpDb->disconnect();

	return $secD;
}
