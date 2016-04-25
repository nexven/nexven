<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html> -->
<!-- <html data-ng-app="nexven"> -->
<!-- <script src="//code.jquery.com/jquery-1.12.0.min.js"></script> -->
<!-- <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script> -->
<!-- <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular.min.js"></script> -->
<!-- <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> -->
<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>detail.jsp</title> -->
<script type="text/javascript">

	    var gNum = ${param.gNum};
	    $.ajax({
		    type: "get",
		    url: "/nexven/gamedb?gNum="+gNum,
		    contentType: "application/json",
			success: function(result) {
				
		        var json = JSON.stringify(result);
		        var arr = JSON.parse(json);
		        
		        $("#gname").html(arr.gname);
		        
		        var sdate = dateFormat(arr.gstartDate , "yyyy/dd/mm");
		        $("#gstartDate").html(sdate);
		        
		        $("#gmaker").html(arr.gmaker);
		        $("#gpublisher").html(arr.gpublisher);
		        $("#gserviceType").html(arr.gserviceType);
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
<!-- </head> -->
<!-- <body class="container"> -->

<div class="portfolio-modal">
		<div class="close-modal" onclick="javascript:nload('/nexven/gamedb/list.jsp');">
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