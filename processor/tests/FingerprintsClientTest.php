<?php

require_once dirname(__FILE__).'/../config.php';
require_once dirname(__FILE__).'/../bootstrap.php';
require_once ROOT_DB_API."/lib/FingerprintsClient.php";

class FingerprintsClientTest extends PHPUnit_Framework_TestCase {

  /*
   * Disabling this test because it modifies the data in the database

  public function test1() {
    // retrieval from fingeprints db table
    $fpDb=new FingerprintsClient();
    $fpDb->connect();
    $gs=$fpDb->getStates();    // get backup

    // below userid=108 corresponds to shadi akiki
    // mysql --user=ffaFingerprints --password ffa_price_farm
    // select * from USERINFO where Name like 'SHADI AK';
    $fpDb->putStates(array(array("USERID"=>"108","state"=>"lock"))); // test that we can put states

    $x1 = $fpDb->getStates();
    $fpDb->putStates($gs); // returning state of table
    $x2 = $fpDb->getStates();
    $x3 = $fpDb->getData();
    $fpDb->disconnect();

    $this->assertTrue(count($x1)>=1); // update user states\n";
    //$this->assertTrue(count($gs)!=count($x2)); // restore original user states\n";
    $this->assertTrue(count($x3)>=20); // merged data more than 20 users
  }
   */

  public function test2() {
    $db=odbc_connect(FP_DB_DBNAME,FP_DB_USER,FP_DB_PASS);
    if(!$db) die("failed");
    
    $res=odbc_exec($db,"use ".FP_DB_DBNAME.";");
    if(!$res) die("failed");
    $res=odbc_exec($db,"select USERID from USERINFO");
    
    $secD=array();
    while(($temp = odbc_fetch_array($res))) {
    	array_push($secD,$temp['USERID']);
    }
    $this->assertTrue(count($secD)>0);
    odbc_close($db);
    
    // Shadi
    $secD=array(108);
    
    $data=array();
    $db=odbc_connect(FP_DB_DBNAME,FP_DB_USER,FP_DB_PASS);
    foreach($secD as $k=>$ui) {
    	$q="select * from CHECKINOUT where USERID=$ui";
    	$res=odbc_exec($db,$q);
    	if(!$res) die("failed");
    
    	while(($temp = odbc_fetch_array($res))) {
    		array_push($data,$temp);
    	}
    }
    odbc_close($db);
   
    $x1 = strftime(
        '%Y-%m-%d %H:%M:%S',
        array_reduce(
          array_map(function($x){ return strtotime($x['CHECKTIME']); },$data),
          function($a,$b) { return max($a,$b); })
      ); // "max time",

    $this->assertTrue($x1>'2000-01-01 01:01:01');
  }

} // end class
