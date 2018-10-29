<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<!-- side asset list  -->
<div id="assetlist" hidden="true">
	<c:forEach items="${selCard}" var="Card">
		<div id="${Card.assetView}" onclick="cardclick(this)"> 
		<div class="flip-box">
			<div class="flip-box-inner">
				<div class="flip-box-front">
					<div>${Card.assetName}</div>
					<div><img src="/resources/img${Card.assetView}.PNG" style="width: 100%; height: 150px;"></div>
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
<!-- side End -->

<!-- top combo box -->
<div class="col col-12" style="margin-top: 10px; margin-bottom: 10px;"
	id="headNav">
	<div class="panel">
		<div class="head">
			<strong>Line Select</strong>

			<div style="float: right;">

				<div id="comboLineX" class="combo">
					X : <a class="btn small" style="width: 179px;">Select...</a> <a
						class="btn small toggle"><i class="icon-arrow2"></i></a>
					<ul>
						<li value="1">1</li>
						<li value="2">2</li>
						<li value="3">3</li>
						<li value="4">4</li>
						
					</ul>
				</div>



				<div id="comboLineY" class="combo">
					Y : <a class="btn small" style="width: 179px;">Select...</a> <a
						class="btn small toggle"><i class="icon-arrow2"></i></a>
					<ul>
						<li value="1">1</li>
						<li value="2">2</li>
						<li value="3">3</li>
						<li value="4">4</li>
						
						
					</ul>
				</div>
			</div>

		</div>
	</div>

</div>
<!-- combo End -->
<script>
	
	// tilesbody 위에 올라갈 div
	var $divbase = $("<div>").attr("id", "divbase").css("height", "100%");	
	// tilesbody
	var $tilesbody = $("div.col-10");
	
	var $assetlist = $("#assetlist").html();

	
	$tilesbody.removeClass("col-10").addClass("col-12");
	$tilesbody.append($divbase);
	
	//location 좌표 id 저장용 object
	var locationOb= Object();
	
	//기본값들
	//통합 location 1,1
	var cardLocation = "1,1";
	
	//xlocation 기본값 1
	var xLocation = 1*1;
	
	//ylocation 기본값 1
	var yLocation = 1*1;
	
	//xlocation max 기본값 1
	var maxXLocation = 1 * 1;
	
	//ylocation max 기본값 1
	var maxYLocation = 1 * 1;
	//기본값 end
	
	
		
	//assetlist click event
	function cardclick(obj){
		$(cardLocation).empty().load(obj.id);
// 		console.log(cardLocation);  
	}

	
	$(document).ready(function combobox() {
	
		
			
		//side asset list div tiles empty 
		$("div.activityLog").empty().append($assetlist);
		$("div.activityLog").hide();
		
		//layout 기본 1,1 세팅
		layoutSetting(1,1);
		
		//combo box script
		jui.ready([ "ui.combo" ], function(combo) {
			comboLineX = combo("#comboLineX", {
				index : 0,
				event : {
					change : function(data) {
						maxXLocation = data.value * 1;
						$("#divbase").empty();
						layoutSetting(maxXLocation, maxYLocation);
					}
				}
			});
		});
		jui.ready([ "ui.combo" ], function(combo) {
			comboLineY = combo("#comboLineY", {
				index : 0,
				event : {
					change : function(data) {
						maxYLocation = data.value * 1;
						$("#divbase").empty();
						layoutSetting(maxXLocation, maxYLocation);
					}
				}
			});
		});
		
	});
	
	//click Card base div function
	function clickCard(dom){
		cardLocation = $(dom);
		$tilesbody.removeClass("col-12").addClass("col-10");
// 		$("div.activityLog").load("/card/assetList?"+location);	//jsp + sub jsp병합 전
		$("div.activityLog").show();
	}
	
	//layoutsetting function
	function layoutSetting(maxXLocation, maxYLocation) {
		//x location for (maxXLocation 으로 돌림)
		for (var i = 1; i < maxXLocation+1 ; i++) {
			
			xLocation = i;
			
			var $cardBase = $("<div>")
			.attr("id","div"+i)
			.css("height", "100%")
			.css("width", 99 / maxXLocation + "%")
			.css("float", "left");
			
			$("#divbase").append($cardBase);
// 			$("#divbase").html($cardBase);
			
			//y location for (maxYLocation 으로 돌림)
			for (var j = 1; j < maxYLocation+1; j++) {
				
				yLocation = j;
				locationOb.x = xLocation;
				locationOb.y = yLocation;
				
				var $cardadd = $("<img>")
				.attr("src", "/resources/img/card/dashAddCard.png")
				.css("height", "100px")
				.css("width", "100px")
				
				
				var $carddiv = $("<div>")
					.attr("id","positionX="+xLocation+"&positionY="+yLocation)
					.attr("onclick","clickCard(this)")
					.css("min-height", "200px")
					.css("width", "100%")
					.css("border", "1px solid white")
// 					.css("position", "absolute")
// 					.css("height", "auto")
					.click(function(dom){});
					 
				$carddiv.append($cardadd);
				$cardBase.append($carddiv);
			}
		
		}
		
		
	}
	
</script>