<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="Employee">
<head>
<meta charset="UTF-8">
<title>delete.jsp</title>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script type="text/javascript">
	var app = angular.module("Employee",[]);
	app.controller("DeleteController", function($scope, $http) {
	
		$scope.empno=${param.empno}; // 바인딩 모델 생성
		
		var ajax = $http.get("/Employee/emp?empno="+$scope.empno);
		
		ajax.then(function(value) {
			$scope.emp = value.data;
		}, function(reason) {
			console.dir=reason.data;
		});
		
		$scope.delpass = function(){
			var ajax = $http['delete']("/Employee/emp?empno="+$scope.empno);			
			ajax.then(function(value) {
				console.dir(value);
				if(value.data.success){
					alert(value.data.message);
					location.href = "./list.jsp";
				}else{
					alert(value.data.message);
				}
			}, function(reason) {
				console.dir(reason);
				alert(value.data.message);
				console.dir(reason);
			});
		}
	});	
	
</script>
<style type="text/css">
	label{width:80px}
</style>
</head>
<body data-ng-controller="DeleteController" class="container">
	<a href="./list.jsp" class="btn btn-info">부서 리스트</a>
	<hr>
	<div class="panel panel-primary">
		<div class="panel-heading">
			직원정보
		</div>
		<div class="panel-body">
			<ul>
				<li>{{emp.empno}}</li>
				<li>{{emp.ename}}</li>
				<li>{{emp.job}}</li>
				<li>{{emp.mgr}}</li>
				<li>{{emp.hiredate | date : 'yyyy-mm-dd'}}</li>
				<li>{{emp.sal}}</li>
				<li>{{emp.comm}}</li>
				<li>{{emp.deptno}}</li>
			</ul>
		</div>
		<div class="panel-footer">
			<input type="button" class="btn btn-primary" value="직원삭제" data-ng-click="delpass()" />
		</div>		
	</div>
</body>
</html>