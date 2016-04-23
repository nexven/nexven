<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">

		var bNum = ${param.bNum};
		var bName;
	     
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