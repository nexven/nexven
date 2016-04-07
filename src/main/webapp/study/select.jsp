<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="nexven">
<head>
<meta charset="UTF-8">
<title>select.jsp</title>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script type="text/javascript">
	var app = angular.module("nexven",[]);
	app.controller("ListController", function($scope, $http) {

		var json = $http.get("/nexven/emp/mgrs");
	    json.then(function(value) {
	    	console.dir(value);
	    	$scope.mgrs = value.data;
	    }, function(error){
	    	console.dir(error);
	    });
	    
	   
	    
	    $scope.submit = function() {
			var ajax = $http.post("/nexven/emp", $scope.emp);
			ajax.then(function(value) {
				console.dir(value);
			});
		}
	    
	});
	
	
</script>
</head>
<body data-ng-controller="ListController" class="container">
	<h1>select option 연습</h1>	
	<form name="empForm" data-ng-submit="submit()">
	<pre>{{emp}}</pre>
	<input name="empno" type="hidden" data-ng-model="emp.empno" data-ng-init="20" value="20">
			<select name="mgr" data-ng-model="emp.mgr">
				<option value="">--선택하세요--</option>
				<option data-ng-repeat="mgr in mgrs" value="{{mgr.empno}}">{{mgr.empno}} / {{mgr.ename}}</option>								
			</select>
			<button type="submit">전송</button>
	</form>
</body>
</html>