<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<style type="text/css">
.field {
	width: 100%;
}

.top {
	border-top: 2px solid;
	border-bottom: 1px solid;
	border-color: black;
	height: auto;
	margin-top: 7px;
	padding-bottom: 5px;
	padding-top: 5px;
	border-color: black
}

.titleNum {
	width: 13%;
	display: inline;
	float: left;
	text-align: center;
}

.titleDate {
	width: 54%;
	text-align: center;
	display: inline;
	float: left;
}

.titlecounts {
	width: 33%;
	display: inline;
	clear: both;
}

.titleddabong {
	margin-left: 10%;
	width: 50%;
	display: inline;
}

.titlecount {
	display: inline;
	float: right;
}

.body {
	width: 100%;
	height: auto;
}

.subject {
	font-weight: bold;
	width: 60%;
	display: inline;
	float: left;
}

.idinfo {
	border: 1px solid;
	padding: 13px 0 13px 15px;
	float: left;
	width: 38%;
	height: auto;
}

.contents {
	clear: both;
}

#memberPicture {
	float: left;
	width: 25%;
	height: 25%;
}

#nickName {
	width: 40%;
	display: inline;
	clear: right;
}

#commentlist {
	border: 1px solid #e1e1e1;
	padding: 0 5px;
}

#tr {
	clear: both;
	border-bottom: 1px solid #dcdcdc;
	padding: 8px 0;
	overflow: hidden;
}

#td {
	display: inline;
	float: left;
	margin-right: 6px;
}

.bottom {
	width: 100%;
	height: auto;
}

.articleBottomMenuTop {
	display: inline;
	float: left;
	width: 33%;
	height: 60px;
}

.articleBottomMenu {
	display: inline;
	float: left;
	clear: both;
	width: 214px;
}

.ddabongmain {
	display: inline;
	float: left;
	width: 34%;
	height: 60px;
}

.ddabongblock {
	margin-left: 25%;
	border: 2px solid;
	border-top-left-radius: 40px;
	border-top-right-radius: 15px;
	border-bottom-left-radius: 15px;
	border-bottom-right-radius: 40px; width : 50%;
	height: 100%;
	width: 50%;
}

.boardcont_menu {
	width: 33%;
	height: 60px;
}

.idImages {
	width: 24px;
}

.nickname {
	color: #000000;
	font-size: 12px;
	font-weight: normal;
	letter-spacing: 0;
}

.date {
	color: #848484;
	font-size: 10px;
	font-weight: normal;
	letter-spacing: 0;
	font-family: tahoma;
}

.commentTitle {
	display: inline;
	float: left;
	padding-top: 3px;
}

.delete {
	display: inline;
	float: left;
	height: 10px;
	margin: 4px 0 0 3px;
	overflow: hidden;
	text-indent: -1000em;
	width: 10px;
}

.comment {
	clear: both !important;
	float: left !important;
	margin-left: 8px;
	overflow: hidden;
	display: inline;
}
</style>
<meta charset="UTF-8">
<title>게시판 내용보기</title>
</head>

<body>
	<fieldset class="field">
		<div id="bbs">
			<form id="writeForm" action="write_proc.jsp" method="post"
				enctype="multipart/form-data">
				<div class="top">
					<div class="titleNum">글번호</div>
					<div class="titleDate">
						<b>${bcont.board_date}</b>
					</div>
					<div class="titlecounts">
						<div class="titleddabong">
							<b>추천&nbsp;:</b>0
						</div>
						<div class="titlecount">
							<b>조회&nbsp;:</b>${bcont.board_readcount}
						</div>
					</div>
				</div>
				<div>
					<div>[&nbsp;카테고리&nbsp;]</div>
				</div>
				<div class="body">
					<div class="subject">
						<h1>제목목모모모모모목</h1>
					</div>
					<div id="nickName">
						<b>닉네임</b><br />
						<progress value="4" max="100"></progress>
					</div>

				</div>
				<div class="contents">
					<%--  ${board_cont} --%>
					<pre>${bcont.board_content}</pre>
				</div>
			</form>
		</div>
		<hr>
		<div class="bottom">
			<div class="articleBottomMenuTop">
				<div class="articleBottomMenu">
					<span> <b><a href="board_list.nhn">목록</a></b>&nbsp;&nbsp;| <b>추천수(0)</b>
					</span>
				</div>
			</div>
			<div class="ddabongmain">
				<div class="ddabongblock">
						<div style="text-align: center;">
							<b>추천</b>
						</div>
						<hr style="color: #F6F6F6; border: 1px;">
						<div style="text-align: center;">
							<i>0</i>
						</div>
				</div>
			</div>
			<div class="boardcont_menu" style="float: left;">
				<input type="button" value="삭제" class="input_button"
					onclick="location='board_cont.nhn?board_num=${bcont.board_num}&page=${page}&state=del'"
					style="float: right;" /> <input type="button" value="수정"
					class="input_button"
					onclick="location='board_cont.nhn?board_num=${bcont.board_num}&page=${page}&state=edit'"
					style="float: right;" />
			</div>
		</div>
		<br style="clear: both;"></br>
		<hr style="border: 1px dotted; clear: both;">
		<div id="commentlist">
			<c:forEach var="b" items="${boardlist}">

				<div id="tr">
					<div class="commentTitle">
						<div id="td">
							<!-- 아이디 레벨 출력 부분 -->
							<img class="idImages" alt="레벨" src="#">
						</div>
						<div id="td">
							<span class="nickname"> <c:out value="${m_id}" />
							</span>
						</div>
						<div id="td">
							<span class="date">${m_recent_login_date}</span>
						</div>
					</div>
					<a class="delete"> <span
						class="glyphicons glyphicons-remove-circle"></span>
					</a>
					<div id="comment">
						<span align="center">${r_content}</span>
					</div>
				</div>

			</c:forEach>
		</div>
		<hr style="border: 1px dashed; clear: both;">

		<div class="comment">
			<div style="float: left;">
				<textarea rows="3" cols="100" placeholder=" 아름답고 깨끗한 댓글문화를 만듭시다."></textarea>
			</div>
			<div style="float: left;">
				<input type="button" value="등록" onclick="#"
					style="width: 50px; height: 50px;" />
			</div>
		</div>
		<div style="clear: both;">
			<input type="button" value="이전글" class="movebutton" onclick="#"
				style="float: left;"> <input type="button" value="다음글"
				class="movebutton" onclick="#" style="float: left;">
		</div>
	</fieldset>

</body>
</html>