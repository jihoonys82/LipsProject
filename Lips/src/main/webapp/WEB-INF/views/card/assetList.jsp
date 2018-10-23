<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" buffer="1024kb"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
}

.flip-box {
  background-color: transparent;
  width: 100%;
  height: 180px;

  perspective: 1000px;
}

.flip-box-inner {
  position: relative;
  width: 100%;
  height: 100%;
  text-align: center;
  transition: transform 0.8s;
  transform-style: preserve-3d;
}

.flip-box:hover .flip-box-inner {
  transform: rotateY(180deg);
}

.flip-box-front, .flip-box-back {
  position: absolute;
  width: 100%;
  height: 100%;
  backface-visibility: hidden;
}

.flip-box-front {
  color: white;
}

.flip-box-back {
  background-color: #282828;
  color: black;
  transform: rotateY(180deg);
}
</style>

<div>
	<c:forEach items="${selCard}" var="Card">
		<c:set value="${Card.assetView}" var="url" />
		<div class="flip-box">
			<div class="flip-box-inner">
				<div class="flip-box-front">
					<div>${Card.assetName}</div>
					<div><img src="/resources/img${url}.PNG" style="width: 100%; height: 150px;"></div>
				</div>
				<div class="flip-box-back">
					<h3>${Card.assetDescription}</h3>
				</div>
			</div>
		</div>
		

		<br>
	</c:forEach>
</div>

<script>
// $("flip-box").onclick(function color() {
// 	$("flip-box").css("border", "3px solid gray")	
// }) 제고중
</script>
