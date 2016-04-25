<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-ng-app="nexven">
<head>


<script type="text/javascript">

	app.controller("DeleteController", function($scope, $http) {
	
		$scope.deptno=${param.deptno}; // 바인딩 모델 생성
		
		var ajax = $http.get("/nexven/dept?deptno="+$scope.deptno);
		
		ajax.then(function(value) {
			$scope.dept = value.data;
		}, function(reason) {
			console.dir=reason.data;
		});
		
		$scope.delpass = function(){
			var ajax = $http['delete']("/nexven/dept?deptno="+$scope.deptno);			
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
			부서정보
		</div>
		<div class="panel-body">
			<ul>
				<li>Deptno : {{dept.deptno}}</li>
				<li>Dname : {{dept.dname}}</li>
				<li>Loc : {{dept.loc}}</li>
			</ul>
		</div>
		<div class="panel-footer">
			<input type="button" class="btn btn-primary" value="부서삭제" data-ng-click="delpass()" />
		</div>		
	</div>
</body>
</html>