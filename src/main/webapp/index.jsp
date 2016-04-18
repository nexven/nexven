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

app.controller("newsController", function($scope, $http) {	
	$('#nexven_news').on('click', function() {
	 	var ajax = $http.get("/nexven/news");
	 	ajax.then(function(res) {
	 		console.dir(res);
	 		$('#nexven_news_content').html(res.data);
	 	});
	});	
	
 	var ajax2 = $http.get("/nexven/news_main");
 	ajax2.then(function(res2) {
 		$scope.news_main = res2.data;
 		//alert($scope.news_main);
 	});

	
	$(function(){
		$scope.news_main_img = function(cimage) {
				//alert(cimage);
			if(cimage){
				return cimage;
			}else{
				return "https://placeholdit.imgix.net/~text?txtsize=33&txt=No%20Image&w=200&h=100";
			}
		};
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

	<!-- Header -->
	<header>
		<div class="container">
			<div class="intro-text">
				<div class="intro-lead-in">
					Team Project <br /> Game Community
				</div>
				<div class="intro-heading">NEXVEN</div>

				<!-- 로그인 후에 버튼 숨김 -->
				<a href="#portfolioModal1" class="page-scroll btn btn-xl"
					data-toggle="modal">LOGIN</a>

			</div>
		</div>
	</header>

	<!-- news Section -->
	<section id="news" data-ng-controller="newsController">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading titlelink">
					<a id="nexven_news" data-toggle="modal" href="#nexven_news1">NEWS</a></h2>
					
						<!-- nexven news 넥벤 뉴스 -->
						<div class="portfolio-modal modal fade" id="nexven_news1"
							tabindex="-1" role="dialog" aria-hidden="true">
							<div class="modal-content">
								<div class="close-modal" data-dismiss="modal">
									<div class="lr">
										<div class="rl"></div>
									</div>
								</div>
								<div id="nexven_news_content">
									
								</div>
					
							</div>
						</div>
					
					
					<h3 class="section-subheading text-muted kr">게임 업계 뉴스</h3>
				</div>
			</div>
			<div class="row text-center">
				<div class="col-md-3 col-sm-6">						
					
					<div class="news">
						<a href="{{news_main[0].link}}">
							<img data-ng-src="{{news_main_img(news_main[0].enclosure)}}" />
						</a>						
					</div>
					<h4 class="service-heading kr text-elli titlelink">
						<a href="{{news_main[0].link}}">{{news_main[0].title}}</a>
					</h4>
					<div class="box box--responsive">
						{{news_main[0].description}}
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="news">
						<a href="{{news_main[1].link}}"><img data-ng-src="{{news_main_img(news_main[1].enclosure)}}" /></a>
					</div>
					<h4 class="service-heading kr text-elli titlelink">
						<a href="{{news_main[1].link}}">{{news_main[1].title}}</a>
					</h4>
					<div class="box box--responsive kr">
						{{news_main[1].description}}
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="news">
						<a href="{{news_main[2].link}}"><img data-ng-src="{{news_main_img(news_main[2].enclosure)}}" /></a>
					</div>
					<h4 class="service-heading kr text-elli titlelink">
						<a href="{{news_main[2].link}}">{{news_main[2].title}}</a>
					</h4>
					<div class="box box--responsive kr">
						{{news_main[2].description}}
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="news">
						<a href="{{news_main[3].link}}"><img data-ng-src="{{news_main_img(news_main[3].enclosure)}}" /></a>
					</div>
					<h4 class="service-heading kr text-elli titlelink">
						<a href="{{news_main[3].link}}">{{news_main[3].title}}</a>
					</h4>
					<div class="box box--responsive kr">
						{{news_main[3].description}}
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- game db Section -->
	<section id="db" class="bg-darkest-gray">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading text-title"><a href="">Game DB</a></h2>
					<h3 class="section-subheading text-title kr"><a href="">DB 검색</a></h3>
				</div>
			</div>
			<div class="row">
				<div class="width80">
					<div class="col-md-3 col-sm-3">
						<div class="">
							<h3 class="section-subheading text-muted kr">유저 평점 Best 3</h3>
						</div>
					</div>
					<div class="col-md-3 col-sm-3">
						<div class="thumbnail">
							<a href=""><img src="img/icon/game_l_73737.png"></a>
						</div>
					</div>
					<div class="col-md-3 col-sm-3">
						<div class="thumbnail">
							<a href=""><img src="img/icon/game_l_73739.png"></a>
						</div>
					</div>
					<div class="col-md-3 col-sm-3">
						<div class="thumbnail">
							<a href=""><img src="img/icon/game_l_73985.png"></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- game schedule Section -->
	<section id="schedule">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading kr">게임 일정</h2>
					<h3 class="section-subheading text-muted kr">클베, 오베, 발매 소식</h3>
				</div>
			</div>
			<div class="row">
				<div class="width80">
					<img src="img/schedule.jpg" width="100%">
				</div>
			</div>
		</div>
	</section>

	<!-- gamer Zone Section -->
	<section id="zone" class="bg-darkest-gray">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading text-title kr">게이머존</h2>
				</div>
			</div>
			<div class="row width80">
				<h3 class="section-bbs text-title kr"><span class="square"></span> 자유 게시판</h3>

				<div class="col-md-6">
					<div class="col-md-6" style="text-align: center;">
						<dt>
							<a
								href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&iskin=webzine&l=529966"><img
								src="http://upload2.inven.co.kr/upload/2016/04/05/bbs/thumb/n10814551045.jpg"
								alt=""></a>
						</dt>
						<dd class="text-elli kr">
							<a
								href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;iskin=webzine&amp;l=529966">기적의
								공대오빠 후기 <span class="text-title">[51]</span>
							</a>
						</dd>
					</div>
					<div class="col-md-6" style="text-align: center;">
						<dt>
							<a
								href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&iskin=webzine&l=530174"><img
								src="http://upload2.inven.co.kr/upload/2016/04/06/bbs/thumb/n12711453428.jpg"
								alt=""></a>
						</dt>
						<dd class="text-elli kr">
							<a
								href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;iskin=webzine&amp;l=530174">헐리웃
								영화속 한국인 캐릭터 ..  <span class="text-title">[25]</span>
							</a>
						</dd>
					</div>
				</div>
				<div class="col-md-6">
					<ul class="">
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a>  <span class="text-title">[6]</span>
							<img
							src="img/bbs/mark_new2.gif"
							alt="NEW" /> <img
							src="img/bbs/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a>  <span class="text-title">[6]</span>
							<img
							src="img/bbs/mark_new2.gif"
							alt="NEW" /> <img
							src="img/bbs/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a>  <span class="text-title">[6]</span>
							<img
							src="img/bbs/mark_new2.gif"
							alt="NEW" /> <img
							src="img/bbs/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a>  <span class="text-title">[6]</span>
							<img
							src="img/bbs/mark_new2.gif"
							alt="NEW" /> <img
							src="img/bbs/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a>  <span class="text-title">[6]</span>
							<img
							src="img/bbs/mark_new2.gif"
							alt="NEW" /> <img
							src="img/bbs/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a>  <span class="text-title">[6]</span>
							<img
							src="img/bbs/mark_new2.gif"
							alt="NEW" /> <img
							src="img/bbs/mark_hot1.gif"
							alt="HOT" /></li>
					</ul>
				</div>
				
				<h3 class="section-bbs text-title kr"><span class="square"></span> 유머</h3>

				<div class="col-md-6">
					<div class="col-md-6" style="text-align: center;">
						<dt>
							<a
								href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&iskin=webzine&l=529966"><img
								src="http://upload2.inven.co.kr/upload/2016/04/05/bbs/thumb/n10814551045.jpg"
								alt=""></a>
						</dt>
						<dd class="text-elli kr">
							<a
								href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;iskin=webzine&amp;l=529966">기적의
								공대오빠 후기 <span class="text-title">[51]</span>
							</a>
						</dd>
					</div>
					<div class="col-md-6" style="text-align: center;">
						<dt>
							<a
								href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&iskin=webzine&l=530174"><img
								src="http://upload2.inven.co.kr/upload/2016/04/06/bbs/thumb/n12711453428.jpg"
								alt=""></a>
						</dt>
						<dd class="text-elli kr">
							<a
								href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;iskin=webzine&amp;l=530174">헐리웃
								영화속 한국인 캐릭터 ..  <span class="text-title">[25]</span>
							</a>
						</dd>
					</div>
				</div>
				<div class="col-md-6">
					<ul class="">
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a>  <span class="text-title">[6]</span>
							<img
							src="img/bbs/mark_new2.gif"
							alt="NEW" /> <img
							src="img/bbs/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a>  <span class="text-title">[6]</span>
							<img
							src="img/bbs/mark_new2.gif"
							alt="NEW" /> <img
							src="img/bbs/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a>  <span class="text-title">[6]</span>
							<img
							src="img/bbs/mark_new2.gif"
							alt="NEW" /> <img
							src="img/bbs/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a>  <span class="text-title">[6]</span>
							<img
							src="img/bbs/mark_new2.gif"
							alt="NEW" /> <img
							src="img/bbs/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a>  <span class="text-title">[6]</span>
							<img
							src="img/bbs/mark_new2.gif"
							alt="NEW" /> <img
							src="img/bbs/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a>  <span class="text-title">[6]</span>
							<img
							src="img/bbs/mark_new2.gif"
							alt="NEW" /> <img
							src="img/bbs/mark_hot1.gif"
							alt="HOT" /></li>
					</ul>
				</div>
				<h3 class="section-bbs text-title kr"><span class="square"></span> TV/연예</h3>

				<div class="col-md-6">
					<div class="col-md-6" style="text-align: center;">
						<dt>
							<a
								href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&iskin=webzine&l=529966"><img
								src="http://upload2.inven.co.kr/upload/2016/04/05/bbs/thumb/n10814551045.jpg"
								alt=""></a>
						</dt>
						<dd class="text-elli kr">
							<a
								href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;iskin=webzine&amp;l=529966">기적의
								공대오빠 후기 <span class="text-title">[51]</span>
							</a>
						</dd>
					</div>
					<div class="col-md-6" style="text-align: center;">
						<dt>
							<a
								href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&iskin=webzine&l=530174"><img
								src="http://upload2.inven.co.kr/upload/2016/04/06/bbs/thumb/n12711453428.jpg"
								alt=""></a>
						</dt>
						<dd class="text-elli kr">
							<a
								href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;iskin=webzine&amp;l=530174">헐리웃
								영화속 한국인 캐릭터 ..  <span class="text-title">[25]</span>
							</a>
						</dd>
					</div>
				</div>
				<div class="col-md-6">
					<ul class="">
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a>  <span class="text-title">[6]</span>
							<img
							src="img/bbs/mark_new2.gif"
							alt="NEW" /> <img
							src="img/bbs/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a>  <span class="text-title">[6]</span>
							<img
							src="img/bbs/mark_new2.gif"
							alt="NEW" /> <img
							src="img/bbs/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a>  <span class="text-title">[6]</span>
							<img
							src="img/bbs/mark_new2.gif"
							alt="NEW" /> <img
							src="img/bbs/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a>  <span class="text-title">[6]</span>
							<img
							src="img/bbs/mark_new2.gif"
							alt="NEW" /> <img
							src="img/bbs/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a>  <span class="text-title">[6]</span>
							<img
							src="img/bbs/mark_new2.gif"
							alt="NEW" /> <img
							src="img/bbs/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a>  <span class="text-title">[6]</span>
							<img
							src="img/bbs/mark_new2.gif"
							alt="NEW" /> <img
							src="img/bbs/mark_hot1.gif"
							alt="HOT" /></li>
					</ul>
				</div>
				<h3 class="section-bbs text-title kr"><span class="square"></span> 스포츠</h3>

				<div class="col-md-6">
					<div class="col-md-6" style="text-align: center;">
						<dt>
							<a
								href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&iskin=webzine&l=529966"><img
								src="http://upload2.inven.co.kr/upload/2016/04/05/bbs/thumb/n10814551045.jpg"
								alt=""></a>
						</dt>
						<dd class="text-elli kr">
							<a
								href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;iskin=webzine&amp;l=529966">기적의
								공대오빠 후기 <span class="text-title">[51]</span>
							</a>
						</dd>
					</div>
					<div class="col-md-6" style="text-align: center;">
						<dt>
							<a
								href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&iskin=webzine&l=530174"><img
								src="http://upload2.inven.co.kr/upload/2016/04/06/bbs/thumb/n12711453428.jpg"
								alt=""></a>
						</dt>
						<dd class="text-elli kr">
							<a
								href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;iskin=webzine&amp;l=530174">헐리웃
								영화속 한국인 캐릭터 ..  <span class="text-title">[25]</span>
							</a>
						</dd>
					</div>
				</div>
				<div class="col-md-6">
					<ul class="">
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a>  <span class="text-title">[6]</span>
							<img
							src="img/bbs/mark_new2.gif"
							alt="NEW" /> <img
							src="img/bbs/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a>  <span class="text-title">[6]</span>
							<img
							src="img/bbs/mark_new2.gif"
							alt="NEW" /> <img
							src="img/bbs/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a>  <span class="text-title">[6]</span>
							<img
							src="img/bbs/mark_new2.gif"
							alt="NEW" /> <img
							src="img/bbs/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a>  <span class="text-title">[6]</span>
							<img
							src="img/bbs/mark_new2.gif"
							alt="NEW" /> <img
							src="img/bbs/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a>  <span class="text-title">[6]</span>
							<img
							src="img/bbs/mark_new2.gif"
							alt="NEW" /> <img
							src="img/bbs/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a>  <span class="text-title">[6]</span>
							<img
							src="img/bbs/mark_new2.gif"
							alt="NEW" /> <img
							src="img/bbs/mark_hot1.gif"
							alt="HOT" /></li>
					</ul>
				</div>
				
				<h3 class="section-bbs text-title kr"><span class="square"></span> 동영상</h3>

				<div class="col-md-6">
					<div class="col-md-6" style="text-align: center;">
						<dt>
							<a
								href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&iskin=webzine&l=529966"><img
								src="http://upload2.inven.co.kr/upload/2016/04/05/bbs/thumb/n10814551045.jpg"
								alt=""></a>
						</dt>
						<dd class="text-elli kr">
							<a
								href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;iskin=webzine&amp;l=529966">기적의
								공대오빠 후기 <span class="text-title">[51]</span>
							</a>
						</dd>
					</div>
					<div class="col-md-6" style="text-align: center;">
						<dt>
							<a
								href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&iskin=webzine&l=530174"><img
								src="http://upload2.inven.co.kr/upload/2016/04/06/bbs/thumb/n12711453428.jpg"
								alt=""></a>
						</dt>
						<dd class="text-elli kr">
							<a
								href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;iskin=webzine&amp;l=530174">헐리웃
								영화속 한국인 캐릭터 ..  <span class="text-title">[25]</span>
							</a>
						</dd>
					</div>
				</div>
				<div class="col-md-6">
					<ul class="">
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a>  <span class="text-title">[6]</span>
							<img
							src="img/bbs/mark_new2.gif"
							alt="NEW" /> <img
							src="img/bbs/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a>  <span class="text-title">[6]</span>
							<img
							src="img/bbs/mark_new2.gif"
							alt="NEW" /> <img
							src="img/bbs/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a>  <span class="text-title">[6]</span>
							<img
							src="img/bbs/mark_new2.gif"
							alt="NEW" /> <img
							src="img/bbs/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a>  <span class="text-title">[6]</span>
							<img
							src="img/bbs/mark_new2.gif"
							alt="NEW" /> <img
							src="img/bbs/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a>  <span class="text-title">[6]</span>
							<img
							src="img/bbs/mark_new2.gif"
							alt="NEW" /> <img
							src="img/bbs/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a>  <span class="text-title">[6]</span>
							<img
							src="img/bbs/mark_new2.gif"
							alt="NEW" /> <img
							src="img/bbs/mark_hot1.gif"
							alt="HOT" /></li>
					</ul>
				</div>
			</div>
		</div>
	</section>

	<!-- market Section -->
	<section id="market">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading kr">중고장터</h2>
					<h3 class="section-subheading text-muted kr">자유 거래</h3>
				</div>
			</div>
			<div class="row"></div>
		</div>
	</section>
	
	<!-- community Section -->
	<section id="community" class="bg-darkest-gray">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading text-title kr">커뮤니티</h2>
				</div>
			</div>
			<div class="row"></div>
		</div>
	</section>

	<footer style="background-color: black;">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<span class="copyright kr">Copyright &copy; 오합지졸 2016</span>
				</div>
				<div class="col-md-6">
					<!--
					<ul class="list-inline social-buttons">
											<li>
												<a href="#"><i class="fa fa-twitter"></i></a>
											</li>
											<li>
												<a href="#"><i class="fa fa-facebook"></i></a>
											</li>
											<li>
												<a href="#"><i class="fa fa-linkedin"></i></a>
											</li>
										</ul>-->

				</div>
				<div class="col-md-3">
					<ul class="list-inline">
						<li><a href="#">공지사항</a></li>
						<li><a href="mailto:name@email.com">관리자 문의</a></li>

					</ul>
				</div>
			</div>
		</div>
	</footer>


	<!-- login Modal 1 로그인 화면-->
	<div class="portfolio-modal modal fade" id="portfolioModal1"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-content">
			<div class="close-modal" data-dismiss="modal">
				<div class="lr">
					<div class="rl"></div>
				</div>
			</div>
			<div class="container" data-ng-controller="loginController">
				<button id="test">로그인 비동기</button>				
				<div class="testc">				 
				</div>

			</div>
			<div data-ng-controller="listController">
			<button id="test2">Emp리스트 비동기</button>
				<div class="testc2">
				</div>
			</div>
		</div>
	</div>

	<!-- login Modal 2 회원 가입 -->
	<div class="portfolio-modal modal fade" id="portfolioModal2"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-content">
			<div class="close-modal" data-dismiss="modal">
				<div class="lr">
					<div class="rl"></div>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-lg-offset-2">
						<div class="modal-body">
							<!-- Project Details Go Here -->
							<h2 class="kr">회원 가입</h2>
							<p>
								<label class="signin_label">ID</label><input type="text"
									class="signin_input" />
							</p>
							<p>
								<label class="signin_label">PW</label><input type="password"
									class="signin_input" />
							</p>
							<p>
								<label class="signin_label">PW 확인</label><input type="password"
									class="signin_input" />
							</p>
							<p>
								<label class="signin_label">이름</label><input type="text"
									class="signin_input" />
							</p>
							<p>
								<label class="signin_label">닉네임</label><input type="text"
									class="signin_input" />
							</p>
							<p>
								<label class="signin_label">생년월일</label><input type="date"
									class="signin_input" />
							</p>
							<p>
								<label class="signin_label">우편 번호</label><input type="text"
									class="signin_post" readonly />
								<button class="signin_post btn btn-primary">확인</button>
							</p>
							<p>
								<label class="signin_label">주소</label><input type="text"
									class="signin_input" />
							</p>
							<p>
								<label class="signin_label">상세 주소</label><input type="text"
									class="signin_input" />
							</p>
							<button type="button" class="btn btn-primary" data-dismiss="modal">가입</button>
							<button type="button" class="btn btn-primary">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- login Modal 3 회원 수정 -->
	<div class="portfolio-modal modal fade" id="portfolioModal3"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-content">
			<div class="close-modal" data-dismiss="modal">
				<div class="lr">
					<div class="rl"></div>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-lg-offset-2">
						<div class="modal-body">
							<h2 class="kr">회원 정보 수정</h2>
							<p>
								<label class="signin_label">ID</label><input type="text"
									class="signin_input" />
							</p>
							<p>
								<label class="signin_label">PW</label><input type="password"
									class="signin_input" />
							</p>
							<p>
								<label class="signin_label">PW 확인</label><input type="password"
									class="signin_input" />
							</p>
							<p>
								<label class="signin_label">이름</label><input type="text"
									class="signin_input" />
							</p>
							<p>
								<label class="signin_label">닉네임</label><input type="text"
									class="signin_input" />
							</p>
							<p>
								<label class="signin_label">생년월일</label><input type="date"
									class="signin_input" />
							</p>
							<p>
								<label class="signin_label">우편 번호</label><input type="text"
									class="signin_post" readonly />
								<button class="signin_post btn btn-primary">확인</button>
							</p>
							<p>
								<label class="signin_label">주소</label><input type="text"
									class="signin_input" />
							</p>
							<p>
								<label class="signin_label">상세 주소</label><input type="text"
									class="signin_input" />
							</p>
							<button type="button" class="btn btn-primary" data-dismiss="modal">수정</button>
							<button type="button" class="btn btn-primary">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Modal -->
	<div class="modal2 fade" id="myModal" role="dialog" aria-hidden="true">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">

				<div class="modal-body">
					<h2>회원 정보</h2>
					<p>admin 님</p>
					<p>최종 로그인 시간 :</p>
					<button type="button" class="btn btn-primary kr" data-target="#portfolioModal3" data-toggle="modal">정보 수정</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">LOGOUT</button>
				</div>

			</div>
		</div>
	</div>
	
	<!-- Plugin JavaScript -->
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src="js/classie.js"></script>
<script src="js/cbpAnimatedHeader.js"></script>

</body>

</html>
