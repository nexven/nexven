<%@ page import="org.springframework.web.servlet.mvc.condition.HeadersRequestCondition"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%
	response.setHeader("Referer", "http://www.inven.co.kr/webzine/news/");
%>

<%--
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>news.jsp</title>

<style type="text/css">
		h1{text-align:center}
		th{text-align:center}
		#start{margin:0 auto;border: 1px solid #222;width:970px}
		#pic{background-image:url("${v['news_content_pic']}");width:150px;height:150px}
		a:LINK {color:black;text-decoration:none}
		a:VISITED {color:black;text-decoration:none}
		a:HOVER {color:blue;text-decoration:none}
	</style>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
</head>
<body>
--%>

<!-- 	<h2 class="text-center" style="margin-top:30px">GAME NEWS</h2> -->

	<div class="text-center kr" style="margin:30px auto">
		<div class="titlelink" style="font-size:1.8em;color:#567;text-shadow:1px 1px 2px #579">
			[<a href="javascript:;" onclick='javascript:nload("news","게임뉴스","");'>전체뉴스</a>]&nbsp;
			[<a href="javascript:;" onclick='javascript:nload("news?tab=24","게임뉴스","");'>칼럼</a>]&nbsp;
			[<a href="javascript:;" onclick='javascript:nload("news?tab=25","게임뉴스","");'>기획기사</a>]&nbsp;
			[<a href="javascript:;" onclick='javascript:nload("news?tab=17","게임뉴스","");'>인터뷰</a>]&nbsp;
			[<a href="javascript:;" onclick='javascript:nload("news?tab=12","게임뉴스","");'>리뷰</a>]&nbsp;
			[<a href="javascript:;" onclick='javascript:nload("news?tab=11","게임뉴스","");'>프리뷰</a>]&nbsp;
			[<a href="javascript:;" onclick='javascript:nload("news?tab=1","게임뉴스","");'>영상</a>]
			
		</div>	
		<%-- <form id="nsForm" class="form-inline" action="javascript:return false;" onsubmit='javascript:nload("news?sel="+$("#sel").val()+"&sw="+$("#sw").val()+"&tab="+$("#tab").val(),"게임뉴스","");' style="margin:20px auto;" role="form"> --%>
		<form id="nsForm" class="form-inline" action="javascript:return false;" onsubmit='javascript:nsSearch();' style="margin:40px auto;" role="form">
			<div class="search form-group">
				<select id="sel" name="sel" class="form-control">
					<option value="t">제목</option>
					<option value="d">내용</option>
					<option value="c">분류</option>
				</select>
				<input type="text" name="sw" id="sw" class="form-control" maxlength="20" size="20" value="${sw}" />
				<input type="submit" class="btn btn-default" value="검색" />
			</div>
		</form>
		<div class="row" style="margin:0 auto;padding:15px 0;border-top:1px solid #ccc;border-bottom:1px solid #ccc;font-size:18px">
			<div class="col-md-3 col-sm-3 col-xs-4"><strong>이미지</strong></div>
			<div class="col-md-5 col-sm-5 col-xs-8"><strong>제목</strong></div>
			<div class="col-md-2 col-sm-2 col-xs-0"><strong>분류</strong></div>
			<div class="col-md-2 col-sm-2 col-xs-0"><strong>작성일</strong></div>
		</div>

		<c:forEach var="v" items="${nexven_news}">
			<div class="row" style="margin:20px 0px;">
				<div class="col-md-3 col-sm-3 col-xs-4">
					<c:if test="${!empty v['enclosure']}">
						<a href='javascript:nload("${v["link"]}","게임뉴스 내용","");'>
							<img src="${v['enclosure']}" width="100%" height="100%" style="max-width:270px;max-height:214px;" />
						</a>
					</c:if>
					<c:if test="${empty v['enclosure']}">
						<a href='javascript:nload("${v["link"]}","게임뉴스 내용","");'>
							<img src="https://placeholdit.imgix.net/~text?txtsize=70&txtclr=000000&txt=NO%20IMAGE&txttrack=4&w=640&h=480&bg=eeeeee" width="100%" height="100%" style="max-width:270px;max-height:214px;" />
						</a>
					</c:if>

				</div>
				<div class="col-md-5 col-sm-5 col-xs-8 titlelink" style="text-align:left !important;font-size:14px">
					<div style="margin-bottom:10px;font-size:18px">
						<strong><a href='javascript:nload("${v["link"]}","게임뉴스 내용","");'>${v["title"]}</a></strong>
					</div>
					<div class="col-md-12 col-sm-0 col-xs-0" style="padding:0;" >
						<em>${v["description"]}...</em>
					</div>
				</div>
				<div class="col-md-2 col-sm-2 col-xs-0">
					<c:if test="${empty v['category3']}">
						${v['category2']}
					</c:if>
					<c:if test="${!empty v['category3']}">
						${v['category3']}
					</c:if>

				</div>
				<div class="col-md-2 col-sm-2 col-xs-0">${v['pubDate']}</div>
			</div>
			<div class="row" style="background-color:#ddd;height: 1px; margin: 5px 0px 5px 0px;"></div>
		</c:forEach>
		
		<div>
			<ul id="npage" class="pagination pagination-lg" style="margin:30px 0 0">
			  <li><a href="javascript:;" onclick='javascript:nload("news?page=1","게임뉴스","");'>1</a></li>
			  <li><a href="javascript:;" onclick='javascript:nload("news?page=2","게임뉴스","");'>2</a></li>
			  <li><a href="javascript:;" onclick='javascript:nload("news?page=3","게임뉴스","");'>3</a></li>
			  <li><a href="javascript:;" onclick='javascript:nload("news?page=4","게임뉴스","");'>4</a></li>
			  <li><a href="javascript:;" onclick='javascript:nload("news?page=5","게임뉴스","");'>5</a></li>
			</ul>
		</div>
	</div>

<script>
	function nsSearch(){
		var nsForm = $("#nsForm").serialize();
		nload("news?"+"page=${page}&tab=${tab}&"+nsForm,"게임뉴스","");
	}

	if("${sel}" != ""){
		$("#sel").val("${sel}");
	}

	switch ("${page}") {
	case "1":
		$("#npage > li:eq(0)").attr("class","active");
		break;
	case "2":
		$("#npage > li:eq(1)").attr("class","active");
		break;
	case "3":
		$("#npage > li:eq(2)").attr("class","active");
		break;
	case "4":
		$("#npage > li:eq(3)").attr("class","active");
		break;
	case "5":
		$("#npage > li:eq(4)").attr("class","active");
		break;
	default:
		break;
	}
</script>



<%-- 
<P>
<c:forEach var="v" items="${nexven_news}">

<div id="start">
	<div>
		RSS_Title = <a href="news_content?link=${v['link']}">${v['title']}</a>
				RSS_Title = <a href="news_content?link=${v['link'].replace('http://www.inven.co.kr/webzine/news/?news=', '')}">${v['title']}</a>
	</div>
	
	<div>
		RSS_Description = ${v['description']}
	</div>
	
	<div>
		RSS_Author = ${v['author']}	
	</div>
	
	<div>
		RSS_Category = ${v['category']}	
	</div>
	
	<div>
		RSS_pubDate = ${v['pubDate']}
	</div>
	
	<div>
		RSS_Link = ${v['link']}
	</div>

 --%>
	<%-- 	<c:if test="${!empty v['news_content_pic']}">	 --%>
	<!-- 		<div style="border:1px solid #5599dd"> -->
	<%-- 			사진=${v['news_content_pic']}<br/>		 --%>
	<%-- 			<img src="news_img?src=${v['news_content_pic']}" /> --%>
	<!-- 		</div> -->
	<%-- 	</c:if> --%>

	<!-- 	<div> -->
	<%-- 		RSS_Thumbnail = ${v['media:thumbnail']}<br/> --%>
	<%-- 		<img src="${v['media:thumbnail']}"/> --%>
	<!-- 	</div> -->
	<%-- 
</div>
	<br/><br/><br/>
	
	 
<div id="start">
 	<div>
		RSS = ${v['title']}
	</div>
 	<div>
		LINK = ${v['link']}
	</div>
	<div>
		DESCRIPTION = ${v['description']}
	</div>
	<div>
		ENCLOSURES = ${v['enclosure']}
		<img src="${v['enclosure']}"/>
	</div>
	<div>
		Category = ${v['category'] }
	</div>
</div>
	
</c:forEach>

</P>
--%>
