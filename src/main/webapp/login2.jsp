<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <script src="js/jquery.js"></script> -->
<script type="text/javascript">
	$(document).ready(function(){
		$("#nexven_submit").click(function()
		{
			var formData = $("#nexven_form").serialize();
			alert(formData);
 
			$.ajax({
	 					type : "POST",
	 					url : "member_login_ok",
	 					data : formData,
	 					cache : false,
	 					async : true,
	 					success: function(nchk) {
	 						alert(nchk);
	 						if(nchk=="success"){
	 							location.href = "./"	
	 						}else{
	 							nload("login2.jsp");
	 						}
	 				    	
	 				    	alert("sibal");
	 					},
	 				    error: function(nchk){
	 				    	//nchk=JSON.stringify(nchk);
							alert(nchk);
	 				    }

			});
		});
		
	});
</script>
<!-- </head> -->
<!-- <body> -->
<form id="nexven_form" method="post">
				<!-- Project Details Go Here -->
				<h2>LOGIN</h2>
				<p>
					<label style="display: inline-block; width: 35px;">ID</label><input
						id="id" name="id" type="text" style="width: 180px;" />
				</p>
				<p>
					<label style="display: inline-block; width: 35px;">PW</label><input
						id="pwd" name="pwd" type="password" style="width: 180px;" />
				</p>
				<button id="nexven_submit" type="submit" class="btn btn-primary" data-dismiss="modal">LOGIN</button>
				<button id="nexven_signin" type="button" class="btn btn-primary" data-toggle="modal" onclick="javascript:nload('member_join.jsp');">SIGN IN</button>
</form>
<!-- </body> -->
<!-- </html> -->