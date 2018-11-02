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
									
  background: linear-gradient(-45deg, rgba(31, 31, 29, 0.77), rgba(12, 12, 12, 0.65)) fixed, url(/resources/img/intro.jpg) fixed;

  background-size: cover;



}
.introbutton {
top: 40em; 
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
		<button class="btn btn-outline-info introbutton">get Started</button>
		</a>
		 <a href="/donation">
		 <button class="btn btn-outline-primary introbutton">donation</button>
		 </a>
		<!-- 버튼 end -->


	</div>
<footer class="container-fluid">
	<div class="row">
		<div>
			<h3 Style=
			" font-size: 0.7rem;
    color: #ccc7c7;
    text-align: center;
    position: fixed;
    width: 100%;
    bottom: 0px;
    left: 0px;
    background: #13141578;
    margin: 0;
    line-height: 2rem;"
			>
			
			
			
			Copyright ⓒ 2018. KH B-Class FinalProject Lips by 김용재/모영호/안희민/유석호/송주현/정지훈/ all rights reserved.</h3>
		</div>
		</div>
		
	
</footer>


</body>
</html>