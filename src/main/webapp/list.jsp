<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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