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

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>news_content.jsp</title>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/agency.css" rel="stylesheet">
<!-- <style type="text/css">
		h1{text-align:center}
		th{text-align:center}
		#start{margin:0 auto;border: 1px solid #222;width:970px}
		#pic{background-image:url("${v['news_content_pic']}");width:150px;height:150px}
		a:LINK {color:black;text-decoration:none}
		a:VISITED {color:black;text-decoration:none}
		a:HOVER {color:blue;text-decoration:none}
	</style>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
</head>
<body>

	<!-- <h1>
	네이버(인벤) HTML파서 내용
</h1> -->
	<div class="portfolio-modal">
			<div class="close-modal" onclick="history.back();">
				<div class="lr">
					<div class="rl"></div>
				</div>
			</div>
	</div>

	<table class="table table-bordered table-hover width80">
		<thead>
			<tr>
				<th>${nexven_news_content['news_title']}</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${nexven_news_content['news_content']}</td>
			</tr>
		</tbody>
	</table>



	<%--
<P>

<div id="start">

	
	<div>
		${nexven_news_content['news_title']}<br/>
	</div>
	
	<c:if test="${!empty nexven_news_content['news_content_pic']}">
		<div style="border:1px solid #5599dd">
			사진=${nexven_news_content['news_content_pic']}<br/>
			<img src="news_img?src=${nexven_news_content['news_content_pic']}" />
		</div>
	</c:if>


	<div>
		${nexven_news_content['news_content']}<br/>
	</div>
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

</P>
 --%>
</body>
</html>
