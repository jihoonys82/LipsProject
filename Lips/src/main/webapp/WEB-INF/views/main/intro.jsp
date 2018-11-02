<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lips - Project Management System</title>



<style>

p {

  font-family: Meiryo, "Hiragino Kaku Gothic Pro W3", Courier New, sans-serif;

  line-height: 1.5;

  margin-bottom: 25px;

  color: #fff;

}




.intromain {
/* 																										<img src="/resources/img/intro.jpg"> */
  background: linear-gradient(-45deg, rgba(246, 255, 0, .8), rgba(255, 0, 161, .8)) fixed, url("/resources/img/intro.jpg") fixed;

  background-size: cover;



}
.introbutton {
top: 35em; 
position: relative;
}


</style>
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
<!-- <link rel="stylesheet" href="/resources/css/lips_intro.css?ver=1" /> -->
</head>
<body class="intromain">
	<div align="center">
	
	
	<div>
	<p> Hello</p>
	</div>


		<!-- 버튼 start -->
		<a href="/user/login">
		<button class="btn btn-primary introbutton">get Started</button>
		</a>
		 <a href='#'>
		 <button class="btn btn-outline-dark introbutton">donation</button>
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
			
			
			
			Copyright ⓒ 2018. KH B-Class반 파이널프로젝트 3조 -김용재/모영호/안희민/유석호/송주현/정지훈/ all rights reserved.</h3>
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