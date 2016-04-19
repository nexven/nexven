<%@page import="javax.imageio.ImageReader"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLConnection"%>
<%@page
	import="org.springframework.web.servlet.mvc.condition.HeadersRequestCondition"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<%
	response.setHeader("Referer", "http://www.inven.co.kr/webzine/news/");
%>

<!-- <!DOCTYPE html>
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
<body> -->

	<!-- <h1>
	네이버(인벤) RSS파서 내용
</h1> -->
	<h2 class="section-heading">NEWS</h2>

	<div class="width90">
		<div class="row hiddentitle">
			<div class="col-md-3">Image</div>
			<div class="col-md-5">Title</div>
			<div class="col-md-2">Category</div>
			<div class="col-md-2">pubDate</div>
		</div>
		<div class="row bg-darkest-gray"
			style="height: 2px; margin: 5px 0px 5px 0px;"></div>

		<c:forEach var="v" items="${nexven_news}">
			<div class="row">
				<div class="col-md-3">
					<c:if test="${!empty v['enclosure']}">
						<img src="${v['enclosure']}" width="100%" height="100%" style="max-width:200px;" />
					</c:if>
					<c:if test="${empty v['enclosure']}">
					<img src="https://placeholdit.imgix.net/~text?txtsize=33&txt=No%20Image&w=150&h=90"/>
					</c:if>

				</div>
				<div class="col-md-5 titlelink" style="text-align:left !important;">
					<a href="javascript:nload('${v['link']}');">${v['title']}</a>
				</div>
				<div class="col-md-2">${v['category']}</div>
				<div class="col-md-2">${v['pubDate']}</div>
			</div>
			<div class="row bg-darkest-gray"
				style="height: 1px; margin: 5px 0px 5px 0px;"></div>
		</c:forEach>


	</div>





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

<!-- </body>
</html> -->
