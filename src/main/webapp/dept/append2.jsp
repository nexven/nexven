<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="employee">
<head>
<meta charset="UTF-8">
<title>append.jsp</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<!-- AngularJS -->
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script type="text/javascript">

var app = angular.module('employee', []);

app.controller('appendController', function($scope, $http) {
	//alert("listController...");
	console.log("appendController...");
	
	$scope.submit = function() {
		var ajax = $http.post("/Employee/dept", $scope.dept);
		ajax.then(function(value) {
			console.dir(value);
			if (value.data.success) {
				location.href = "list.jsp";
			} else {
				alert(value.data.message);
			}
		}, function(reason) {
			console.dir(reason);
		});
		
	};
	
	$scope.format = function() {
		var seen = [];
	    var json = JSON.stringify($scope.deptForm, function(key, value){
	        if (typeof value === 'object') {
	            if ( !seen.indexOf(value) ) {
	                return '__cycle__' + (typeof value) + '[' + key + ']'; 
	            }
	            seen.push(value);
	        }
	        return value;
	    }, 4);
	    return json;
	};
	
	
});
</script>

</head>
<body data-ng-controller="appendController" class="container">

<a href="list.jsp" class="btn btn-info">부서리스트로...</a>
<pre>{{dept}}</pre>
<textarea rows="10" cols="80">{{format()}}</textarea>
<ul>
	<li>deptForm.$dirty = {{deptForm.$dirty}}</li>
	<li>deptForm.$valid = {{deptForm.$valid}}</li>
	<li>deptForm.$invalid = {{deptForm.$invalid}}</li>
	<li>deptForm.deptno.$dirty = {{deptForm.deptno.$dirty}}
	<li>deptForm.deptno.$valid = {{deptForm.deptno.$valid}}</li>
	<li>deptForm.deptno.$invalid = {{deptForm.deptno.$invalid}}</li> 
	<li>deptForm.deptno.$error = {{deptForm.deptno.$error}}</li>
	<li>deptForm.dname.$error = {{deptForm.dname.$error}}</li>
	<li>deptForm.loc.$error = {{deptForm.loc.$error}}</li>
</ul>
<form name="deptForm" novalidate="novalidate" data-ng-submit="submit()">

	<!-- deptno -->
	<div class="form-group">
		<label for="deptno">부서번호 : </label>
		<input id="deptno"
			   type="number"
			   name="deptno" 
			   class="form-control"
			   data-ng-model="dept.deptno"
			   required="required"
			   data-ng-min="0"
			   data-ng-max="99"
			   />
	</div>
	<div data-ng-show="deptForm.deptno.$dirty">
		<div data-ng-show="deptForm.deptno.$error.required">필수입력 항목입니다.</div>
		<div data-ng-show="deptForm.deptno.$error.number">숫자만 입력가능합니다 0-99</div>
		<div data-ng-show="deptForm.deptno.$error.max">99까지만 입력가능합니다.</div>
		<div data-ng-show="deptForm.deptno.$error.min">0이상 입력가능합니다.</div>
	</div>
	
	<!-- dname -->
	<div class="form-group">
		<label for="dname">부서이름 : </label>
		<input id="dname" 
			   name="dname" 
			   class="form-control"
			   data-ng-model="dept.dname"
			   required="required"
			   data-ng-maxlength="14"
			   />
	</div>
	<div data-ng-show="deptForm.dname.$dirty">
		<div data-ng-show="deptForm.dname.$error.required">필수 입력 항목입니다.</div>
		<div data-ng-show="deptForm.dname.$error.maxlength">14자리 까지 입력가능합니다.</div>
	</div>
	
	<!-- loc -->
	<div class="form-group">
		<label for="loc">부서위치 : </label>
		<input id="loc" 
			   name="loc" 
			   class="form-control"
			   data-ng-model="dept.loc"
			   required="required"
			   data-ng-maxlength="13"
			   />
	</div>
	<div data-ng-show="deptForm.loc.$dirty">
		<div data-ng-show="deptForm.loc.$error.required">필수 입력 항목입니다.</div>
		<div data-ng-show="deptForm.loc.$error.maxlength">13자리 까지 입력가능합니다.</div>
	</div>
	
	<button type="submit" data-ng-disabled="deptForm.$invalid">부서추가</button>
</form>

</body>
</html>





