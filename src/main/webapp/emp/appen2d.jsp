<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="Employee">
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<head>
<meta charset="UTF-8">
<title>append.jsp</title>
<script type="text/javascript">
	var app = angular.module("Employee",[]);
	app.controller("appendController", function($scope, $http) {
		//alert("ListController...");
	    console.log("appendController");
	    
	    $scope.submit = function() {
			var ajax = $http.post("/Employee/emp", $scope.emp);
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
			});
		};
		
		//mgr
	    var json = $http.get("/Employee/emp/mgrs");
	    json.then(function(value) {
	    	console.dir(value);
	    	$scope.mgrs = value.data;
	    }, function(error){
	    	console.dir(error);
	    });
		
		//deptno
	    var ajax = $http.get("/Employee/dept/list");
	    ajax.then(function(value) {
	    	console.dir(value);
	    	$scope.depts = value.data;
	    });
	    
		
	    $scope.emp={
	    	empno : 7369,
		    ename : "SMITH",
		    job : "CLERK",
		    mgr : 7902,
		    hiredate : 1980-00-17,
		    sal : 800,
		    comm : null,
		    deptno : 10
	    };
	    
	    $scope.format = function() {
			return JSON.stringify($scope.empForm, null, 4)
		};

	});
	
	
</script>
</head>
<body data-ng-controller="appendController" class="container">
<a href="list.jsp" class="btn btn-info">부서리스트로</a>
<pre>{{emp}}</pre>
<pre>{{format()}}</pre>
<ul>
	<li>empForm.$dirty = {{empForm.$dirty}}</li>
	<li>empForm.$valid = {{empForm.$valid}}</li>
	<li>empForm.$invalid = {{empForm.$invalid}}</li>
	<li>empForm.empno.$dirty = {{empForm.empno.$dirty}}</li>
	<li>empForm.empno.$valid = {{empForm.empno.$valid}}</li>
	<li>empForm.empno.$invalid = {{empForm.empno.$invalid}}</li>
	<li>empForm.empno.$error = {{empForm.empno.$error}}</li>
	<li>empForm.ename.$error = {{empForm.ename.$error}}</li>
	<li>empForm.job.$error = {{empForm.job.$error}}</li>
</ul>
<form name="empForm" novalidate="novalidate" data-ng-submit="submit()">
<!-- 1 -->
	<div class="form-group">
	<label for="empno">부서번호 : </label>
	<input id="empno" name="empno" class="form-control" data-ng-model="emp.empno" required="required" type="number">
	</div>
	<div data-ng-show="empForm.empno.$dirty">
		<div data-ng-show="empForm.empno.$error.required">필수입력 항목입니다.</div>
		<div data-ng-show="empForm.empno.$error.number">숫자만 입력가능합니다</div>
	</div>
<!-- 	2 -->
	<div class="form-group">	
	<label for="ename">부서이름 : </label>
	<input id="ename" name="ename" class="form-control" data-ng-model="emp.ename" required="required" data-ng-maxlength="14">
	</div>
	<div data-ng-hide="!empForm.ename.$dirty">
		<div data-ng-hide="!empForm.ename.$error.required">필수 입력 항목입니다.</div>
		<div data-ng-hide="!empForm.ename.$error.maxlength">14자리 까지 입력 가능합니다.</div>
	</div>
<!-- 	3 -->
	<div class="form-group">
	<label for="job">부서위치 : </label>
	<input id="job" name="job" class="form-control" data-ng-model="emp.job" required="required" data-ng-maxlength="13"><br>
	</div>
	<div data-ng-hide="!empForm.job.$dirty">
		<div data-ng-hide="!empForm.job.$error.required">필수 입력 항목입니다.</div>
		<div data-ng-hide="!empForm.job.$error.maxlength">13자리 까지 입력 가능합니다.</div>
	</div>
	
<!-- 	4 -->
	<div class="form-group">
	<label for="mgr">mgr : </label>
	<select name="mgr" data-ng-model="emp.mgr">
		<option value="">--선택하세요--</option>
		<option data-ng-repeat="mgr in mgrs" value="{{mgr.empno}}">{{mgr.empno}} / {{mgr.ename}}</option>								
	</select>
	</div>
<!-- 	5 -->
	<div class="form-group">
	<label for="hiredate">hiredate : </label>
	<input id="hiredate" name="hiredate" class="form-control" data-ng-model="emp.hiredate"><br>
	</div>
<!-- 	6 -->
	<div class="form-group">
	<label for="sal">sal : </label>
	<input id="sal" name="sal" class="form-control" data-ng-model="emp.sal"><br>
	</div>
<!-- 	7 -->
	<div class="form-group">
	<label for="comm">comm : </label>
	<input id="comm" name="comm" class="form-control" data-ng-model="emp.comm"><br>
	</div>
<!-- 	8 -->
	<div class="form-group">
	<label for="deptno">deptno : </label>
	
	<select name="deptno" data-ng-model="emp.deptno">
		<option value="">--선택하세요--</option>
		<option data-ng-repeat="dept in depts" value="{{dept.deptno}}">{{dept.deptno}}</option>								
	</select>
	
	</div>
	<button type="submit" data-ng-disabled="empForm.$invalid">부서추가</button>
	
</form>
</body>
</html>