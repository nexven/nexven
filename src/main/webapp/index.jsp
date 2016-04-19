<%@page
	import="org.springframework.web.servlet.mvc.condition.HeadersRequestCondition"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html data-ng-app="nexven">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>NEXVEN</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/nexven.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link
	href='https://cdn.rawgit.com/openhiun/hangul/14c0f6faa2941116bb53001d6a7dcd5e82300c3f/nanumbarungothic.css'
	rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700'
	rel='stylesheet' type='text/css'>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->

<!-- jQuery -->
<script src="js/jquery.js"></script>
	
	
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>



<!-- Custom Theme JavaScript -->
<script src="js/agency.js"></script>

<!-- Text ellipsis -->
<script src="js/index.js"></script>

<!-- angluar -->
<script
	src="//ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular.min.js"></script>
<script src="https://cdn.jsdelivr.net/angular.bootstrap/1.2.2/ui-bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/angular.bootstrap/1.2.2/ui-bootstrap-tpls.min.js"></script>

<script type="text/javascript">
<%
	String menu = request.getParameter("menu");
	if(menu != null){
%>
	$.ajax({
	    type: "get",
	    url: "<%=menu%>",
	    contentType: "application/html",
		success: function(result) {
			$("#nexven_load").html(result);
	    },
	    error: function(){
	        alert('메인페이지 불러오기 실패');
	    }
	});
<%
	}else{
%>
	$.ajax({
	    type: "get",
	    url: "index_content.jsp",
	    contentType: "application/html",
		success: function(result) {
			$("#nexven_load").html(result);
	    },
	    error: function(){
	        alert('메인페이지 불러오기 실패');
	    }
	});
<%
	}
%>


	function nload(src){
		$.ajax({
		    type: "get",
		    url: src,
		    contentType: "application/html",
			success: function(result) {
				$("#nexven_load").html(result);
		    },
		    error: function(){
		        alert('메인페이지 불러오기 실패');
		    }
		});
	}
	
	$(function(){	
		$.ajax({
		    type: "get",
		    url: "/nexven/news",
		    contentType: "application/html",
			success: function(result) {
				$("#nexven_news_content").html(result);
		    },
		    error: function(){
		        alert('뉴스 불러오기 실패');
		    }
		});	
	});


// 	var ajax2 = $http.get("/nexven/news_main");
//  	ajax2.then(function(res2) {
//  		$scope.news_main = res2.data;
//  		//alert($scope.news_main);
//  	});

	
// 	$(function(){
// 		$scope.news_main_img = function(cimage) {
// 				//alert(cimage);
// 			if(cimage){
// 				return cimage;
// 			}else{
// 				return "https://placeholdit.imgix.net/~text?txtsize=33&txt=No%20Image&w=200&h=100";
// 			}
// 		};
// 	});





var app = angular.module("nexven", ['ui.bootstrap']);

app.controller("listController", function($scope, $http) {
	
	
	$('#test2').on('click', function() {
	 	var ajax = $http.get("/nexven/list.jsp");
	 	ajax.then(function(res2) {
	 		console.dir(res2);
	 		$('.testc').html("");
	 		$('.testc2').html(res2.data);

	 	});
	});
	
	

	
});

app.controller("loginController", function($scope, $http) {
	
	
	$('#test').on('click', function() {
		 	var ajax = $http.get("/nexven/login.jsp");
		 	ajax.then(function(res) {
		 		console.dir(res);
		 		$('.testc2').html("");
		 		$('.testc').html(res.data);
		 	});
		});
	
});


</script>

</head>

<body id="page-top" class="index">

	<!-- Navigation -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand page-scroll" href="#page-top">NEXVEN<!--<div id="three-container" style="position:absolute; top:0px; left:-10px;"></div>--></a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="hidden"><a href="#page-top"></a></li>
					<li><a class="page-scroll kr" href="#news">뉴스</a></li>
					<li><a class="page-scroll kr" href="#db">게임 DB</a></li>
					<li><a class="page-scroll kr" href="#schedule">게임 일정</a></li>
					<li><a class="page-scroll kr" href="#zone">게이머존</a></li>
					<li><a class="page-scroll kr" href="#market">중고장터</a></li>
					<li><a class="page-scroll kr" href="#community">커뮤니티</a></li>
					<!-- 로그인 전 로그인 버튼 -->
					<!-- <li><a class="btn btn-primary" href="#portfolioModal1" data-toggle="modal">LOGIN</a></li> -->
					<!-- 로그인 후 아이디 -->
					<li><a class="page-scroll kr" href="#myModal"
						data-toggle="modal">admin 님</a></li>

				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	
	<div id="nexven_load">
	
	</div>

	<!-- Plugin JavaScript -->
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script src="js/classie.js"></script>
	<script src="js/cbpAnimatedHeader.js"></script>
</body>
</html>
