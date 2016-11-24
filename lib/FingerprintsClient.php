<?php

require_once dirname(__FILE__).'/../config.php';
require_once dirname(__FILE__).'/../bootstrap.php';
require_once ROOT_DB_API.'/lib/FfadbClient.php';
require_once ROOT_DB_API.'/lib/PricefarmClient.php';
require_once ROOT_DB_API.'/lib/FingerprintsClientInterface.php';

class FingerprintsClient extends FfadbClient implements FingerprintsClientInterface {

function connect() {
  if(!defined("FP_DB_DBNAME")) throw new Exception("Missing configuration for fingerprints");
  if(!defined("FP_DB_USER")) throw new Exception("Missing configuration for fingerprints");
  if(!defined("FP_DB_PASS")) throw new Exception("Missing configuration for fingerprints");

  // retrieval from mf db table
  $this->connection=odbc_connect(
    FP_DB_DBNAME,
    FP_DB_USER,
    FP_DB_PASS);

  if(!$this->connection) die('Failed to connect to Fingerprints MSSQL');

  $secQ = "USE ".FP_DB_DBNAME.";";
  odbc_exec($this->connection,$secQ);
}

function getData() {
  // Do the query
  $secQ = "SELECT MF_USERS_LOCK.*,
    case
      when MF_USERS_STATE.state is NULL then 'auto'
      else MF_USERS_STATE.state
    end as state
    from MF_USERS_LOCK 
    left join MF_USERS_STATE on MF_USERS_STATE.USERID = MF_USERS_LOCK.USERID
    where MF_USERS_LOCK.USERID!='NULL'
     order by Locked, DEPTNAME, MF_USERS_LOCK.Name;
    ";
  $secQ = odbc_exec($this->connection,$secQ);
  $secD=array();
  while(($temp = odbc_fetch_array($secQ))) array_push($secD,$temp); // not sure why without the X "108" was becoming an int

  // return
  return($secD);
}

function getStates() {
  $q=odbc_exec($this->connection,"select * from MF_USERS_STATE");
  $res=array();
  while(($temp = odbc_fetch_array($q))) array_push($res,$temp);
  return $res;
}

function putStates($sts) {
# $sts = array( array('USERID'=>'108','state'=>'lock'), ...)
  // take non-duplicate data based on USERID
  $sts2 = array_reduce($sts, function($final, $article){
      static $seen = array();
      if ( ! array_key_exists($article['USERID'], $seen)) {
    $seen[$article['USERID']] = NULL;
    $final[] = $article;
      }
      return $final;
  });
  $sts=$sts2;
  // Do the query
  odbc_exec($this->connection,"truncate table MF_USERS_STATE");
  $secQ = array_map( function($x) { return "insert into MF_USERS_STATE values (\"{$x['USERID']}\",\"{$x['state']}\")"; }, $sts);
  foreach($secQ as $si) odbc_exec($this->connection,$si);
}

function putLocks() {
  $secQ = file_get_contents(__DIR__."/update_MF_USERS_LOCK.sql");
  odbc_exec($this->connection,"truncate table MF_USERS_LOCK");
  odbc_exec($this->connection,$secQ);
}

function copyLocksToMf() {
  // Do the query
  $secQ = "SELECT * from MF_USERS_LOCK;";
  $secQ = odbc_exec($this->connection,$secQ);
  $secD=array();
  while(($temp = odbc_fetch_array($secQ))) array_push($secD,$temp); // not sure why without the X "108" was becoming an int

  // it seems that only one odbc driver is allowed to be connected at a time
  // so I need to disconnect "this" before connecting to ths pricefarm db
  // and then I connect again after I'm done
  $this->disconnect();

  // connect to pricefarm db
  $pfDb=new PricefarmClient($this->base,$this->location);
  $pfDb->connect();
  $pfDb->setLocks($secD);
  $pfDb->disconnect();

  // reconnecting after disconnect above
  $this->connect();
}

function getLastCheckinout() {
  // Do the query
  $secQ = "SELECT max(CHECKTIME) CHECKTIME from CHECKINOUT;";
  $secQ = odbc_exec($this->connection,$secQ);
  $secD=array();
  while(($temp = odbc_fetch_array($secQ))) array_push($secD,$temp);
  return $secD[0]['CHECKTIME'];
}


}
