<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <script src="//code.jquery.com/jquery-1.12.0.min.js"></script> -->
<!-- <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script> -->
<!-- <script src="/nexven/js/jquery.twbsPagination.min.js"></script> -->
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
	    url: "/nexven/gamedb/page?pageNo=1",
	    contentType: "application/json",
		success: function(result) {
	        var json = JSON.stringify(result.games);
	        var json2 = JSON.parse(json);
	        var arrData = json2;
	    	
	    	var html = "";
	    	$.each(arrData, function(idx) {
	    	    html += '<tr>' 
	    	    + '<td class="active">' + '<a href="javascript:nload(\'/nexven/gamedb/detail.jsp?gNum='+arrData[idx].gnum+'\');">'+ arrData[idx].gname + '</a></td>'  
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
	
	 $('#pagination-demo').twbsPagination({
	        totalPages: 10,
	        visiblePages: 5,
	        onPageClick: function (event, page) {
	            $('#page-content').text('Page ' + page);
	            
	            $.ajax({
	        	    type: "get",
	        	    url: "/nexven/gamedb/page?pageNo="+page,
	        	    contentType: "application/json",
	        		success: function(result) {
	        	        var json = JSON.stringify(result.games);
	        	        curruntPage = JSON.stringify(result.pageNo);
	        	        var json2 = JSON.parse(json);
	        	        var arrData = json2;
	        	    	
	        	    	var html = "";
	        	    	$.each(arrData, function(idx) {
	        	    	    html += '<tr>' 
	        	    	    + '<td class="active">' + '<a href="javascript:nload(\'/nexven/gamedb/detail.jsp?gNum='+arrData[idx].gnum+'\');">'+ arrData[idx].gname + '</a></td>'  
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
				<th>게임 이름</th>
				<th>개발사</th>
				<th>장르</th>
				<th>평점</th>
			</tr>
		</thead>
		<tbody class="gamedb">	
		
		</tbody>
	</table>
	<div aling="center">
	<ul id="pagination-demo" class="pagination-sm"></ul>
	</div>
<!-- </body> -->
<!-- </html> -->