<?php

namespace FfaZktecoMfbf;

class States extends Mysql {

  function get() {
    return $this->dbh->query("select * from MF_USERS_STATE");
  }

  // $sts = array( array('USERID'=>'108','state'=>'lock'), ...)
  function put(array $sts) {
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
    $this->dbh->exec("truncate table MF_USERS_STATE");
    foreach($sts as $x) {
      $secQ = "insert into MF_USERS_STATE values (\"{$x['USERID']}\",\"{$x['state']}\")";
      $this->dbh->exec($secQ);
    }

  }

}
