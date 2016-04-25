<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">

	$.ajax({
	    type: "GET",
	    async : true,
	    cache : false,
	    encoding: "UTF-8",
	    url: "/nexven/gamedb/page?pageNo=1",
	    contentType: "application/json",
		success: function(result) {
			var total = JSON.stringify(result.totalCount);
	        var json = JSON.stringify(result.games);
	        var json2 = JSON.parse(json);
	        var arrData = json2;

	        totalpage = Math.ceil(total / 10);
	    	
	    	var html = "";
	    	
	    	$.each(arrData, function(idx) {
	    	    html += '<div class="row" style="margin:0 auto;padding:10px 0;border-bottom: 1px solid #eee;">'
	    	    + '<div class="col-sm-4 col-xs-8 active">' + "<a href='javascript:nload(\"/nexven/gamedb/detail.jsp?gnum="+arrData[idx].gnum+"\",\"게임DB 내용\",\"\");'>"+ arrData[idx].gname + "</a></div>"  
	    	    + '<div class="col-sm-3 col-xs-0 active">' + arrData[idx].gmaker + '</div>'
	    	    + '<div class="col-sm-3 col-xs-0 active">' + arrData[idx].ggenre + '</div>' 
	    	    + '<div class="col-sm-2 col-xs-4 active">' + arrData[idx].grating + '</div>' 
	    	    + '</div>' ;
	    	});
	    	
	    	$(".gamedb").html(html);
		
	    },
	    error: function(){
	        alert('게임DB 불러오기 실패');
	    }
	});
	$('#pagination-demo').twbsPagination({
        totalPages: totalpage,
        visiblePages: 5,
        onPageClick: function (event, page) {
            $('#page-content').text('Page ' + page);
            
            $.ajax({
        	    type: "get",
        	    async : true,
        	    cache : false,
        	    encoding: "UTF-8",
        	    url: "/nexven/gamedb/page?pageNo="+page,
        	    contentType: "application/json",
        		success: function(result) {
        			var total = JSON.stringify(result.totalCount);
        	        var json = JSON.stringify(result.games);
        	        curruntPage = JSON.stringify(result.pageNo);
        	        var json2 = JSON.parse(json);
        	        var arrData = json2;
        	        totalpage = Math.ceil(total / 10);
        	    	
        	    	var html = "";
        	    	$.each(arrData, function(idx) {
        	    		html += '<div class="row" style="margin:0 auto;padding:10px 0;border-bottom: 1px solid #eee;">'
        		    	    + '<div class="col-sm-4 col-xs-8">' + "<a href='javascript:nload(\"/nexven/gamedb/detail.jsp?gnum="+arrData[idx].gnum+"\",\"게임DB 내용\",\"\");'>"+ arrData[idx].gname + "</a></div>"  
        		    	    + '<div class="col-sm-3 col-xs-0">' + arrData[idx].gmaker + '</div>'
        		    	    + '<div class="col-sm-3 col-xs-0">' + arrData[idx].ggenre + '</div>' 
        		    	    + '<div class="col-sm-2 col-xs-4">' + arrData[idx].grating + '</div>' 
        		    	    + '</div>' ;
        	    	});
        	    	
        	    	$(".gamedb").html(html);
        		
        	    },
        	    error: function(){
        	        alert('게임DB 불러오기 실패');
        	    }
        	});
            
            
        }
    });

</script>

<div class="text-center kr" style="margin:20px auto">

	<div style="padding-bottom:20px;text-align: right;">
		<button onclick='javascript:nload("/nexven/gamedb/append.jsp","GameDB 게임추가","");' class="btn btn-default"><i class="glyphicon glyphicon-edit"> 게임추가</i></button>
	</div>

	<div class="row" style="margin:0 auto;padding:15px 0;border-top:1px solid #ccc;border-bottom:1px solid #ccc;">
		<div class="col-sm-4 col-xs-8">게임 이름</div>
		<div class="col-sm-3 col-xs-0">개발사</div>
		<div class="col-sm-3 col-xs-0">장르</div>
		<div class="col-sm-2 col-xs-4">평점</div>
	</div>
	<div class="gamedb" class="row" style="margin:0 auto;">
		
	</div>

	<div align="center">
	<ul id="pagination-demo" class="pagination-sm"></ul>
	</div>
	
	<div style="padding-top:20px;text-align: right;">
			<button onclick='javascript:nload("/nexven/gamedb/append.jsp","GameDB추가","");' class="btn btn-default"><i class="glyphicon glyphicon-edit"> 게임추가</i></button>
	</div>
</div>