<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">

	    var bNum = ${param.bNum};
	    $.ajax({
		    type: "GET",
		    async : true,
		    cache : false,
		    encoding: "UTF-8",
		    url: "boardnum?bNum="+bNum,
		    contentType: "application/json",
			success: function(result) {			
		        var json = JSON.stringify(result);
		        var arr = JSON.parse(json);
		        
		        $("#gname").html(arr.bname);
		        
		        var sdate = dateFormat(arr.bdate, "yyyy/dd/mm");
		        $("#gstartDate").html(sdate);
		        
		        $("#gmaker").html(arr.btitle);
		        $("#gpublisher").html(arr.bcategor);
		        $("#gserviceType").html(arr.mid);
		        $("#gplatform").html(arr.bhit);
		        $("#ggenre").html(arr.bgood);
		        $("#ghomepage").html(arr.bfile);
		        $("#grating").html(arr.mip);
		        $("#gintroduce").html(arr.bcontent);
		       	    	
		    },
		    error: function(){
		        alert('ajax 불러오기 실패');
		    }
		});
	    
	    
	

</script>
<!-- </head> -->
<!-- <body class="container"> -->

<div class="portfolio-modal">
		<div class="close-modal" onclick='javascript:nload("board/list.jsp?bName=WOW","WOW 커뮤니티","");'>
			<div class="lr">
				<div class="rl"></div>
			</div>
		</div>
</div>
<div class="table-responsive">
<table class="table">
<tr><td colspan="4" id="gname"></td><td colspan="2">평 점</td></tr>
<tr><td>출시일 : </td><td id="gstartDate"></td><td>제작사 : </td><td id="gmaker"></td><td rowspan="4" id="grating"></tr>
<tr><td>유통사 : </td><td id="gpublisher"></td><td>서비스 상태 : </td><td id="gserviceType"></td></tr>
<tr><td>플랫폼 : </td><td id="gplatform"></td><td>장르 : </td><td id="ggenre"></td></tr>
<tr><td>홈페이지 : </td><td id="ghomepage"></td><td></td><td></td></tr>
</table>

<div id="gintroduce">


</div>
</div>

<!-- </body> -->
<!-- </html> -->