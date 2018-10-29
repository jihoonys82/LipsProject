<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
						<li value="5">5</li>
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
						<li value="5">5</li>
						
					</ul>
				</div>
			</div>

		</div>
	</div>

</div>
<script>
	
	var $divbase = $("<div>").attr("id", "divbase").css("height", "100%");
	var $tilesbody = $("div.col-10");
	$tilesbody.removeClass("col-10").addClass("col-12");
	$tilesbody.append($divbase);
	
	var locationOb= Object();
	
	var cardLocation = "1,1";
	var xLocation = 1*1;
	var xLocation = 1*1;
	
	
	var maxXLocation = 1 * 1;
	var maxYLocation = 1 * 1;
	
	$(document).ready(function combobox() {
		
		
		$("div.activityLog").empty();
		$("div.activityLog").hide();
		layoutSetting(1,1);
		
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
						$("#divbase").children("div").empty();
						layoutSetting(maxXLocation, maxYLocation);
					}
				}
			});
		});
		
	});
	
	function clickCard(dom){
		var location = dom.id;
// 		console.log(location);
		$tilesbody.removeClass("col-12").addClass("col-10");
		$("div.activityLog").load("/card/assetList?"+location);
		$("div.activityLog").show();
	}
	
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
					.css("height", "100px")
					.css("width", "100%")
					.css("border", "1px solid white")
					.click(function(dom){});
					
				$carddiv.append($cardadd);
				$cardBase.append($carddiv);
			}
		
		}
		
		
	}
	
</script>