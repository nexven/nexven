<%@page
	import="org.springframework.web.servlet.mvc.condition.HeadersRequestCondition"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="description" content="게임,뉴스,게임뉴스,커뮤니티">
<meta name="author" content="nexven">
<title>NEXVEN</title>

<link href="css/nloading.css" rel="stylesheet" />

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel="stylesheet" />

<!-- Custom CSS -->
<link href="css/nexven.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"	type="text/css" />
<link href='https://cdn.jsdelivr.net/font-nanum/1.0/nanumbarungothic/nanumbarungothic.css' rel='stylesheet' type='text/css' />
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"	rel="stylesheet" type="text/css" />
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script'	rel='stylesheet' type='text/css' />
<link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css' />
<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css' />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->

<!-- jQuery -->
<script src="js/jquery.js"></script>
<script src="js/jquery.twbsPagination.min.js"></script>

<!-- Daum API -->	
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

<!-- Date Format JavaScript -->
<script src="js/date.format.js"></script>

<!-- Custom Theme JavaScript -->
<script src="js/agency.js"></script>

<!-- Text ellipsis -->
<script src="js/index.js"></script>


<script type="text/javascript">

	// 메인로더 (Modal)
	var naction = false;
	function nload(src,title,size){
		$.ajax({
		    type: "GET",
		    async : true,
		    cache : false,
		    encoding: "UTF-8",
		    url: src,
			success: function(result) {
				
 				if(naction===false){
					naction=true;

					if($("#nexven_view").attr("class")==="modal fade"){
						if(size=="small"){
							$("#nexven_view_class").attr("class","modal-dialog modal-nexven-sm");
						}else if(size=="mid"){
							$("#nexven_view_class").attr("class","modal-dialog modal-nexven-md");
						}else{
							$("#nexven_view_class").attr("class","modal-dialog modal-nexven-bg");
						}						
						$('#nexven_view').modal('show');
					}else{
						//$("#nexven_view_content").html();
						//$("#nexven_view_title").html();
					}
					
					$("#nexven_view_content").html(result);
					$("#nexven_view_title").html(title);
					
					naction=false;
				}

		    },
		    error: function(){
		        alert('로더 불러오기 실패');
		    }
		});
	}
	
	// 뉴스
	$.ajax({
		type: "get",
	    async : true,
	    cache : false,
	    encoding: "UTF-8",
	    url: "/nexven/news_main",
		success: function(news_main) {
	        var news_main_json = JSON.parse(JSON.stringify(news_main));
	        $.each(news_main_json, function(i) {
	        	//alert(news_main_json[i].title);

				if(news_main_json[i].enclosure==null||news_main_json[i].enclosure==""){					
					news_main_json[i].enclosure="https://placeholdit.imgix.net/~text?txtsize=70&txtclr=000000&txt=NO%20IMAGE&txttrack=4&w=640&h=480&bg=eeeeee";
				}		        	
	        	$("#news_main"+i+"_img").html("<a href='javascript:nload(\""+news_main_json[i].link+"\",\"뉴스 내용\",\"\");'>"+"<img src='"+news_main_json[i].enclosure+"' /></a>");
	        	$("#news_main"+i+"_title").html("<a href='javascript:nload(\""+news_main_json[i].link+"\",\"뉴스 내용\",\"\");'>"+news_main_json[i].title+"</a>");
	        	$("#news_main"+i+"_desc").html(news_main_json[i].description);
	        });
			
	    },
	    error: function(){
	        alert('메인뉴스 불러오기 실패');
	    }
	});

	// 로그아웃
	function logout() {
		$.ajax({
				type : "get",
			    async : true,
			    cache : false,
			    encoding: "UTF-8",
				url : "logout.jsp",
				success: function() {
					//alert("로그아웃 완료");
					location.href = "./";
				},
			    error: function(){
			    	alert("로그아웃 오류");
			    	location.href = "./";
			    }

		});		  
	}
	
	// Ready
 	$(function(){
 		setTimeout(function() {
 	     	$("#nloading").fadeOut(); 			
 		}, 5000);
    });

</script>

<!-- 초기 로딩 index 페이지 modal -->
<c:if test="${!empty param.src }">
	<script>
		nload("${param.src}","${param.title}","${param.size}");
	</script>
</c:if>

<base target="_self" />

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
					<!-- <li><a class="page-scroll kr" href="#schedule">게임 일정</a></li> -->
					<li><a class="page-scroll kr" href="#zone">게이머존</a></li>					
					<li><a class="page-scroll kr" href="#community">커뮤니티</a></li>
					<li><a class="page-scroll kr" href="#market">중고장터</a></li>
					<!-- 로그인 전 로그인 버튼 -->
					<!-- <li><a class="btn btn-primary" href="#portfolioModal1" data-toggle="modal">LOGIN</a></li> -->
					<!-- 로그인 후 아이디 -->
					<c:set var="mNick" value="${mNick}" />
						<c:if test="${empty mNick}"></c:if>
						<c:if test="${!empty mNick}">					
							<li>
								<a class="kr" id="nexven_nick" href='javascript:nload("login_info.jsp","회원정보","small");'>
								${sessionScope.mNick }님
								</a>
							</li>
						</c:if>
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

				<!-- 로그인 후에 로그아웃 버튼 활성화 -->
				<c:if test="${empty mNick}">
					<a href='javascript:nload("login.jsp","로그인","small");' class='btn-xl'>LOGIN</a>
				</c:if>
				<c:if test="${!empty mNick}">
					<a href='javascript:logout();' class='btn-xl'>LOGOUT</a>
				</c:if>
			</div>
		</div>
	</header>
	

	<!-- Modal -->
	  <div class="modal fade" id="nexven_view" role="dialog">
	    <div id="nexven_view_class" class="modal-dialog modal-nexven-bg">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal" style="font-size:2.4em">&times;</button>
	          <h3 id="nexven_view_title" class="modal-title text-center kr">Nexven View</h3>
	        </div>
	        	<div class="nexven_view_wrap">
		        	<div id="nexven_view_content" class="modal-body">
	
		        	</div>
	        	</div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
	
	
	
	<!-- news Section -->
	<section id="news">
		<div class="container">
			<div class="row text-center">
				<div class="col-lg-12">
					<h2 class="section-heading titlelink">
					<a id="nexven_news" href='javascript:nload("news","게임뉴스","");'>NEWS</a></h2>
				
					<h3 class="section-subheading text-muted kr">게임 업계 뉴스</h3>
				</div>
			</div>
			<div class="row text-center">
				<div class="col-md-3 col-sm-6">						
					
					<div id="news_main0_img" class="news">
						&nbsp;				
					</div>
					<h4 id="news_main0_title" class="service-heading kr text-elli titlelink">
						&nbsp;
					</h4>
					<div id="news_main0_desc" class="box box--responsive kr">
						&nbsp;
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div id="news_main1_img" class="news">
						&nbsp;
					</div>
					<h4 id="news_main1_title" class="service-heading kr text-elli titlelink">
						&nbsp;
					</h4>
					<div id="news_main1_desc" class="box box--responsive kr">
						&nbsp;
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div id="news_main2_img" class="news">
						&nbsp;
					</div>
					<h4 id="news_main2_title" class="service-heading kr text-elli titlelink">
						&nbsp;
					</h4>
					<div id="news_main2_desc" class="box box--responsive kr">
						&nbsp;
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div id="news_main3_img" class="news">
						&nbsp;
					</div>
					<h4 id="news_main3_title" class="service-heading kr text-elli titlelink">
						&nbsp;
					</h4>
					<div id="news_main3_desc" class="box box--responsive kr">
						&nbsp;
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- game db Section -->
	<section id="db" class="bg-darkest-gray">
		<div class="container">

<!-- 			<div class="row text-center"> -->
<!-- 				<div class="col-lg-12"> -->
<!-- 					<h2 class="section-heading text-title"><a href="#gamedb" data-toggle="modal">Game DB</a></h2> -->
<!-- 				</div> -->
<!-- 			</div> -->
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading text-title"><a id="nexven_gamedb" href='javascript:nload("/nexven/gamedb/list.jsp","게임DB","");'>Game DB</a></h2>

					<h3 class="section-subheading text-title kr">DB 검색</h3>
				</div>
			</div>
			<div class="row">
				<div class="width80">
					<div class="col-md-3 col-sm-12 col-xs-12">
						
							<img src="img/best.png" style="width:100%; margin:15px 0px 15px 0px;">
					</div>
					<div class="col-md-3 col-sm-4 col-xs-12">
						<div class="thumbnail">
							<a href=""><img src="img/icon/game_l_73737.png"></a>
						</div>
					</div>
					<div class="col-md-3 col-sm-4 col-xs-12">
						<div class="thumbnail">
							<a href=""><img src="img/icon/game_l_73739.png"></a>
						</div>
					</div>
					<div class="col-md-3 col-sm-4 col-xs-12">
						<div class="thumbnail">
							<a href=""><img src="img/icon/game_l_73985.png"></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- game schedule Section -->
	<!-- <section id="schedule">
		<div class="container">
			<div class="row text-center">
				<div class="col-lg-12">
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
	</section> -->

	<!-- gamer Zone Section -->
	<section id="zone">
		<div class="container">
			<div class="row text-center">
				<div class="col-lg-12">
					<h2 class="section-heading titlelink"><a>gamer zone</a></h2>
					<h3 class="section-subheading titlelink kr">자유 게시판</h3>
				</div>
			</div>
			<div class="row">
				
			</div>
		</div>
	</section>
	
	<!-- community Section -->
	<section id="community" class="bg-darkest-gray">
		<div class="container">
			<div class="row text-center">
				<div class="col-lg-12">
					<h2 class="section-heading text-title kr"><a href='javascript:nload("board/list.jsp?bName=WOW","WOW 커뮤니티","");'>커뮤니티</a></h2> 
					<h3 class="section-subheading text-title kr">소모임</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6 col-xs-12 text-center"><a href='javascript:nload("board/list.jsp?bName=WOW","WOW 커뮤니티","");'><img src="img/community/wow.jpg" style="width:auto; max-width:100%; margin-bottom:15px;"></a></div>  
 				<div class="col-sm-6 col-xs-12 text-center"><a href='javascript:nload("board/list.jsp?bName=LOL","LOL 커뮤니티","");'><img src="img/community/lol.jpg" style="width:auto; max-width:100%; margin-bottom:15px;"></a></div>   
  
			</div>
		</div>
	</section>

	<!-- market Section -->
	<section id="market">
		<div class="container">
			<div class="row text-center">
				<div class="col-lg-12">
					<h2 class="section-heading kr">중고장터</h2>
					<h3 class="section-subheading text-muted kr">자유 거래</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3 col-sm-3 col-xs-6 text-center"><a href="#mar_game" data-toggle="modal"><img src="img/market/game.png" alt="game" style="width:auto; max-width:100%; margin-bottom:15px;"></a></div>
				<div class="col-md-3 col-sm-3 col-xs-6 text-center"><a href="#mar_elec" data-toggle="modal"><img src="img/market/elec.png" alt="elec" style="width:auto; max-width:100%; margin-bottom:15px;"></a></div> 
				<div class="col-md-3 col-sm-3 col-xs-6 text-center"><a href="#mar_hobby" data-toggle="modal"><img src="img/market/hobby.png" alt="hobby" style="width:auto; max-width:100%; margin-bottom:15px;"></a></div> 
				<div class="col-md-3 col-sm-3 col-xs-6 text-center"><a href="#mar_etc" data-toggle="modal"><img src="img/market/etc.png" alt="etc" style="width:auto; max-width:100%; margin-bottom:15px;"></a></div>  
			</div>
		</div>
	</section>

	<footer style="background-color: black;">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<span class="copyright kr">Copyright &copy; NEXVEN Team 2016</span>
				</div>
				<div class="col-md-6">
					
				</div>
				<div class="col-md-3">
					<ul class="list-inline">
						<li><a href="#notice" data-toggle="modal">공지사항</a></li>
						<li><a href="mailto:name@email.com">관리자 문의</a></li>

					</ul>
				</div>
			</div>
		</div>
	</footer>


	
	<!-- market game modal -->
	<div class="portfolio-modal modal fade" id="mar_game"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-content">
			<div class="close-modal" data-dismiss="modal">
				<div class="lr">
					<div class="rl"></div>
				</div>
			</div>
			<div class="container">
				게임장터

			</div>
		</div>
	</div>
	
	<!-- market elec modal -->
	<div class="portfolio-modal modal fade" id="mar_elec"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-content">
			<div class="close-modal" data-dismiss="modal">
				<div class="lr">
					<div class="rl"></div>
				</div>
			</div>
			<div class="container">
				전자제품장터

			</div>
		</div>
	</div>
	
	<!-- market hobby modal -->
	<div class="portfolio-modal modal fade" id="mar_hobby"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-content">
			<div class="close-modal" data-dismiss="modal">
				<div class="lr">
					<div class="rl"></div>
				</div>
			</div>
			<div class="container">
				취미장터

			</div>
		</div>
	</div>
	
	<!-- market etc modal -->
	<div class="portfolio-modal modal fade" id="mar_etc"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-content">
			<div class="close-modal" data-dismiss="modal">
				<div class="lr">
					<div class="rl"></div>
				</div>
			</div>
			<div class="container">
				그 외 아무거나 장터

			</div>
		</div>
	</div>
	
	<!-- comm wow modal -->
	<div class="portfolio-modal modal fade" id="wow"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-content">
			<div class="close-modal" data-dismiss="modal">
				<div class="lr">
					<div class="rl"></div>
				</div>
			</div>
			<div class="container">
				와게

			</div>
		</div>
	</div>
	
	<!-- comm lol modal -->
	<div class="portfolio-modal modal fade" id="lol"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-content">
			<div class="close-modal" data-dismiss="modal">
				<div class="lr">
					<div class="rl"></div>
				</div>
			</div>
			<div class="container">
				롤게

			</div>
		</div>
	</div>
	
	<!-- notice modal -->
	<div class="portfolio-modal modal fade" id="notice"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-content">
			<div class="close-modal" data-dismiss="modal">
				<div class="lr">
					<div class="rl"></div>
				</div>
			</div>
			<div class="container">
				공지게시판

			</div>
		</div>
	</div>

	<!-- Loading -->
	<div id="nloading" class="lgame" style="position:absolute;left:50%;top:50%;">
	  <div class="left">
	  </div>
	  <div class="right">
	  </div>
	  <div class="ball">
	  </div>
	  <div class="ballhit">
	  </div>
	</div>
	
	<!-- Plugin JavaScript -->
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script src="js/classie.js"></script>
	<script src="js/cbpAnimatedHeader.js"></script>
</body>
</html>
