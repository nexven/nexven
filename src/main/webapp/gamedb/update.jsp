<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	    $scope.gNum = ${param.gNum};
	    $scope.game = {};
	    
	    var gNum = ${param.gNum};
	    $.ajax({
		    type: "get",
		    url: "/nexven/gamedb?gNum="+gNum,
		    contentType: "application/json",
			success: function(result) {
				
		        var json = JSON.stringify(result);
		        var arr = JSON.parse(json);
		        
		        $("#gname").html(arr.gname);
		        
		        var sdate = dateFormat(arr.gstartDate , "yyyy/MM/dd");
		        $("#gstartDate").html(sdate);
		        
		        $("#gmaker").html(arr.gmaker);
		        $("#gpublisher").html(arr.gpublisher);
		        $("#gserviceType").html(arr.gserviceType);
		        $("#gplatform").html(arr.gplatform);
		        $("#ggenre").html(arr.ggenre);
		        $("#ghomepage").html(arr.ghomepage);
		        $("#grating").html(arr.grating);
		        $("#gintroduce").html(arr.gintroduce);
		       	    	
		    },
		    error: function(){
		        alert('ajax 불러오기 실패');
		    }
		});
	    
	    var ajax = $http.get("/nexven/gamedb?gNum" + $scope.deptno);
	    ajax.then(function(value) {
	    	$scope.dept = value.data;
	    });
	    
	    $scope.submit = function() {
			var ajax = $http.put("/nexven/dept", $scope.dept);
			ajax.then(function(value) {
				if(value.data.success){
					alert(value.data.message);
					location.href = "list.jsp";	
				}else{
					alert(value.data.message);
				}
				
				
			});
		};
		

	    
	});
	
	
</script>
</head>
<body data-ng-controller="updateController" class="container">
<a href="list.jsp" class="btn btn-info">부서리스트로</a>
<pre>{{dept}}</pre>
<h1>부서 수정</h1>
<ul>
	<li>deptForm.$dirty = {{deptForm.$dirty}}</li>
	<li>deptForm.$valid = {{deptForm.$valid}}</li>
	<li>deptForm.$invalid = {{deptForm.$invalid}}</li>
	<li>deptForm.deptno.$dirty = {{deptForm.deptno.$dirty}}</li>
	<li>deptForm.deptno.$valid = {{deptForm.deptno.$valid}}</li>
	<li>deptForm.deptno.$invalid = {{deptForm.deptno.$invalid}}</li>
	<li>deptForm.deptno.$error = {{deptForm.deptno.$error}}</li>
	<li>deptForm.dname.$error = {{deptForm.dname.$error}}</li>
	<li>deptForm.loc.$error = {{deptForm.loc.$error}}</li>
</ul>
<form name="deptForm" novalidate="novalidate" data-ng-submit="submit()">
	<div class="form-group">
	<label for="deptno">부서번호 : </label>
	<input id="deptno" name="deptno" class="form-control" data-ng-model="dept.deptno" required="required" type="number" data-ng-min="0" data-ng-max="99" disabled="disabled">
	</div>
	<div data-ng-show="deptForm.deptno.$dirty">
		<div data-ng-show="deptForm.deptno.$error.required">필수입력 항목입니다.</div>
		<div data-ng-show="deptForm.deptno.$error.number">숫자만 입력가능합니다 0-99</div>
		<div data-ng-show="deptForm.deptno.$error.max">99까지만 입력가능합니다.</div>
		<div data-ng-show="deptForm.deptno.$error.min">0이상 입력가능합니다.</div>
	</div>
	<div class="form-group">	
	<label for="dname">부서이름 : </label>
	<input id="dname" name="dname" class="form-control" data-ng-model="dept.dname" required="required" data-ng-maxlength="14">
	</div>
	<div data-ng-hide="!deptForm.dname.$dirty">
		<div data-ng-hide="!deptForm.dname.$error.required">필수 입력 항목입니다.</div>
		<div data-ng-hide="!deptForm.dname.$error.maxlength">14자리 까지 입력 가능합니다.</div>
	</div>
	<div class="form-group">
	<label for="loc">부서위치 : </label>
	<input id="loc" name="loc" class="form-control" data-ng-model="dept.loc" required="required" data-ng-maxlength="13"><br>
	</div>
	<div data-ng-hide="!deptForm.loc.$dirty">
		<div data-ng-hide="!deptForm.loc.$error.required">필수 입력 항목입니다.</div>
		<div data-ng-hide="!deptForm.loc.$error.maxlength">13자리 까지 입력 가능합니다.</div>
	</div>
	<button type="submit" data-ng-disabled="deptForm.$invalid">부서수정</button>
</form>
</body>
</html>