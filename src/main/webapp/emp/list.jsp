<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="employee">

<head>
<meta charset="UTF-8">
<title>list.jsp</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<!-- AngularJS -->
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/angular.bootstrap/1.2.2/ui-bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/angular.bootstrap/1.2.2/ui-bootstrap-tpls.min.js"></script>
<script type="text/javascript">


var app = angular.module("employee", ['ui.bootstrap']);

app.controller("listController", function($scope, $http) {
	
	var ajax = $http.get("/nexven/emp/list");
	ajax.then(function(res) {
		console.dir(res);
		$scope.emps = res.data;
	});
	
	$scope.paging = $http.get("/nexven/emp/page?pageNo=1");
	
	$scope.pageChange = function() {
		alert("pageNo" + $scope.paging.pageNo);
	}
	
});

</script>
</head>
<body data-ng-controller="listController" class="container">
<h1>직원 리스트</h1>
<table class="table table-striped">
<a href="append.jsp" class="btn btn-success">부서추가</a>
	<thead>
	<tr>
		<th colspan="7">
			<div data-uib-pagination 
			data-total-items="paging.totalCount" 
			data-ng-model="paging.pageNo"
			data-ng-items-per-page="5"
			data-ng-max-size="5"
			data-ng-change="pageChanged()"></div>
		</th>
	</tr>
		<tr><th>empno</th><th>ename</th><th>job</th><th>mgr</th><th>hiredate</th><th>sal</th><th>comm</th><th>deptno</th></tr>
	</thead>
	<tbody>	
		<tr data-ng-repeat="emp in emps.data">
			<td>{{emp.empno}}</td>
			<td>{{emp.ename}}</td>
			<td>{{emp.job}}</td>
			<td>{{emp.mgr}}</td>
			<td>{{emp.hiredate | date : 'yyyy-mm-dd'}}</td>
			<td>{{emp.sal}}</td>
			<td>{{emp.comm}}</td>
			<td>{{emp.deptno}}</td>
			<td><a href="./update.jsp?empno={{emp.empno}}" class="btn btn-success">부서 수정</a></td>
			<td><a href="./delete.jsp?empno={{emp.empno}}" class="btn btn-success">부서 삭제</a></td>
		</tr>
	</tbody>
</table>

</body>
</html>

