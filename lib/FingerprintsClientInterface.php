<?php

require_once dirname(__FILE__).'/../config.php';
require_once dirname(__FILE__).'/../bootstrap.php';
require_once ROOT_DB_API.'/lib/FfadbClientInterface.php';

interface FingerprintsClientInterface extends FfadbClientInterface {

function connect();
function getData();
function putStates($sts);
function putLocks();
function copyLocksToMf();
function getLastCheckinout();

}
