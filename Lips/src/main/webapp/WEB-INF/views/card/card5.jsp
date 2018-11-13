<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div style="height: 300px; margin: 3px; display:flex; align-items:center;">
	<div class="navbar basediv" style="width: 100%;">
		<h1>Dead Line</h1>
		<h2 id="d-day"></h2>
		<br>

		<div>
			<div
				style="width: 100%; height: 50px; padding: 0px; border: 1px solid gray;"
				class="navbar">
				<div id="countBar"
					style="height: 95%; padding: 0px; margin: 0px; background: red; float: left;"
					class="navbar"></div>
			</div>
		</div>
	</div>
</div>

<script>
	$(document)
			.ready(
					function() {

						var countDownDate = new Date("${deadLine}").getTime();
						var createDate = new Date("${createLine}").getTime();

						intervalCheck();

						function intervalCheck() {
							var today = new Date().getTime();

							if (countDownDate - today > 0) {
								setInterval()
							} else {
								var h1tag = $(
										'<h2 style="text-align : center; ">')
										.text("프로젝트가 종료되었습니다");
								$(".basediv").empty().append(h1tag);

							}
						}

						//1초마다 갱신되도록 함수 생성,실행
						function setInterval() {
							// 오늘 날짜 등록 
							var now = new Date().getTime();
							// 종료일자에서 현재일자를 뺀 시간 
							var distance = countDownDate - now;
							var countLine = countDownDate - createDate;

							// RunningCountor
							var runningLine = (1 - (distance / countLine)) * 100;
							// 		console.log(RunningLine);
							// 각 변수에 일, 시, 분, 초를 등록 
							var d = Math
									.floor(distance / (1000 * 60 * 60 * 24));
							var h = Math
									.floor((distance % (1000 * 60 * 60 * 24))
											/ (1000 * 60 * 60));
							var m = Math.floor((distance % (1000 * 60 * 60))
									/ (1000 * 60));
							var s = Math.floor((distance % (1000 * 60)) / 1000);

							//id가 d-day인 HTML코드에 내용 삽입 
							$("#d-day").text(
									d + "일 " + h + "시간 " + m + "분 " + s + "초");
							$("#countBar").width(runningLine + "%");

							var d = setTimeout(intervalCheck, 1000);

						}
					});
</script>