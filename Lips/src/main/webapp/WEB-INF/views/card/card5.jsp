<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	
<div class="navbar" id="d-day" style="height: 300px; margin: 3px;">

</div>

<script>
$(document).ready(function(){ 
	var deadLine = "${deadLine}";
	var countDownDate = new Date("${deadLine}").getTime(); 

	//1초마다 갱신되도록 함수 생성,실행
	var x = setInterval(function() { 
		// 오늘 날짜 등록 
		var now = new Date().getTime(); 
// 		console.log(now);
		// 종료일자에서 현재일자를 뺀 시간 
		var distance = countDownDate - now; 
		// 각 변수에 일, 시, 분, 초를 등록 
		var d = Math.floor(distance / (1000 * 60 * 60 * 24)); 
		var h = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)); 
		var m = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60)); 
		var s = Math.floor((distance % (1000 * 60)) / 1000);

		//id가 d-day인 HTML코드에 내용 삽입 
		$("#d-day").text("종료일까지 " + d +"일 " + h + "시간 " + m +"분 "+s + "초 남았습니다."); 
		});
});


</script>