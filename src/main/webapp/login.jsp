<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	//alert("비동기 로그인 자바스크립트 테스트");
	
	$(document).ready(function(){

		$.ajax({
		    type: "get",
		    url: "dept/list",
		    contentType: "application/json",
			success: function(result) {
				var abc="";
				$(result).each(function(i,val){
				    $.each(val,function(k,v){
				        if(i>0){  
				    		abc+=k+" : "+ v+"<br/>";
				        }
					});
				});
				$(".testc2").html(abc);
		    },
		    error: function(){
		        alert('ajax 불러오기 실패');
		    }
		});	        
	        
	});
	
</script>
</head>
<body>
				<div class="row">
					<div class="col-lg-8 col-lg-offset-2">
						<div class="modal-body">
							<!-- Project Details Go Here -->
							<h2>LOGIN</h2>
							<p>
								<label style="display: inline-block; width: 35px;">ID</label><input
									type="text" style="width: 180px;" />
							</p>
							<p>
								<label style="display: inline-block; width: 35px;">PW</label><input
									type="password" style="width: 180px;" />
							</p>
							<button type="button" class="btn btn-primary" data-dismiss="modal">LOGIN</button>
							<button type="button" class="btn btn-primary"
								data-target="#portfolioModal2" data-toggle="modal">SIGN
								IN</button>
						</div>
					</div>
				</div>
</body>
</html>