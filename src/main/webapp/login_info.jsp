<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	if(session.getAttribute("mNick") == null){
%>
	<script>
		alert('로그인이 필요합니다.');
		location.href = "./";
	</script>
<%
	}else{
%>

			<div class="modal-body" style="text-align:center;margin:40px 0 40px 0">
<!-- 	<h2>회원 정보</h2> -->
				<p><strong>${sessionScope.mNick }</strong> 님</p>
				<p>최종 로그인 시간 :</p>
				<button type="button" class="btn btn-primary kr" onclick='javascript:nload("member_modify.jsp","회원정보수정","mid");'>정보 수정</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="javascript:logout();">LOGOUT</button>
			</div>
<%
	}
%>