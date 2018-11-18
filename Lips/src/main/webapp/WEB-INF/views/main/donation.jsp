<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lips - Project Management System</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>


<style>

p {

  font-family: Meiryo, "Hiragino Kaku Gothic Pro W3", Courier New, sans-serif;

  line-height: 1.5;

  margin-bottom: 25px;

  color: #fff;

}




.intromain {
									
/*   background: linear-gradient(-45deg, rgba(31, 31, 29, 0.77), rgba(12, 12, 12, 0.65)) fixed, url(/resources/img/intro/intro.jpg) fixed; */
    background: linear-gradient(-45deg, rgba(19, 19, 19, 0.89), rgba(12, 12, 12, 0.65)) fixed, url(/resources/img/intro/intro.jpg) fixed;
  background-size: cover;



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


<div id="image" style="height: 25em; padding-bottom: 3em;">	
<img src="/resources/img/intro/donaplz.png" style='padding: 6em; '  >
</div>


<h1 style="top :-3em; color:white"> Thank you for your Donation!</h1>
<div id="dona" style="margin: 3em auto;">
 <form style="display: inline;"action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" target="_top">
<input type="hidden" name="cmd" value="_s-xclick" />
<input type="hidden" name="hosted_button_id" value="T7AZQARKNVDGL" />
<!-- <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif" border="0" name="submit" title="PayPal - The safer, easier way to pay online!" alt="Donate with PayPal button" /> -->
<!-- <img alt="" border="0" src="https://www.sandbox.paypal.com/en_KR/i/scr/pixel.gif" width="1" height="1" /> -->
<!-- </form> -->

<button class="btn btn-primary" id="donation">Donation</button>
</form>
  
<a href="/">
<button class="btn btn-secondary" id="back">Back</button>
</a>	
   </div> 
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

</body>
<script type="text/javascript">
$(function(){
	  $("#back").mouseenter(function(){
		  $("#image").html("<img src='/resources/img/intro/donaplz2.png' style='padding: 6em;' >");
	  });
	  $("#back").mouseleave(function(){
		  $("#image").html("<img src='/resources/img/intro/donaplz.png' style='padding: 6em;' >");
	  });
	  
	  $("#donation").mouseenter(function(){
		  $("#image").html("<img src='/resources/img/intro/donaplz3.png' style='padding: 6em;' >");
	  });
	  $("#donation").mouseleave(function(){
		  $("#image").html("<img src='/resources/img/intro/donaplz.png' style='padding: 6em;' >");
	  });
	});
	
	

	
	//20181102 여기까지함.  
	// 도네  버튼 위치 조정
	// 이미지 감싸는 div 크기 고정하기
	// 프로젝트 - 종료된 프로젝트 
</script>
</html>