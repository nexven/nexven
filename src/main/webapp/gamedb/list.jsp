<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
<script type="text/javascript">
$(document).ready(function() {

	alert("as");
	$.get("/nexven/gamedb/list", function(data, status){
        alert("Data: " + data + "\nStatus: " + status);
        var json = JSON.stringify(data.data);
        alert(json);
        var json2 = JSON.parse(json);
        alert(json2);
        //$('.testc').html(json);
        
        var arrData = json2;
    	
    	var html = "";
    	
    	$.each(arrData, function(idx) {
    		//empno	ename	job	mgr	hiredate	sal	comm	deptno
    	    html += '<tr>' + '<td>' + arrData[idx].gNum + '</td>' + '<td>' + arrData[idx].gName 
    	    + '</td>' + '<td>' + arrData[idx].gStartDate + '</td>' + '<td>' + arrData[idx].gMaker + '</td>'
    	    + '<td>' + arrData[idx].gPublisher + '</td>' + '<td>' + arrData[idx].gServiceType + '</td>'
    	    + '<td>' + arrData[idx].gPlatform + '</td>' + '<td>' + arrData[idx].gGenre + '</td>' 
    	    + '<td>' + arrData[idx].gHomepage + '</td>' + '<td>' + arrData[idx].gRating + '</td>' 
    	    + '<td>' + arrData[idx].gIntroduce + '</td>' 
    	    + '<td><a href="./update.jsp?empno={{emp.empno}}" class="btn btn-success">부서 수정</a></td>'
			+ '<td><a href="./delete.jsp?empno={{emp.empno}}" class="btn btn-success">부서 삭제</a></td>' + '</tr>';
    	});

    	
    	$(".ab").html(html);
        
    });	
	
});

</script>
</head>

<body>

<h1>게임 DB</h1>
<table class="table table-striped">
		<thead>
			<tr>
				<th>gNum</th>
				<th>gName</th>
				<th>gStartDate</th>
				<th>gMaker</th>
				<th>gPublisher</th>
				<th>gServiceType</th>
				<th>gPlatform</th>
				<th>gGenre</th>
				<th>gHomepage</th>
				<th>gRating</th>
				<th>gIntroduce</th>
			</tr>
		</thead>
		<tbody class="ab">	
		
		</tbody>
	</table>
</body>
</html>