function Controller1($scope) {

	$scope.UPDATE_INTERVAL=UPDATE_INTERVAL;

	$scope.data={};
	$scope.states=["auto","lock","unlock"];

	$scope.noData=function() { return Object.keys($scope.data).length==0; };

	$scope.lastUpdate={"lastUpdate":"","lastcheckinout":""};
	$scope.getLastUpdate = function() {
		$.ajax({type:'GET',
			url: SERVER_URL+'/api.php?action=lastUpdate',
			dataType: 'json',
			success: function(rt) {
				if(rt.hasOwnProperty("error")) {
					alert("Server error: "+rt.error);
					return;
				}
				$scope.$apply(function() { $scope.lastUpdate=rt; });
			},
			error: function(rt,et,ts) { alert("Error getting last update from server. "+et+";"+ts); }
		});
	};

	$scope.getUserAll = function() {
		$.ajax({type:'GET',
			url: SERVER_URL+'/api.php?action=users',
			dataType: 'json',
			success: function(rt) {
				if(rt.hasOwnProperty("error")) {
					alert("Server error: "+rt.error);
					return;
				}
				$scope.$apply(function() {
					$scope.data=rt;
					$scope.dataOri=dataToOri();
				});
			},
			error: function(rt,et,ts) { alert("Error getting all users from server. "+et+";"+ts); }
		});
	};

	dataToOri=function() { return angular.toJson(Object.keys($scope.data).map(function(x) { return $scope.data[x].state; }).sort()); };
	dataToPut=function() {
		o=Object.keys($scope.data)
		// 2016-12-01 do not filter out auto
    // .filter(function(x) { return $scope.data[x].state!="auto"; })
		.map(function(x) { return {'USERID':$scope.data[x].USERID,'state':$scope.data[x].state}; })
		;
		return o;
	};

	$scope.dataEdited=function() { return $scope.dataOri!=dataToOri(); };

	$scope.putUserAllStatus=false;
	$scope.putUserAll=function() {
		$scope.putUserAllStatus=true;
		$.ajax({type:'POST',
			url: SERVER_URL+'/api.php',
			data: { data: angular.toJson(dataToPut()) },
			dataType: 'json',
			success: function(rt) {
				if(rt.hasOwnProperty("error")) {
					alert("Server error: "+rt.error);
					return;
				}
				$scope.getUserAll();
				$scope.getLastUpdate();
			},
			error: function(rt,et,ts) { alert("Error saving list to server. "+et+";"+ts); },
			complete: function() { $scope.$apply(function() { $scope.putUserAllStatus=false; }); }

		});
	};

	angular.element(document).ready(function () {
		$scope.getUserAll();
		$scope.getLastUpdate();
		setInterval(function() { if(!$scope.dataEdited()) {
			$scope.getUserAll();
			$scope.getLastUpdate();
		} }, UPDATE_INTERVAL); // update every X seconds
	});

	$scope.setAll=function(st) { Object.keys($scope.data).map(function(x) { $scope.data[x].state=st; }); };

};
