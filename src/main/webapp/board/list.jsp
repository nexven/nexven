<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">

	var bName = "${param.bName}";

	$.ajax({
	    type: "GET",
	    async : true,
	    cache : false,
	    encoding: "UTF-8",
	    url: "board?bName="+bName,
	    contentType: "application/json",
		success: function(result) {
	        var json = JSON.stringify(result);
	        //alert(json);
	        var arrData = JSON.parse(json);
	    	//alert(arrData);
	    	var html = "";
	    	$.each(arrData, function(idx) {
	    	    html += '<div class="row text-center" style="border-bottom: 1px solid #eee;">'
	    	    + '<div class="col-md-1 col-sm-1 col-xs-2 active">' + arrData[idx].bnum + '</div>'	    	    
	    	    + '<div class="col-md-2 col-sm-2 col-xs-2 active">' + arrData[idx].bcategory + '</div>'
	    	    + '<div class="col-md-3 col-sm-3 col-xs-5 active">' + '<a href="javascript:nload(\'board/detail.jsp?bNum='+arrData[idx].bnum+'\',\' '+bName+' 커뮤니티 내용\',\'\');">'+ arrData[idx].btitle + '</a></div>'
 	    	    + '<div class="col-md-1 col-sm-1 col-xs-2 active">' + arrData[idx].mid + '</div>' 
	    	    + '<div class="col-md-2 col-sm-2 col-xs-0 active">' + arrData[idx].bdate + '</div>'
	    	    + '<div class="col-md-1 col-sm-1 col-xs-1 active">' + arrData[idx].bhit + '</div>'
	    	    + '<div class="col-md-1 col-sm-1 col-xs-0 active">' + arrData[idx].bgood + '</div>'
	    	    + '<div class="col-md-0 col-sm-0 col-xs-0 active">' + arrData[idx].bname + '</div>'
	    	    + '</div>' ;
	    	});
	    	
	    	$(".community").html(html);
		
	    },
	    error: function(){
	        alert(bName+' 커뮤니티 불러오기 실패');
	    }
	});
	



</script>
<div style="margin:30px 20px;">
	<div class="row text-center" style="border: 2px solid;border-radius: 25px;">
		<div class="col-md-1 col-sm-1 col-xs-2">글번호</div>
		<div class="col-md-2 col-sm-2 col-xs-2">카테고리</div>
		<div class="col-md-3 col-sm-3 col-xs-5">제목</div>
		<div class="col-md-1 col-sm-1 col-xs-2">아이디</div>
		<div class="col-md-2 col-sm-2 col-xs-0">작성일</div>
		<div class="col-md-1 col-sm-1 col-xs-1">조회수</div>
		<div class="col-md-1 col-sm-1 col-xs-0">추천</div>
		<div class="col-md-0 col-sm-0 col-xs-0">게시판이름</div>
	</div>
	<div class="community">	
			
	</div>
</div>
<!-- 	<div align="center"> -->
<!-- 	<ul id="pagination-demo" class="pagination-sm"></ul> -->
<!-- 	</div> -->
