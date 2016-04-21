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
$(document).ready(function() {
	    var gNum = ${param.gNum};
	    
	    $.ajax({
		    type: "get",
		    url: "/nexven/gamedb?gNum="+gNum,
		    contentType: "application/json",
			success: function(result) {
		        var json = JSON.stringify(result);
		        alert("result = "+ result + "  json = "+ json);
		        var json2 = JSON.parse(json);
		        alert("  json2 = "+ json2);
// 		        var arrData = json2;
		    	
// 		    	var html = "";
		    	
// 		    	$.each(arrData, function(idx) {
// 		    	    var gname = 
// 		    	    + '<td class="active">' + arrData[idx].gname + '</td>'  
// 		    	    + '<td class="active">' + arrData[idx].gmaker + '</td>'
// 		    	    + '<td class="active">' + arrData[idx].ggenre + '</td>' 
// 		    	    + '<td class="active">' + arrData[idx].grating + '</td>' 
// 		    	    + '</tr>' ;
// 		    	});
		    	
// 		    	$(".gamedb").html(html);
			
		    },
		    error: function(){
		        alert('ajax 불러오기 실패');
		    }
		});
	    
	});
	
}
</script>
</head>
<body class="container">
<a href="list.jsp" class="btn btn-info">부서리스트로</a>



<div class="panel panel-dafault">
<div class="panel-heading"></div>
<div class="panel-body"></div>
<ul>

</ul>
</div>

</body>
</html>