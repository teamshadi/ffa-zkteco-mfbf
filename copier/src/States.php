<?php

namespace FfaZktecoMfbf;

class States extends Mysql {

  public function get() {
    return $this->dbh->query("select * from MF_USERS_STATE");
  }

  // $sts = array( array('USERID'=>'108','state'=>'lock'), ...)
  public function put(array $sts) {
    // take non-duplicate data based on USERID
    $sts2 = array_reduce(
      $sts,
      function($final, $article){
        static $seen = array();
        if ( ! array_key_exists($article['USERID'], $seen)) {
          $seen[$article['USERID']] = NULL;
          $final[] = $article;
        }
        return $final;
      }
    );
    $sts=$sts2;

    // Do the query
    $this->dbh->exec("truncate table MF_USERS_STATE");
    foreach($sts as $x) {
      $secQ = sprintf(
        "insert into MF_USERS_STATE values (\"%s\",\"%s\")",
        $x['USERID'],
        $x['state']
      );

      $this->dbh->exec($secQ);
    }

  }

}
