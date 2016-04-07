<%@page import="org.springframework.web.servlet.mvc.condition.HeadersRequestCondition"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	response.setHeader("Host", "static.inven.co.kr");
	response.setHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:44.0) Gecko/20100101 Firefox/44.0");
	response.setHeader("Accept", "image/png");
	response.setHeader("referrer", "static.inven.co.kr");
	response.setHeader("Encoding", "gzip, deflate");
	response.setHeader("Connection", "keep-alive");
	response.setHeader("Cookie", "_ga=GA1.3.2132668928.1459402148; _BS_GUUID=9RKrmIvsLy5K6GnaJyERzmmWlgsizAGwKMcPelpd; _TRK_AUIDA_=10daa8bd29a7e8470740eab32c2daf9d:3; topskyCnt=1; invenrchk=%7B%22news%7C154328%22%3A%7B%22d%22%3A%222016-04-06+10%3A03%3A09%22%2C%22s%22%3A%22esports%22%7D%7D");
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"/>
	<title>Home</title>
	
	<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
	<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	
	<script type="text/javascript">
/* 		$(function() {
			var j_pic="${v['news_content_pic']}";
			var j_pic2="http://imgnews.naver.net/image/thumb140/442/2016/04/05/33899.jpg";
			$("#pic").attr("src",j_pic);
		}); */
	</script>
	
	<style type="text/css">
		h1{text-align:center}
		#start{margin:0 auto;border: 1px solid #222;width:970px}
		#pic{background-image:url("${v['news_content_pic']}");width:150px;height:150px}
	</style>
</head>
<body>
<h1>
	인벤 RSS 파서
</h1>

<P>
<c:forEach var="v" items="${inven}">

<div id="start">
	<div>
		RSS_Title = ${v['title']}
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
	
	<div>
		RSS_Thumbnail = ${v['media:thumbnail']}<br/>
		<img src="${v['media:thumbnail']}"/>
	</div>
	
	==========================================<br/>
	
	<div>
		${v['news_title']}<br/>
	</div>
	
	<div style="border:1px solid #5599dd">
		사진=${v['news_content_pic']}<br/>
		<%-- <img id="pic" src="${v['news_content_pic']}" width="150" height="150" /> --%>
	</div>
	
	<div>
		${v['news_content']}<br/>
	</div>
</div>
	<br/><br/><br/>
	
<%-- 	 
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

 --%>	
	
</c:forEach>

</P>
</body>
</html>
