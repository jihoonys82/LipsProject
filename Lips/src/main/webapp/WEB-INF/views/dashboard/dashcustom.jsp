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

}

.cardLayout .row .single {
	float: left;
	min-height: 100px;
	border: 1px solid white;
	width: 99%;
}

.cardLayout .row .double {
	float: left;
	min-height: 100px;
	border: 1px solid white;
	width: 49%;
}

.cardLayout .row .triple {
	float: left;
	min-height: 100px;
	border: 1px solid white;
	width: 32%
}

.cardLayout .row .quad {
	float: left;
	min-height: 100px;
	border: 1px solid white;
	width: 24%
}

.cardLayout .row .card {
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
						<div>
							<img src="/resources/img${Card.assetView}.PNG"
								style="width: 100%; height: 150px;">
						</div>
					</div>
					<div class="flip-box-back">
						<div>${Card.assetName}</div>
						<div>
							<h4>${Card.assetDescription}</h4>
						</div>
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
	<div class="col col-12" style="margin-top: 10px; margin-bottom: 10px;"
		id="headNav"> 
		
			<div class="navbar" style="float: left; width: 90%; height: 30px;">
				<strong>Line Select</strong>
				<div style="float: right;">
					<div class="combo">
						X : <select id="comboLineX" class="btn small toggle">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
						</select>
					</div>

					<div class="combo">
						Y : <select id="comboLineY" class="btn small toggle">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option> 
							<option value="4">4</option>
						</select>
					</div>
				</div>
			</div>
			<!-- end of layout selector -->  
			 <!--save button  --> 
 			<div style="float: left; margin-left: 10px;">
				<button class="btn" style="height: 40px;" type="button"onclick="dashSaveModal.show()">
					저장
				</button>
			</div>
 		
	<!--end of save button  -->
	</div>
</div>
<!-- combo End -->
<div class="cardLayout">
	<div class="row" id='x1'>
		<div class="single" id="y1" style="text-align: center;">
			<h1>사용법</h1>
			<br>
			<div style="text-align: left; width: 400px; padding: 20px;">
				1. 생성하고 싶은 라인갯수에 맞춰 X,Y를 선택<br>
				2. 위치를 선택한후 해당위치에 넣고 싶은 카드를 선택<br>
				3. 저장
			</div>

		</div>
	</div>
	
	<div id="dashSaveModal" class="msgbox" style="display: none;">
    <div class="head">
       	대시보드 이름 설정
    </div>
    <div class="body">
        	<input type="text" id="dashBoardName" placeholder="대시보드 이름" style="color: black;">
        	 <div style="text-align: center; margin-top: 45px;">
	        	<button class="btn" onclick="save()">Save</button>
	        	<button class="btn" onclick="dashSaveModal.hide()">Close</button>
        	</div>
    </div>
   
</div>
	
</div>
<!-- end of cardLayout -->
<form hidden="true" action="/dashboard/dashsave" method="Post" id="saveform">

</form>



<script>
//선택된 카드 저장할 변수 선언 
var selectedLocation; 
var dataCollection = new Object();
var saveList = new Array();
 
	jui.ready([ "ui.modal" ], function(modal) {
	    $("#dashSaveModal").appendTo("body");

	    dashSaveModal = modal("#dashSaveModal", {
	        color: "black"
	    });
	});
	

$(document).ready(function(){
	
	
	//0. 각 레이아웃 셀에 대한 값 변수 생성 및 초기화 
	//side bar init 
	
	var $tilesbody = $("div.col-10");
	var $assetlist = $("#assetlist").html();
	$("div.activityLog").empty().append($assetlist);
	
	// layout[x][y] init
	var lineX = $("#comboLineX").val();
	var lineY = $("#comboLineY").val();
	
	

	//1. x,y 셀렉터 값이 변할때 마다 레이아웃을 다시 짜줌 
	var drawLayout = function(){
		$(".cardLayout").empty();
		
		for(var i=0;i<lineY;i++){
			$(".cardLayout")
				.append($("<div>")
					.addClass("row")
					.addClass("clearfix")
					.attr("id", "y"+(i+1))
				);

			var cardWidth;
			switch(lineX) {
			case "1": cardWidth = "single";break;
			case "2": cardWidth = "double";break;
			case "3": cardWidth = "triple";break;
			case "4": cardWidth = "quad";break;
			default: cardWidth = "single"; break;
			}		
			for(var j=0;j<lineX;j++){
				var img = $("<img>") 
				.attr("src", "/resources/img/card/dashAddCard.png")
				.css("height", "50px")
				.css("width", "50px");
				
				var $div = $("<div>")			
						.addClass(cardWidth)
						.addClass("card")
						.attr("id", (j+1)+"x"+(i+1)) 
						.append(img);
						
				addListener($div);
				$("#y"+(i+1)).append($div);
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
		});
	}

	//3. 레이아웃 좌표에 카드 insert - document ready 상단으로 빼냈음

	//4. 지정한 설정 저장
	
});


//3. 카드 로드.
var insertCard = function(obj) {
	
// 	var checker = 0 ;
// 	for(var key in dataCollection){
// 		if(dataCollection[key] == obj.id){
// 		alert("Asset은 하나만 사용가능합니다");
// 		checker = 1 ;
// 		} 
// 	}
// 		if(checker=0){
		$(selectedLocation).empty().load(obj.id);
		dataCollector(selectedLocation , obj.id);		
// 		}
}


//저장시 사용할 데이터 콜렉터 value 값 추가 해야 됨 카드 생성후

var dataCollector = function(id , card){
	var idcard = id.attr("id");
	dataCollection[idcard+""] = card;
}

var save = function(){

var dashBoardName = $("#dashBoardName").val();

		dataCollection.dashboardId=${dashboardId};
		dataCollection.projectId=${projectId};
		dataCollection.dashBoardName = dashBoardName;
		saveList.push(dataCollection);

var saveData = JSON.stringify(saveList);
var $saveInput = $("<input>").attr("name","saveData").attr("value",saveData);
$("#saveform").append($saveInput);

$("#saveform").submit();

}

</script>