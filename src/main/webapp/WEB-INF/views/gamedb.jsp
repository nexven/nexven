<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%-- 	pageEncoding="UTF-8"%>  --%>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <script src="//code.jquery.com/jquery-1.12.0.min.js"></script> -->
<!-- <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script> -->
<!-- <script -->
<!-- 	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> -->
<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>list.jsp</title> -->
<script type="text/javascript">
$(document).ready(function() {
	$.ajax({
	    type: "get",
	    url: "/nexven/gamedb/list",
	    contentType: "application/json",
		success: function(result) {
	        var json = JSON.stringify(result);
	        var json2 = JSON.parse(json);
	        var arrData = json2;
	    	
	    	var html = "";
	    	$.each(arrData, function(idx) {
	    	    html += '<tr>' 
	    	    + '<td class="active">' + arrData[idx].gname + '</td>'  
	    	    + '<td class="active">' + arrData[idx].gmaker + '</td>'
	    	    + '<td class="active">' + arrData[idx].ggenre + '</td>' 
	    	    + '<td class="active">' + arrData[idx].grating + '</td>' 
	    	    + '</tr>' ;
	    	});
	    	
	    	$(".gamedb").html(html);
		
	    },
	    error: function(){
	        alert('ajax 불러오기 실패');
	    }
	});	    
	
});

</script>
<!-- </head> -->

<!-- <body> -->

<h1>게임 DB</h1>
<table class="table table-bordered table-hover">
		<thead>
			<tr>
				<th>게임명</th>
				<th>제작사</th>
				<th>장르</th>
				<th>평점</th>
			</tr>
		</thead>
		<tbody class="gamedb">	
		
		</tbody>
	</table>
<!-- </body> -->
<!-- </html> -->