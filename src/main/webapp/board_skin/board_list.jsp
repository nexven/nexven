<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">

<!-- <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> -->

<!-- <link rel="stylesheet" href="../../css/style.css"> -->

<style>
@import url("./css/list1.css");
</style>
<head>
<meta charset="UTF-8">
<title>스포츠 게시판</title>
</head>

<body>
	<!-- 게시판 리스트 -->
	<fieldset class="field">
		<span><img alt="사아진" src="/springboard/images/sports.jpg"></span>
		<div class='ribbon'>
			<a href='#'><span font color="">전체보기</span></a> <a href='#'><span>추천글</span></a>
			<a href='#'><span>기타</span></a> <a href='#'><span>기타</span></a>
			<a href='#'><span>기타</span></a> <a href='#'><span>기타</span></a>
			<div class="background"></div>
		</div>

		<hr>

			<div id="hor-minimalist-b">
				<div id="tr">
					<div id="th" style="font-family: Tahoma; font-size: 8pt; width:6%;">
						<div align="center">번호</div>
					</div>
					<div id="th" style="font-family: Tahoma; font-size: 8pt; width: 54%;" >
						<div align="center">제목</div>
					</div>
					<div id="th" style="font-family: Tahoma; font-size: 8pt; width:12%;" >
						<div align="center">작성자</div>
					</div>
					<div id="th" style="font-family: Tahoma; font-size: 8pt; width:14%;" >
						<div align="center">날짜</div>
					</div>
					<div id="th" style="font-family: Tahoma; font-size: 8pt; width:8%;">
						<div align="center">조회수</div>
					</div>
					<div id="th" style="font-family: Tahoma; font-size: 8pt; width:6%;" >
						<div align="center">추천수</div>
					</div>
				</div>

 				<!-- 화면 출력 번호  변수 정의 -->
				<c:set var="num" value="${listcount-(page-1)*10}" />

				<!-- 반복문 시작 -->
				<c:forEach var="b" items="${boardlist}">

					<div id="tr"
					onmouseover="this.style.backgroundColor='F8F8F8'"
					onmouseout="this.style.backgroundColor=''">
						<div id="td" style="font-family: Tahoma; font-size: 8pt; width:6%;" align="center">
							<!-- 번호 출력 부분 --> <c:out value="${num}" /> <c:set var="num"
								value="${num-1}" />
						</div>

						<div id="td" style="font-family: Tahoma; font-size: 10pt; width: 54%;">
							<div align="left">

<%-- 	답글관련 내용 주석처리							
<c:if test="${b.board_re_lev != 0}">
									<c:forEach var="k" begin="1" end="${b.board_re_lev}">
							&nbsp;&nbsp;			
						</c:forEach>
									<img src="./images/AnswerLine.gif">
								</c:if>
 --%>
								<!-- 제목 출력 부분 -->
								<a
									href="board_cont.nhn?board_num=${b.board_num}&page=${page}&state=cont">
									${b.board_subject} </a>
							</div>
						</div>

						<div id="td" style="font-family: Tahoma; font-size: 12pt; width:12%;">
							<div align="center">${b.board_name}</div>
						</div>
						<div id="td" style="font-family: Tahoma; font-size: 8pt; width:14%;">
							<div align="center">${b.board_date}</div>
						</div>
						<div id="td" style="font-family: Tahoma; font-size: 8pt; width:8%;">
							<div align="center">${b.board_readcount}</div>
						</div>
						<div id="td" style="width: 6%;"><div align="center">0</div></div>
					</div>

				</c:forEach>
				<!-- 반복문 끝 -->
			</div>
			<br><hr>
			<div id="bbslist_w">
				<div id="bbslist_paging">
					<c:if test="${page <=1 }">
				[이전]&nbsp;
			</c:if>

					<c:if test="${page > 1 }">
						<a href="board_list.nhn?page=${page-1}">[이전]</a>&nbsp;
			</c:if>

					<c:forEach var="a" begin="${startpage}" end="${endpage}">
						<c:if test="${a == page }">
					[${a}]
				</c:if>
						<c:if test="${a != page }">
							<a href="board_list.nhn?page=${a}">[${a}]</a>&nbsp;
				</c:if>
					</c:forEach>

					<c:if test="${page >= maxpage }">
				[다음] 
			</c:if>
					<c:if test="${page < maxpage }">
						<a href="board_list.nhn?page=${page+1}">[다음]</a>
					</c:if>
				</div>
				<!-- 페이징 끝 -->

				<input style="float: right" type="button" value="글쓰기"
					class="input_button"
					onclick="location='board_write.nhn?page=${page}'"> <input
					type="button" value="목록" style="float: right;" />
			</div>
		<form>
			<select>
				<option value="title">제목</option>
				<option value="contents">내용</option>
				<option value="nickname">닉네임</option>
				<option value="title_contents">제목+내용</option>
			</select> <input type="text" value="" /> <input type="button" value="검색" />
		</form>

	</fieldset>
</body>
</html>