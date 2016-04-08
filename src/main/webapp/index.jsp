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

<title>NexVen</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/agency.css" rel="stylesheet">
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

<!-- Plugin JavaScript -->
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src="js/classie.js"></script>
<script src="js/cbpAnimatedHeader.js"></script>

<!-- Contact Form JavaScript -->
<script src="js/jqBootstrapValidation.js"></script>
<script src="js/contact_me.js"></script>

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
					<li><a class="page-scroll kr">커뮤니티</a></li>
					<!-- 로그인 후 아이디 -->
					<!-- <li><a class="btn btn-primary" href="#portfolioModal1" data-toggle="modal">LOGIN</a></li> -->
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
				<div class="intro-heading">neXVen</div>

				<!-- 로그인 후에 버튼 숨김 -->
				<a href="#portfolioModal1" class="page-scroll btn btn-xl"
					data-toggle="modal">LOGIN</a>

			</div>
		</div>
	</header>

	<!-- news Section -->
	<section id="news">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading">NEWS</h2>
					<h3 class="section-subheading text-muted kr">게임 업계 뉴스</h3>
				</div>
			</div>
			<div class="row text-center">
				<div class="col-md-3 col-sm-6">
					<div class="news">
						<img src="img/news/i13656815628.jpg">
					</div>
					<h4 class="service-heading kr text-elli">[뉴스] '앵그리버드 더 무비',
						더빙에 방송인 신동엽 참여…5월 19일 개봉 예정</h4>
					<div class="box box--responsive">This is a responsive box
						that will update it's ellipsis when the screen resizes. The quick
						brown fox jumped over the lazy dogs. The quick brown fox jumped
						over the lazy dogs. This is a responsive box that will update it's
						ellipsis when the screen resizes. The quick brown fox jumped over
						the lazy dogs. The quick brown fox jumped over the lazy dogs. This
						is a responsive box that will update it's ellipsis when the screen
						resizes. The quick brown fox jumped over the lazy dogs. The quick
						brown fox jumped over the lazy dogs. This is a responsive box that
						will update it's ellipsis when the screen resizes. The quick brown
						fox jumped over the lazy dogs. The quick brown fox jumped over the
						lazy dogs.</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="news">
						<img src="img/news/i12861502093.jpg">
					</div>
					<h4 class="service-heading kr text-elli">[뉴스] 금빛 개틀링으로 땅땅땅빵!
						‘백발백중’, 전설 총기 업데이트 실시</h4>
					<div class="box box--responsive kr">넷마블게임즈(이하 넷마블, 대표 권영식)는
						모바일 슈팅게임 '백발백중 for Kakao(이하 백발백중)'에서 전설 총기를 최초로 추가하고, 걸그룹 러블리즈 멤버
						'유지애' 캐릭터를 출시한다고 4일 밝혔다. 현재 '백발백중' 총기 등급은 '일반', '고급', '희귀' 순으로 이번
						업데이트를 통해 가장 높은 등급 '전설'이 추가된다. 최초로 선보이는 전설 총기는 '개틀링-이글'과 'M4A1-울프'로
						강한 공격력과 함께 일정 확률로 피해량이 증가하는 스킬을 보유하고 있어, 전투에서 효과적으로 사용할 수 있다. 또,
						‘백발백중’은 걸그룹 러블리즈에서 비주얼을 담당하고 있는 유지애의 캐릭터를 출시했다. 이는 서지수, 케이 이후 세
						번째로 추가하는 캐릭터로, 멤버의 얼굴을 높은 완성도로 구현한 것은 물론, 유지애가 직접 녹음한 음성을 지원한다.

						넷마블은 이번 업데이트와 함께 오는 5일까지 15레벨 달성한 이용자에게 러블리즈 서지수 캐릭터를 증정한다. 별도로
						카카오 프로모션에 참여하는 모든 이용자에게 300개의 다이아를 증정하며 휴면 이용자가 게임을 시작하면, 6만원 상당의
						아이템을 제공한다. 이외에도 4월 한 달 동안 대전모드, 무한모드를 즐기면 추가 보상을 주는 핫타임 이벤트가 진행된다.

						넷마블게임즈 이정호 본부장은 “이번 업데이트는 ‘백발백중’ 총기의 기준을 상향하는 것으로, 총기 성장에 또 다른 재미를
						선사하길 기대한다”며 “기존 이용자뿐만 아니라, 신규, 휴면 이용자에게 풍성한 혜택을 제공하는 이벤트를 진행하니 많은
						참여를 부탁한다”고 말했다. 모바일 슈팅게임 ‘백발백중’은 PC온라인 FPS 게임 수준의 타격감과 박진감을 높은
						완성도로 구현했으며, 쉬운 조작 시스템으로 남녀노소가 부담 없이 슈팅게임을 즐길 수 있다. 게임에 대한 자세한 정보는
						공식카페 및 공식 페이스북에서 확인할 수 있다.</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="news">
						<img src="img/news/i12784338895.jpg">
					</div>
					<h4 class="service-heading kr text-elli">[뉴스] 20번째 캐릭터의 정체는?
						테일즈런너, 신규 캐릭터 공개 이벤트 실시</h4>
					<div class="box box--responsive kr">스마일게이트 메가포트(대표 이동훈)의 인기
						온라인 액션 레이싱 게임 '테일즈런너'(개발사 라온엔터테인먼트)가 ‘신규 캐릭터 공개’ 이벤트를 시작했다. 이번
						이벤트는 이용자들이 힘을 모아 올 여름 업데이트될 20번째 캐릭터에 대한 정보를 알아낼 수 있는 색다른 즐길 거리로,
						이달 20일(수)까지 진행된다. 이벤트에 참여하고 싶은 이용자들은 '테일즈런너' 플레이 후 공식 홈페이지 내 이벤트
						페이지에서 ‘응원하기’를 클릭하면 된다. ‘응원하기’는 이용자 당 하루에 한 번씩만 참여할 수 있다. 스마일게이트
						메가포트는 이용자들의 ‘응원하기’ 누적 횟수가 10만, 20만, 50만 등 목표치에 도달할 때 마다, 신규 캐릭터의
						이름, 출신, 특징 등의 정보를 순차적으로 공개한다. 특히, 100만 회를 달성할 경우, 캐릭터의 원화도 제공할
						예정이다. ‘신규 캐릭터 공개’ 이벤트 및 게임 정보에 대한 세부 내용은 공식 홈페이지에서 확인할 수 있다.</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="news">
						<img src="img/news/i12784338895.jpg">
					</div>
					<h4 class="service-heading kr text-elli">[뉴스] 20번째 캐릭터의 정체는?
						테일즈런너, 신규 캐릭터 공개 이벤트 실시</h4>
					<div class="box box--responsive kr">스마일게이트 메가포트(대표 이동훈)의 인기
						온라인 액션 레이싱 게임 '테일즈런너'(개발사 라온엔터테인먼트)가 ‘신규 캐릭터 공개’ 이벤트를 시작했다. 이번
						이벤트는 이용자들이 힘을 모아 올 여름 업데이트될 20번째 캐릭터에 대한 정보를 알아낼 수 있는 색다른 즐길 거리로,
						이달 20일(수)까지 진행된다. 이벤트에 참여하고 싶은 이용자들은 '테일즈런너' 플레이 후 공식 홈페이지 내 이벤트
						페이지에서 ‘응원하기’를 클릭하면 된다. ‘응원하기’는 이용자 당 하루에 한 번씩만 참여할 수 있다. 스마일게이트
						메가포트는 이용자들의 ‘응원하기’ 누적 횟수가 10만, 20만, 50만 등 목표치에 도달할 때 마다, 신규 캐릭터의
						이름, 출신, 특징 등의 정보를 순차적으로 공개한다. 특히, 100만 회를 달성할 경우, 캐릭터의 원화도 제공할
						예정이다. ‘신규 캐릭터 공개’ 이벤트 및 게임 정보에 대한 세부 내용은 공식 홈페이지에서 확인할 수 있다.</div>
				</div>
			</div>
		</div>
	</section>

	<!-- game db Section -->
	<section id="db" class="bg-light-gray">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading">Game DB</h2>
					<h3 class="section-subheading text-muted kr">각종 게임 DB</h3>
				</div>
			</div>
			<div class="row">
				<div style="width: 80%; margin: auto;">
					<div class="col-md-3 col-sm-3">
						<div class="">
							<h3 class="section-subheading text-muted kr">유저 평점 Best 3</h3>
						</div>
					</div>
					<div class="col-md-3 col-sm-3">
						<div class="thumbnail">
							<img src="img/icon/game_l_73737.png">
						</div>
					</div>
					<div class="col-md-3 col-sm-3">
						<div class="thumbnail">
							<img src="img/icon/game_l_73739.png">
						</div>
					</div>
					<div class="col-md-3 col-sm-3">
						<div class="thumbnail">
							<img src="img/icon/game_l_73985.png">
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
				<div style="width: 80%; margin: auto;">
					<img src="img/schedule.jpg" width="100%">
				</div>
			</div>
		</div>
	</section>

	<!-- gamer Zone Section -->
	<section id="zone" class="bg-light-gray">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading kr">게이머존</h2>
				</div>
			</div>
			<div class="row" style="width: 80%; margin: auto;">
				<h3 class="section-subheading text-muted kr">자유 게시판</h3>

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
								공대오빠 후기 <span>[51]</span>
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
								영화속 한국인 캐릭터 .. <span>[25]</span>
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
							target="">어느 BJ의 절규절규절규절규절규절규절규절규절규절규절규절규</a> <span class="">[6]</span>
							<img
							src="http://static.inven.co.kr/image/common/fonticon/mark_new2.gif"
							alt="NEW" /> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a> <span class="">[6]</span> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_new2.gif"
							alt="NEW" /> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a> <span class="">[6]</span> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_new2.gif"
							alt="NEW" /> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a> <span class="">[6]</span> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_new2.gif"
							alt="NEW" /> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a> <span class="">[6]</span> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_new2.gif"
							alt="NEW" /> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a> <span class="">[6]</span> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_new2.gif"
							alt="NEW" /> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_hot1.gif"
							alt="HOT" /></li>
					</ul>
				</div>
				<h3 class="section-subheading text-muted kr">유머</h3>

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
								공대오빠 후기 <span>[51]</span>
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
								영화속 한국인 캐릭터 .. <span>[25]</span>
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
							target="">어느 BJ의 절규절규절규절규절규절규절규절규절규절규절규절규</a> <span class="">[6]</span>
							<img
							src="http://static.inven.co.kr/image/common/fonticon/mark_new2.gif"
							alt="NEW" /> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a> <span class="">[6]</span> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_new2.gif"
							alt="NEW" /> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a> <span class="">[6]</span> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_new2.gif"
							alt="NEW" /> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a> <span class="">[6]</span> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_new2.gif"
							alt="NEW" /> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a> <span class="">[6]</span> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_new2.gif"
							alt="NEW" /> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a> <span class="">[6]</span> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_new2.gif"
							alt="NEW" /> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_hot1.gif"
							alt="HOT" /></li>
					</ul>
				</div>
				<h3 class="section-subheading text-muted kr">TV/연예</h3>

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
								공대오빠 후기 <span>[51]</span>
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
								영화속 한국인 캐릭터 .. <span>[25]</span>
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
							target="">어느 BJ의 절규절규절규절규절규절규절규절규절규절규절규절규</a> <span class="">[6]</span>
							<img
							src="http://static.inven.co.kr/image/common/fonticon/mark_new2.gif"
							alt="NEW" /> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a> <span class="">[6]</span> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_new2.gif"
							alt="NEW" /> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a> <span class="">[6]</span> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_new2.gif"
							alt="NEW" /> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a> <span class="">[6]</span> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_new2.gif"
							alt="NEW" /> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a> <span class="">[6]</span> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_new2.gif"
							alt="NEW" /> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a> <span class="">[6]</span> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_new2.gif"
							alt="NEW" /> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_hot1.gif"
							alt="HOT" /></li>
					</ul>
				</div>
				<h3 class="section-subheading text-muted kr">스포츠</h3>

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
								공대오빠 후기 <span>[51]</span>
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
								영화속 한국인 캐릭터 .. <span>[25]</span>
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
							target="">어느 BJ의 절규절규절규절규절규절규절규절규절규절규절규절규</a> <span class="">[6]</span>
							<img
							src="http://static.inven.co.kr/image/common/fonticon/mark_new2.gif"
							alt="NEW" /> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a> <span class="">[6]</span> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_new2.gif"
							alt="NEW" /> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a> <span class="">[6]</span> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_new2.gif"
							alt="NEW" /> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a> <span class="">[6]</span> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_new2.gif"
							alt="NEW" /> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a> <span class="">[6]</span> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_new2.gif"
							alt="NEW" /> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a> <span class="">[6]</span> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_new2.gif"
							alt="NEW" /> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_hot1.gif"
							alt="HOT" /></li>
					</ul>
				</div>
				<h3 class="section-subheading text-muted kr">동영상</h3>

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
								공대오빠 후기 <span>[51]</span>
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
								영화속 한국인 캐릭터 .. <span>[25]</span>
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
							target="">어느 BJ의 절규절규절규절규절규절규절규절규절규절규절규절규</a> <span class="">[6]</span>
							<img
							src="http://static.inven.co.kr/image/common/fonticon/mark_new2.gif"
							alt="NEW" /> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a> <span class="">[6]</span> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_new2.gif"
							alt="NEW" /> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a> <span class="">[6]</span> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_new2.gif"
							alt="NEW" /> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a> <span class="">[6]</span> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_new2.gif"
							alt="NEW" /> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a> <span class="">[6]</span> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_new2.gif"
							alt="NEW" /> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_hot1.gif"
							alt="HOT" /></li>
						<li class="text-elli kr"><img
							src="http://static.inven.co.kr/image_2011/common/module/openissue/board2097_1_1.png"
							class="" alt="" /> <a
							href="http://www.inven.co.kr/board/powerbbs.php?come_idx=2097&amp;l=530250&amp;iskin=webzine"
							target="">어느 BJ의 절규</a> <span class="">[6]</span> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_new2.gif"
							alt="NEW" /> <img
							src="http://static.inven.co.kr/image/common/fonticon/mark_hot1.gif"
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
						<li><a style="text-decoration: none;">공지사항</a></li>
						<li><a style="text-decoration: none;">관리자 문의</a></li>

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

</body>

</html>
