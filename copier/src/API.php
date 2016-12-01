<?php

namespace FfaZktecoMfbf;

class API {

  function __construct(States $states=null, Checkinout $checkinout=null, Locks $locks=null) {
    if(is_null($states)) {
      $states = new States();
    }
    $this->states = $states;

    if(is_null($checkinout)) {
      $checkinout = new Checkinout();
    }
    $this->checkinout = $checkinout;

    if(is_null($locks)) {
      $locks = new Locks();
    }
    $this->locks = $locks;
  }

  // if CLI usage, set variables to simulate API usage
  public function cli(int $argc, array $argv) {
    if($argc!=3) {
      throw new \Exception(
        "Wrong CLI usage".PHP_EOL
        ."php api.php GET lastUpdate".PHP_EOL
        ."php api.php GET users".PHP_EOL
        ."php api.php POST '[{\"USERID\":\"108\",\"state\":\"auto\"}]'".PHP_EOL
      );
    }

    $server = ['REQUEST_METHOD'=>$argv[1]];
    $get=[];
    $post=[];
    switch($argv[1]) {
      case "GET":
        $get['action']=$argv[2];
        break;
      case "POST":
        $post['data']=$argv[2];
        break;
    }

    return $this->handle($server,$get,$post);
  }

  // server   $_SERVER
  // get      $_GET
  // post     $_POST
  public function handle($server,$get,$post) {
    // now core of api
    switch($server['REQUEST_METHOD']) {
      case "GET":
        return $this->get($get);
        break;

      case "POST":
        $this->states->put(json_decode($post['data'],true));
        $this->locks->update();
        $copier = new \FfaZktecoMfbf\Copier();
        $copier->copyLocksToOdbc();
        return "{}";
        break;

      default:
        throw new \Exception("Unsupported action ".$server['REQUEST_METHOD']);
    }
  }

  private function get($get) {
    switch($get['action']) {
      case "lastUpdate":
        $out = [
          'lastcheckinout'=>'N/A',
          'lastUpdate'=>'N/A'
        ];

        $maxt = $this->checkinout->getMax();
        if($maxt) $out['lastcheckinout']=$maxt;

        $fn="/tmp/ffa-zkteco-mfbf/lastupdate.txt";
        if(file_exists($fn)) {
          $last = trim(file_get_contents($fn));
          if($last) $out['lastUpdate']=$last;
        }

        return json_encode($out);
        break;
      case "users":
        return json_encode($this->locks->withStates());
        break;
      default:
        throw new \Exception("Unsupported GET action: ".$get['action']);
    }
  }

} // end class
