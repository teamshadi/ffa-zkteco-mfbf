<?php

/*
 Set user: auto lock unlock

 USAGE
	CLI	php getUserAll.php

	AJAX
		 $.ajax({
		    url:"http://{{server}}/ffa-mfe/fingerprints-adapter/api/getUserAll.php",
		    type: 'POST',
		    success: function (data) {
			console.log(data);
		    },
		    error: function (jqXHR, ts, et) {
			console.log("error", ts, et);
		    }
		 });
*/

try {
	require_once dirname(__FILE__).'/../../../config.php';
	require_once ROOT_FP_ADP.'/lib/getUserAll.php';

	echo json_encode(getUserAll());
} catch (Exception $e) {
	echo json_encode(array('error'=>$e->getMessage()));
	return;
}
