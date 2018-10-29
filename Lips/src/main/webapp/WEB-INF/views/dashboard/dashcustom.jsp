<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
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
.cardLayout {
	padding: 10px;
}
	.cardLayout .row {
		width: 100%;
		min-height: 100px;
/* 		border : 1px solid white; */
	}
		.cardLayout .row .single {
			float:left; 
			min-height:100px;
			border : 1px solid white;
			width: 99%;
		}
		.cardLayout .row .double {
			float:left; 
			min-height:100px;
			border : 1px solid white;
			width: 49%;
		}
		.cardLayout .row .triple {
			float:left; 
			min-height:100px;
			border : 1px solid white;
			width: 32%
		}
		.cardLayout .row .quad {
			float:left; 
			min-height:100px;
			border : 1px solid white;
			width: 24%
		}
		.cardLayout .row .card {
/* 			background-color: gray; */
			padding: 3px;
		}

</style>

<!-- side asset list  -->
<div id="assetlist" hidden="true">
	<c:forEach items="${selCard}" var="Card">
		<div id="${Card.assetView}" onclick="insertCard(this)"> 
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
<div class="row">
	<div class="col col-12" style="margin-top: 10px; margin-bottom: 10px;" id="headNav">
		<div class="panel">
			<div class="head">
				<strong>Line Select</strong>
				<div style="float: right;">	
					<div  class="combo">
						X :
						<select id="comboLineX" class="btn small toggle">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
						</select>
					</div>
	
					<div class="combo">
						Y : 
						<select id="comboLineY" class="btn small toggle">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
						</select>
					</div>
				</div>
	
			</div><!-- end of layout selector -->
		</div><!-- end of panel  -->
	</div>
</div>
<!-- combo End -->
<div class="cardLayout">
	<div class="row" id='x1'>
		<div class="single" id="y1">
		
		</div>
	</div>
</div> <!-- end of cardLayout -->


<script>
//선택된 카드 저장할 변수 선언 
var selectedLocation; 

$(document).ready(function(){
	//0. 각 레이아웃 셀에 대한 값 변수 생성 및 초기화 
	//side bar init 
	var $tilesbody = $("div.col-10");
	var $assetlist = $("#assetlist").html();
	$("div.activityLog").empty().append($assetlist);
	
	var sideHide = function() {
		$tilesbody.removeClass("col-10").addClass("col-12");
		$("div.activityLog").hide();
	}
	var sideShow = function() {
		$tilesbody.removeClass("col-12").addClass("col-10");
		$("div.activityLog").show();
	}
// 	sideHide();
	
	// layout[x][y] init
	var lineX = $("#comboLineX").val();
	var lineY = $("#comboLineY").val();
	
	var layout = new Array(4);
	for(var arr=0;arr<4;arr++){
		layout[arr] = new Array(4);
	}
	for (var i=0;i<4;i++) {
		for (var j=0;j<4;j++){
			layout[i][j] = $("<img>")
			.attr("src", "/resources/img/card/dashAddCard.png")
			.css("height", "50px")
			.css("width", "50px");
		}
	};

	//1. x,y 셀렉터 값이 변할때 마다 레이아웃을 다시 짜줌 
	var drawLayout = function(){
		$(".cardLayout").empty();
		
		for(var i=0;i<lineX;i++){
			$(".cardLayout")
				.append($("<div>")
					.addClass("row")
					.addClass("clearfix")
					.attr("id", "x"+(i+1))
				);

			var cardWidth;
			switch(lineY) {
			case "1": cardWidth = "single";break;
			case "2": cardWidth = "double";break;
			case "3": cardWidth = "triple";break;
			case "4": cardWidth = "quad";break;
			default: cardWidth = "single"; break;
			}		
			for(var j=0;j<lineY;j++){
				var $div = $("<div>")			
						.addClass(cardWidth)
						.addClass("card")
						.attr("id", "x"+(i+1)+"y"+(j+1))
						.append(layout[i][j]);
				addListener($div);
				$("#x"+(i+1)).append($div);
			}
		}
	}
	
	$("#comboLineX").on("change", function(){
		lineX = $("#comboLineX").val();
		drawLayout();
	});
	$("#comboLineY").on("change", function(){
		lineY = $("#comboLineY").val();
		drawLayout();
	});

	//2. 레이아웃 선택 시 해당 값이 선택되었음을 표시 
	var addListener = function(args){
		args.on("click",function(){
			$("div.card").css("background-color", "black");
			$(this).css("background-color", "gray");
			selectedLocation=$(this);
// 			sideShow();
		});
	}

	//3. 레이아웃 좌표에 카드 insert - document ready 상단으로 빼냈음



	//4. 지정한 설정 저장
	
	
});


//3. 카드 로드.
var insertCard = function(obj) {
	$(selectedLocation).empty().load(obj.id);		
}

	
// 	// tilesbody 위에 올라갈 div
// 	var $divbase = $("<div>").attr("id", "divbase").css("height", "100%");	
// 	// tilesbody
// 	var $tilesbody = $("div.col-10");
	
// 	var $assetlist = $("#assetlist").html();

	
// 	$tilesbody.removeClass("col-10").addClass("col-12");
// 	$tilesbody.append($divbase);
	
// 	//location 좌표 id 저장용 object
// 	var locationOb= Object();
	
// 	//기본값들
// 	//통합 location 1,1
// 	var cardLocation = "1,1";
	
// 	//xlocation 기본값 1
// 	var xLocation = 1*1;
	
// 	//ylocation 기본값 1
// 	var yLocation = 1*1;
	
// 	//xlocation max 기본값 1
// 	var maxXLocation = 1 * 1;
	
// 	//ylocation max 기본값 1
// 	var maxYLocation = 1 * 1;
// 	//기본값 end
	
	
		
// 	//assetlist click event
// 	function cardclick(obj){
// 		$(cardLocation).empty().load(obj.id);
// // 		console.log(cardLocation);  
// 	}

	
// 	$(document).ready(function combobox() {
	
		
			
// 		//side asset list div tiles empty 
// 		$("div.activityLog").empty().append($assetlist);
// 		$("div.activityLog").hide();
		
// 		//layout 기본 1,1 세팅
// 		layoutSetting(1,1);
		
// 		//combo box script
// 		jui.ready([ "ui.combo" ], function(combo) {
// 			comboLineX = combo("#comboLineX", {
// 				index : 0,
// 				event : {
// 					change : function(data) {
// 						maxXLocation = data.value * 1;
// 						$("#divbase").empty();
// 						layoutSetting(maxXLocation, maxYLocation);
// 					}
// 				}
// 			});
// 		});
// 		jui.ready([ "ui.combo" ], function(combo) {
// 			comboLineY = combo("#comboLineY", {
// 				index : 0,
// 				event : {
// 					change : function(data) {
// 						maxYLocation = data.value * 1;
// 						$("#divbase").empty();
// 						layoutSetting(maxXLocation, maxYLocation);
// 					}
// 				}
// 			});
// 		});
		
// 	});
	
// 	//click Card base div function
// 	function clickCard(dom){
// 		cardLocation = $(dom);
// 		$tilesbody.removeClass("col-12").addClass("col-10");
// // 		$("div.activityLog").load("/card/assetList?"+location);	//jsp + sub jsp병합 전
// 		$("div.activityLog").show();
// 	}
	
// 	//layoutsetting function
// 	function layoutSetting(maxXLocation, maxYLocation) {
// 		//x location for (maxXLocation 으로 돌림)
// 		for (var i = 1; i < maxXLocation+1 ; i++) {
			
// 			xLocation = i;
			
// 			var $cardBase = $("<div>")
// 			.attr("id","div"+i)
// 			.css("height", "100%")
// 			.css("width", 99 / maxXLocation + "%")
// 			.css("float", "left");
			
// 			$("#divbase").append($cardBase);
// // 			$("#divbase").html($cardBase);
			
// 			//y location for (maxYLocation 으로 돌림)
// 			for (var j = 1; j < maxYLocation+1; j++) {
				
// 				yLocation = j;
// 				locationOb.x = xLocation;
// 				locationOb.y = yLocation;
				
// 				var $cardadd = $("<img>")
// 				.attr("src", "/resources/img/card/dashAddCard.png")
// 				.css("height", "100px")
// 				.css("width", "100px")
				
				
// 				var $carddiv = $("<div>")
// 					.attr("id","positionX="+xLocation+"&positionY="+yLocation)
// 					.attr("onclick","clickCard(this)")
// 					.css("min-height", "200px")
// 					.css("width", "100%")
// 					.css("border", "1px solid white")
// // 					.css("position", "absolute")
// // 					.css("height", "auto")
// 					.click(function(dom){});
					 
// 				$carddiv.append($cardadd);
// 				$cardBase.append($carddiv);
// 			}
		
// 		}
		
		
// 	}
	
</script>