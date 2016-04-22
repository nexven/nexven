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
		session.invalidate();
	}
%>