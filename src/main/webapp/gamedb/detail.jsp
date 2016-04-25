<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">

	    var gnum = ${param.gnum};
	    $.ajax({
		    type: "get",
		    url: "/nexven/gamedb?gnum="+gnum,
		    contentType: "application/json",
			success: function(result) {
				
		        var json = JSON.stringify(result);
		        var arr = JSON.parse(json);
		        
		        $("#gname").html(arr.gname);
		        
		        var sdate = dateFormat(arr.gstartdate , "yyyy/MM/dd");
		        $("#gstartdate").html(sdate);
		        
		        $("#gmaker").html(arr.gmaker);
		        $("#gpublisher").html(arr.gpublisher);
		        $("#gservicetype").html(arr.gservicetype);
		        $("#gplatform").html(arr.gplatform);
		        $("#ggenre").html(arr.ggenre);
		        $("#ghomepage").html(arr.ghomepage);
		        $("#grating").html(arr.grating);
		        $("#gintroduce").html(arr.gintroduce);
		       	    	
		    },
		    error: function(){
		        alert('ajax 불러오기 실패');
		    }
		});
	    
	    
	

</script>


<div style="padding-bottom:20px;margin-bottom:10px;border-bottom:1px solid #ccc;">
		<button onclick="javascript:nload('/nexven/gamedb/list.jsp');" class="btn btn-default"><i class="glyphicon glyphicon-list"> 목록으로</i></button>
</div>
<div class="table-responsive">
<table class="table table-bordered table-hover" style="margin:0;">
<tr><td colspan="4" id="gname"></td><td colspan="2">평 점</td></tr>
<tr><td>출시일 : </td><td id="gstartdate"></td><td>제작사 : </td><td id="gmaker"></td><td rowspan="4" id="grating"></tr>
<tr><td>유통사 : </td><td id="gpublisher"></td><td>서비스 상태 : </td><td id="gservicetype"></td></tr>
<tr><td>플랫폼 : </td><td id="gplatform"></td><td>장르 : </td><td id="ggenre"></td></tr>
<tr><td>홈페이지 : </td><td id="ghomepage"></td><td></td><td></td></tr>
</table>

<div id="gintroduce">


</div>
</div>
