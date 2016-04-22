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

	$.ajax({
	    type: "GET",
	    async : true,
	    cache : false,
	    encoding: "UTF-8",
	    url: "gamedb/list",
	    contentType: "application/json",
		success: function(result) {
	        var json = JSON.stringify(result);
	        var json2 = JSON.parse(json);
	        var arrData = json2;
	    	
	    	var html = "";
	    	$.each(arrData, function(idx) {
	    	    html += '<div class="row">' 
	    	    + '<div class="col-sm-6 col-xs-10">' + '<a href="javascript:nload(\'/nexven/gamedb/detail.jsp?gNum='+arrData[idx].gnum+'\',\'게임DB\',\'\');">'+ arrData[idx].gname + '</a></div>'  
	    	    + '<div class="col-sm-2 col-xs-0">' + arrData[idx].gmaker + '</div>'
	    	    + '<div class="col-sm-2 col-xs-0">' + arrData[idx].ggenre + '</div>' 
	    	    + '<div class="col-sm-2 col-xs-2">' + arrData[idx].grating + '</div>' 
	    	    + '</div>' ;
	    	});
	    	
	    	$(".gamedb").html(html);
		
	    },
	    error: function(){
	        alert('ajax 불러오기 실패');
	    }
	});
	
// 	 $('#pagination-demo').twbsPagination({
// 	        totalPages: 10,
// 	        visiblePages: 5,
// 	        onPageClick: function (event, page) {
// 	            $('#page-content').text('Page ' + page);
	            
// 	            $.ajax({
// 	        	    type: "GET",
// 	        	    async : true,
// 	        	    cache : false,
// 	        	    encoding: "UTF-8",
// 	        	    url: "/nexven/gamedb/page?pageNo="+page,
// 	        	    contentType: "application/json",
// 	        		success: function(result) {
// 	        	        var json = JSON.stringify(result.games);
// 	        	        curruntPage = JSON.stringify(result.pageNo);
// 	        	        var json2 = JSON.parse(json);
// 	        	        var arrData = json2;
	        	    	
// 	        	    	var html = "";
// 	        	    	$.each(arrData, function(idx) {
// 	        	    	    html += '<tr>' 
// 	        		        + '<td class="active">' + '<a href="javascript:nload(\"/gamedb/detail.jsp?gNum='+arrData[idx].gnum+'\",\"게임DB\",\"\");">'+ arrData[idx].gname + '</a></td>'
// 	        	    	    + '<td class="active">' + arrData[idx].gmaker + '</td>'
// 	        	    	    + '<td class="active">' + arrData[idx].ggenre + '</td>' 
// 	        	    	    + '<td class="active">' + arrData[idx].grating + '</td>' 
// 	        	    	    + '</tr>' ;
// 	        	    	});
	        	    	
// 	        	    	$(".gamedb").html(html);
	        		
// 	        	    },
// 	        	    error: function(){
// 	        	        alert('ajax 불러오기 실패');
// 	        	    }
// 	        	});
	            
	            
// 	        }
// 	    });
	


</script>

<!-- </head> -->

<!-- <body> -->

<h1>게임 DB</h1>
<div class="row">
	<div class="col-sm-6 col-xs-10">게임 이름</div>
	<div class="col-sm-2 col-xs-0">개발사</div>
	<div class="col-sm-2 col-xs-0">장르</div>
	<div class="col-sm-2 col-xs-2">평점</div>
</div>
<div class="gamedb">
	
</div>

	<div align="center">
	<ul id="pagination-demo" class="pagination-sm"></ul>
	</div>
<!-- </body> -->
<!-- </html> -->