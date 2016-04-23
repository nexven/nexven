<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">

	    var bName = "${param.bName}";
	    
/* 	    $.ajax({
		    type: "GET",
		    async : true,
		    cache : false,
		    encoding: "UTF-8",
		    url: "boardnum?bNum="+bNum,
		    contentType: "application/json",
			success: function(result) {			
		        var json = JSON.stringify(result);
		        var arr = JSON.parse(json);
		        
		        $("#bname").html(arr.bname);		        
		        //var sdate = dateFormat(arr.bdate, "yyyy/dd/mm");
		        $("#bdate").html(arr.bdate);		        
		        $("#btitle").html(arr.btitle);
		        $("#bcategory").html(arr.bcategory);
		        $("#mid").html(arr.mid);
		        $("#bhit").html(arr.bhit);
		        $("#bgood").html(arr.bgood);
		        $("#bfile").html(arr.bfile);
		        $("#mip").html(arr.mip);
		        $("#bcontent").html(arr.bcontent);		        
		        $("#bfile").html(arr.bfile);
		        $("#bstate").html(arr.bstate);
		        $("#mip").html(arr.mip);
		        $("#mtel").html(arr.mtel);
		        $("#bprice").html(arr.bprice);
		        $("#bcontent").html(arr.bcontent);
		        
		        bName=arr.bname;
		       	    	
		    },
		    error: function(){
		        alert('게시글 불러오기 실패');
		    }
		});
	     */
	     
		function list(){
			nload("board/list.jsp?bName="+bName,bName+" 커뮤니티","");
			return false;
		}
	

</script>


	<div style="padding-bottom:20px;margin-bottom:10px;border-bottom:1px solid #ccc;">
		<button onclick='javascript:list();' class="btn btn-default"><i class="glyphicon glyphicon-list"> 목록으로</i></button>
	</div>

	<div class="table-responsive">
		 <table class="table table-bordered table-hover" style="margin:0;">
			<tbody>
				<tr>
			 		<th>작성자</th>
			 		<td id="mid"></td>
	
			 		<th>카테고리</th>
			 		<td id="bcategory"></td>
			 	</tr>
				<tr>
			 		<th>작성시간</th>
			 		<td id="bdate"></td>
	
			 		<th>조회수</th>
			 		<td id="bhit"></td>
			 	</tr>
			 	<tr>
			 		<th>추천</th>
			 		<td id="bgood"></td>
	
			 		<th>첨부파일</th>
			 		<td id="bfile"></td>
		 		</tr>
		 		<tr>
			 		<th>아이피</th>
			 		<td id="mip"></td>
			 		
			 		<th>연락처</th>
			 		<td id="mtel"></td>
		 		</tr>
	
				<tr>
				 	<th>거래상태</th>
			 		<td id="bstate"></td>
			 		
			 		<th>물품금액</th>
			 		<td id="bprice"></td>
			 	</tr>
				<tr>
	
			 	</tr>
		 	</tbody>
		 </table>
	</div>

	<div id="bcontent" style="margin:20px 0;padding:20px;">

	</div>

	<div style="padding-top:20px;border-top:1px solid #ccc;">
		<button onclick='javascript:list();' class="btn btn-default"><i class="glyphicon glyphicon-list"> 목록으로</i></button>
	</div>

<!-- </body> -->
<!-- </html> -->