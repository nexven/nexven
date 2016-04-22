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
	    	    html += '<tr>'
	    	    + '<td class="active">' + arrData[idx].bnum + '</td>'	    	    
	    	    + '<td class="active">' + arrData[idx].bname + '</td>'
	    	    + '<td class="active">' + '<a href="javascript:nload(\'board/detail.jsp?bNum='+arrData[idx].bnum+'\',\' '+bName+' 커뮤니티 내용\',\'\');">'+ arrData[idx].btitle + '</a></td>' 
	    	    + '<td class="active">' + arrData[idx].bcategory + '</td>' 
	    	    + '<td class="active">' + arrData[idx].mid + '</td>' 
	    	    + '</tr>' ;
	    	});
	    	
	    	$(".community").html(html);
		
	    },
	    error: function(){
	        alert('ajax 불러오기 실패');
	    }
	});
	



</script>

<table class="table table-bordered table-hover">
		<thead>
			<tr>
				<th>글번호</th>
				<th>게시판이름</th>
				<th>제목</th>
				<th>카테고리</th>
				<th>아이디</th>
			</tr>
		</thead>
		<tbody class="community">	
		
		</tbody>
	</table>
	<div align="center">
	<ul id="pagination-demo" class="pagination-sm"></ul>
	</div>
