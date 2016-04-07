<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="nexven">
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<head>
<meta charset="UTF-8">
<title>detail.jsp</title>
<script type="text/javascript">
	var app = angular.module("nexven",[]);
	app.controller("detailController", function($scope, $http) {
		//alert("ListController...");
	    console.log("detailController");
	    
	    $scope.deptno = ${param.deptno};
	    $scope.dept = {};
	    
	    var ajax = $http.get("/nexven/dept?deptno=" + $scope.deptno);
	    ajax.then(function(value) {
	    	$scope.dept = value.data;
	    });
	    
	});
	
	
</script>
</head>
<body data-ng-controller="detailController" class="container">
<a href="list.jsp" class="btn btn-info">부서리스트로</a>

<div>deptno = {{deptno}}</div>

<div class="panel panel-dafault">
<div class="panel-heading"></div>
<div class="panel-body"></div>
<ul>
	<li>{{dept.deptno}}</li>
	<li>{{dept.dname}}</li>
	<li>{{dept.loc}}</li>
</ul>
</div>

</body>
</html>