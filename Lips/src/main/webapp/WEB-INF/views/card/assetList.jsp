<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" buffer="1024kb"  buffer="1024kb"%>
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
		<div id="${Card.assetName}">
		<div class="flip-box">
			<div class="flip-box-inner">
				<div class="flip-box-front">
					<div>${Card.assetName}</div>
					<div><img src="/resources/img/card/${Card.assetView}.PNG" style="width: 100%; height: 150px;"></div>
				</div>
				<div class="flip-box-back">
				<div>${Card.assetName}</div>
				<div><h4>${Card.assetDescription}</h4></div>
				</div>
			</div>
		</div>
		</div>
		<br>
	</c:forEach>
</div>



<script>

<c:set value="${sellocation}" var="location"/>
	
	<c:forEach items="${selCard}" var="Card">
	$("#${Card.assetName}")
		.click( function(){
			console.log("${location}");
		}

		);
	</c:forEach>

function cardData(cell){
	cell = $card;
}
function datainput(dataInsert){
	dataInsert = $dataInsert
}

</script>
