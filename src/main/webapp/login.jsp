<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	if(session.getAttribute("mNick") != null){
%>
	<script>
		alert('이미 로그인이 되어있습니다.');
		location.href = "./";
	</script>
<%
	}else{
%>

<form id="nexven_login_form" style="text-align:center;margin:0 0 40px 0">
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
				<button id="nexven_login_submit" type="button" class="btn btn-primary" data-dismiss="modal">로그인</button>
				<button id="nexven_signin" type="button" class="btn btn-primary" onclick='javascript:nload("member_join.jsp","회원가입","mid");'>회원가입</button>
</form>


<script type="text/javascript">
		$("#nexven_login_submit").click(function()
		{
			var formData = $("#nexven_login_form").serialize();
 
			$.ajax({
					type : "POST",
				    async : true,
				    cache : false,
				    encoding: "UTF-8",
					data : formData,
					url : "member_login_ok",
					success: function(nchk) {
						var nchk = JSON.parse(JSON.stringify(nchk));
						
						if(nchk.success=="성공"){
							location.href = "./";	
						}
						else if(nchk.success=="탈퇴"){
							alert("탈퇴된 계정입니다.");
							nload("login.jsp","로그인","small");	
						}						
						else{
							alert("아이디 또는 패스워드가 틀렸습니다.");
							nload("login.jsp","로그인","small");
						}

					},
				    error: function(nchk2){
				    	alert("로그인 정보 불러오기 실패");
				    }
			});
		});

</script>






<!-- <script type="text/javascript">
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
	
</script> -->

<%
	}
%>