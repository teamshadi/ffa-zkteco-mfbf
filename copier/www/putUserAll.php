<?php

/*
 Set user: auto lock unlock

 USAGE
	CLI	php putUserAll.php '[{"USERID":"108","state":"auto"}]'

	AJAX
		 $.ajax({
		    url:"http://{{server}}/ffa-mfe/fingerprints-adapter/api/putUserAll.php",
		    type: 'POST',
		    data: {data: [{USERID:"108",state:"auto"},...]},
		    success: function (data) {
			console.log(data);
		    },
		    error: function (jqXHR, ts, et) {
			console.log("error", ts, et);
		    }
		 });
*/

if(isset($argc)) {
  if($argc>1) {
    $data=$argv[1];
  } else {
    throw new Exception("Wrong CLI usage");
  }
} else {
  $data=$_POST["data"];
}

// process data
try {
	if($data=="") {
		throw new Exception("Please enter the data\n");
	}

	require_once dirname(__FILE__).'/../../../config.php';
	require_once ROOT_FP_ADP.'/lib/putUserAll.php';

	putUserAll(json_decode($data,true));
	echo "{}";
} catch (Exception $e) {
	echo json_encode(array('error'=>$e->getMessage()));
	return;
}
