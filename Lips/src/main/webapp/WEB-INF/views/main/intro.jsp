<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lips - Project Management System</title>




<style>




.introtext {

	height: 10em;
    line-height: 10em;
    margin: 10em;
    margin-left: 20em;
    margin-right: 20em;
    border-radius: 10px;
    border: 1.5px solid #afafaf73;

}

html, body {
@import url("https://fonts.googleapis.com/css?family=Syncopate");
  -webkit-font-smoothing: antialiased;
  font-family: 'Syncopate', Helvetica, Arial;
	text-transform: uppercase;
	margin: 0;
	height: 100%;
	width: 100%;
	display: table;
}
html {
  /* subtlepatterns.com */
	background: url("http://neilcarpenter.com/demos/asfalt.png") repeat;
}
body {
	overflow: hidden;	
	background: -moz-radial-gradient(center, ellipse cover, rgba(0,0,0,0) 0%, rgba(0,0,0,0.44) 100%); /* FF3.6+ */
	background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%,rgba(0,0,0,0)), color-stop(100%,rgba(0,0,0,0.44))); /* Chrome,Safari4+ */
	background: -webkit-radial-gradient(center, ellipse cover, rgba(0,0,0,0) 0%,rgba(0,0,0,0.44) 100%); /* Chrome10+,Safari5.1+ */
	background: -o-radial-gradient(center, ellipse cover, rgba(0,0,0,0) 0%,rgba(0,0,0,0.44) 100%); /* Opera 12+ */
	background: -ms-radial-gradient(center, ellipse cover, rgba(0,0,0,0) 0%,rgba(0,0,0,0.44) 100%); /* IE10+ */
	background: radial-gradient(ellipse at center, rgba(0,0,0,0) 0%,rgba(0,0,0,0.44) 100%); /* W3C */
}
p {
	display: table-cell;
	text-align: center;
	vertical-align: middle;
	font-size: 2em;
	line-height: 2em;
}
i {
	display: inline-block;
	font-style: normal;
	padding: 0 0.25em;
	-webkit-transform: scale(0) translate3d(0, -2000px, 0);
	   -moz-transform: scale(0) translate3d(0, -2000px, 0);
		-ms-transform: scale(0) translate3d(0, -2000px, 0);
		 -o-transform: scale(0) translate3d(0, -2000px, 0);
			transform: scale(0) translate3d(0, -2000px, 0);
	background: rgba(255, 255, 255, 0.3);
	border-radius: 50%;
}
i.fly-in-out {
	-webkit-animation: fly-in-out 3s infinite ease-in-out;
	   -moz-animation: fly-in-out 3s infinite ease-in-out;
		 -o-animation: fly-in-out 3s infinite ease-in-out;
			animation: fly-in-out 3s infinite ease-in-out;
}

@-webkit-keyframes fly-in-out {
	0% {
		-webkit-transform: scale(0) translate3d(0, -1000px, 0);
		background: rgba(255, 255, 255, 0.3);
		box-shadow: 0 0 100px 100px rgba(255, 255, 255, 0.2);
		border-radius: 50%;
	}
	15%, 85% {
		color: rgba(255, 255, 255, 0.8);
		text-shadow: 0 0 5px rgba(255, 255, 255, 0.5);
		-webkit-transform: scale(1) translate3d(0, 0, 0);
		background: transparent;
		box-shadow: none;
	}
	100% {
		color: transparent;	
		-webkit-transform: scale(0) translate3d(0, 1000px, 0);
		background: rgba(255, 255, 255, 0.3);
		box-shadow: 0 0 100px 100px rgba(255, 255, 255, 0.2);
		border-radius: 50%;
	}
}
@-moz-keyframes fly-in-out {
	0% {
		-moz-transform: scale(0) translate3d(0, -2000px, 0);
		background: rgba(255, 255, 255, 0.3);
		box-shadow: 0 0 100px 100px rgba(255, 255, 255, 0.2);
		border-radius: 50%;
	}
	15%, 85% {
		color: rgba(255, 255, 255, 0.8);
		text-shadow: 0 0 5px rgba(255, 255, 255, 0.5);
		-moz-transform: scale(1) translate3d(0, 0, 0);
		background: transparent;
		box-shadow: none;
	}
	100% {
		color: transparent;	
		-moz-transform: scale(0) translate3d(0, 2000px, 0);
		background: rgba(255, 255, 255, 0.3);
		box-shadow: 0 0 100px 100px rgba(255, 255, 255, 0.2);
		border-radius: 50%;
	}
}
@-o-keyframes fly-in-out {
	0% {
		-o-transform: scale(0) translate3d(0, -2000px, 0);
		background: rgba(255, 255, 255, 0.3);
		box-shadow: 0 0 100px 100px rgba(255, 255, 255, 0.2);
		border-radius: 50%;
	}
	15%, 85% {
		color: rgba(255, 255, 255, 0.8);
		text-shadow: 0 0 5px rgba(255, 255, 255, 0.5);
		-o-transform: scale(1) translate3d(0, 0, 0);
		background: transparent;
		box-shadow: none;
	}
	100% {
		color: transparent;	
		-o-transform: scale(0) translate3d(0, 2000px, 0);
		background: rgba(255, 255, 255, 0.3);
		box-shadow: 0 0 100px 100px rgba(255, 255, 255, 0.2);
		border-radius: 50%;
	}
}
@keyframes fly-in-out {
	0% {
		transform: scale(0) translate3d(0, -2000px, 0);
		background: rgba(255, 255, 255, 0.3);
		box-shadow: 0 0 100px 100px rgba(255, 255, 255, 0.2);
		border-radius: 50%;
	}
	15%, 85% {
		color: rgba(255, 255, 255, 0.8);
		text-shadow: 0 0 5px rgba(255, 255, 255, 0.5);
		transform: scale(1) translate3d(0, 0, 0);
		background: transparent;
		box-shadow: none;
	}
	100% {
		color: transparent;	
		transform: scale(0) translate3d(0, 2000px, 0);
		background: rgba(255, 255, 255, 0.3);
		box-shadow: 0 0 100px 100px rgba(255, 255, 255, 0.2);
		border-radius: 50%;
	}
}








.intromain {
									
/*   background: linear-gradient(-45deg, rgba(31, 31, 29, 0.77), rgba(12, 12, 12, 0.65)) fixed, url(/resources/img/intro/intro.jpg) fixed; */
    background: linear-gradient(-45deg, rgba(19, 19, 19, 0.89), rgba(12, 12, 12, 0.65)) fixed, url(/resources/img/intro/intro.jpg) fixed;
  background-size: cover;



}
.introbutton {
margin-top: -3em;
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
	
<div class="introtext">

<!-- <p style="margin: 4em auto;"> Lightweight Integrated Project management System</p> -->

<p style="font-size : 1em; padding: 0.5em;"> Project Management</p>
<div style="margin: 2em auto;
    position: relative;
    top: -3em;
    font-size: 2.5em;
    color: #b7acac;
    font-family: 'Syncopate', Helvetica, Arial;"
    ><span>L </span><span style="color:red;">i </span><span> p s</span></div>










		<!-- 버튼 start -->
		<a href="/user/login">
		<button class="btn btn-outline-danger introbutton">get Started</button>
		</a>
		 <a href="/donation">
		 <button class="btn btn-outline-info introbutton">donation</button>
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
			
			
			
			Copyright ⓒ 2018. KH B-Class FinalProject Lips by FLECHA(김용재/모영호/안희민/유석호/송주현/정지훈/) all rights reserved.</h3>
		</div>
		</div>
		
	
</footer>

<script type="text/javascript">
testEle = $('#test');
$('#fadeOutBt').click(function(){
testEle.fadeOut();
});
$('#fadeInBt').click(function(){
testEle.fadeIn();
});


var paragraph = document.getElementsByTagName('p')[0];

function textEffect(animationName) {
  var text = paragraph.innerHTML,
		chars = text.length,
		newText = '',
		animation = animationName,
		char,
		i;

	for (i = 0; i < chars; i += 1) {
		newText += '<i>' + text.charAt(i) + '</i>';
	}

	paragraph.innerHTML = newText;

	var wrappedChars = document.getElementsByTagName('i'),
		wrappedCharsLen = wrappedChars.length,
		j = 0;

	function addEffect () {
		setTimeout(function () {
			wrappedChars[j].className = animation;
			j += 1;
			if (j < wrappedCharsLen) {
				addEffect();
			}
		}, 100)
	}

	addEffect();
};

textEffect('fly-in-out');


</script>
</body>
</html>