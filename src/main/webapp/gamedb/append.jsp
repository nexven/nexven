<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">

function getFormData($form){
    var unindexed_array = $form.serializeArray();
    var indexed_array = {};

    $.map(unindexed_array, function(n, i){
        indexed_array[n['name']] = n['value'];
    });

    return indexed_array;
}

$('#gamedb_append').click(function(){
	var $dbForm = $("#gameDbForm");
	var dbData = getFormData($dbForm);

// 	var game = { "gNum" : $('#gNum').val() ,
// 		 "gName" : $('#gName').val() ,
// 		 "gStartDate" : $('#gStartDate').val() ,
// 		 "gMaker" : $('#gMaker').val() ,
// 		 "gPublisher" : $('#gPublisher').val() ,
// 		 "gServiceType" : $('#gServiceType').val() ,
// 		 "gPlatform" : $('#gPlatform').val() ,
// 		 "gGenre" : $('#gGenre').val() ,
// 		 "gHomepage" :$('#gHomepage').val() ,
// 		 "gRating" : $('#gRating').val()  ,
// 		 "gIntroduce" : $('#gIntroduce').val()  };
	
// 	alert(game);
// 	alert(JSON.stringify(game));

	$.ajax({
    	type: "post",
   	    url: "/nexven/gamedb",
    contentType: "application/json",
    dataType: "json",
    data: JSON.stringify(dbData),
	success: function(result) {
        var re = JSON.stringify(result.success);
        var me = JSON.stringify(result.message); 
        alert("success = " + re + "  message =" + me );
        nload('/nexven/gamedb/list.jsp');
    },
    
    error: function(){
        alert('입력 실패');
        nload('/nexven/gamedb/list.jsp');
    }
	});
	
});

</script>


	<div style="padding-bottom:20px;margin-bottom:10px;border-bottom:1px solid #ccc;">
		<button onclick="javascript:nload('/nexven/gamedb/list.jsp');" class="btn btn-default"><i class="glyphicon glyphicon-list"> 목록으로</i></button>
	</div>

<form id="gameDbForm" name="gameDbForm" >
	<div class="form-group">
	<label for="gNum">게임번호 : </label>
	<input id="gNum" name="gnum" class="form-control" required="required" type="number" >
	</div>
	
	<div class="form-group">
	<label for="gName">게임이름 : </label>
	<input id="gName" name="gname" class="form-control" required="required" type="text" >
	</div>
	
	<div class="form-group">
	<label for="gStartDate">게임 출시일 : </label>
	<input id="gStartDate" name="gstartdate" class="form-control" required="required" type="date" >
	</div>
	
	<div class="form-group">
	<label for="gMaker">제작사 : </label>
	<input id="gMaker" name="gmaker" class="form-control" required="required" type="text" >
	</div>
	
	<div class="form-group">
	<label for="gPublisher">유통사 : </label>
	<input id="gPublisher" name="gpublisher" class="form-control" required="required" type="text" >
	</div>
	
	<div class="form-group">
	<label for="gServiceType">서비스 상태 : </label>
	<input id="gServiceType" name="gservicetype" class="form-control" required="required" type="text" >
	</div>
	
	<div class="form-group">
	<label for="gPlatform">플랫폼 : </label>
	<input id="gPlatform" name="gplatform" class="form-control" required="required" type="text" >
	</div>
	
	<div class="form-group">
	<label for="gGenre">장르 : </label>
	<input id="gGenre" name="ggenre" class="form-control" required="required" type="text" >
	</div>
	
	<div class="form-group">
	<label for="gHomepage">홈페이지 : </label>
	<input id="gHomepage" name="ghomepage" class="form-control" required="required" type="text" >
	</div>
	
	<div class="form-group">
	<label for="gRating">평점 : </label>
	<input id="gRating" name="grating" class="form-control" required="required" type="number" >
	</div>
	
	<div class="form-group">
	<label for="gIntroduce">게임소개 : </label>
	<input id="gIntroduce" name="gintroduce" class="form-control" required="required" type="text" >
	</div>
	
	<button id="gamedb_append" type="button" class="btn btn-primary" >게임추가</button>
</form>

	<div style="padding-bottom:20px;margin-bottom:10px;border-bottom:1px solid #ccc;">
		<button onclick="javascript:nload('/nexven/gamedb/list.jsp');" class="btn btn-default"><i class="glyphicon glyphicon-list"> 목록으로</i></button>
	</div>

