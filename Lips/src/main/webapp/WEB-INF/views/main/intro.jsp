<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lips - Project Management System</title>

<!-- 부트스트랩 -인트로용 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
	integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
	integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
	crossorigin="anonymous"></script>
<!-- 인트로CSS -->
<link rel="stylesheet" href="/resources/css/lips_intro.css?ver=1" />
</head>



<body id="intromain">

	<!-- 캐러셀 -->
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block  w-100"
					src="https://via.placeholder.com/1800x480" alt="First slide">
			</div>
			<div class="carousel-item">
				<img class="d-block  w-100"
					src="https://via.placeholder.com/1800x480" alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-block  w-100"
					src="https://via.placeholder.com/1800x480" alt="Third slide">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	<!-- 캐러셀end -->
	<div align="center">



		<!-- 버튼 start -->
		<a href="/user/login">
		<button class="button">get Started</button>
		</a>
		 <a href='#'>
		 <button class="button" >donation</button>
		 </a>
		<!-- 버튼 end -->


	</div>
<footer class="container-fluid">
	<div class="row">
		<div>
			<h3 Style="font-size: 0.7rem;color: gray; text-align: center;
			position : fixed; width:100%; bottom: 0px; left: 0px;
			background : #343a40;
			margin : 0;
			line-height : 2rem";>
			
			
			
			Copyright ⓒ 2018. KH B-Class반 파이널프로젝트 3조 -김용재/김혁수/모영호/문재환/이현우/ all rights reserved.</h3>
		</div>
		</div>
		
	
</footer>





	<!-- Script link here  -->
	<!--  자바스크립트-->
<!-- 	<script type="text/javascript" src="/resources/js/lips.js"></script> -->

	
	<!-- 캐러셀 속도조정  -->
	<script type="text/javascript">
		$('.carousel').carousel({
			interval : 3000
		})
	</script>
</body>
</html>