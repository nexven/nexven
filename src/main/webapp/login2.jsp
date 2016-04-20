<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- <html> -->
<!-- <head> -->
<meta charset="UTF-8">
<!-- <script src="js/jquery.js"></script> -->
<script type="text/javascript">
	alert("login2.jsp");
	$(document).ready(function(){
	    $("#login").click(function(){
	    	alert("asd");
	    });
	    $("form").submit(function(){
	        alert("Submitted");
	    });
	});
</script>
<!-- </head> -->
<body>
<form method="post" action="member_login_ok">
	<div class="row">
		<div class="col-lg-8 col-lg-offset-2">
			<div class="modal-body">
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
				<button type="submit" class="btn btn-primary" data-dismiss="modal">LOGIN</button>
				<button type="button" class="btn btn-primary"
					data-target="#portfolioModal2" data-toggle="modal">SIGN IN</button>
			</div>
		</div>
	</div>
</form>
</body>
<!-- </html> -->