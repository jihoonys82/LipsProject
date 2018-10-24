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
						<li>
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
						<li>
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
	var cardNo = 0;

	var maxXLocation = 1 * 1;
	var maxYLocation = 1 * 1;
	

	$(document).ready(function combobox() {
		
		
		$("div.activityLog").empty().load("/card/assetList");
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

	function layoutSetting(maxXLocation, maxYLocation) {
		for (var i = 0; i < maxXLocation ; i++) {
			
			var $cardBase = $("<div>")
				.css("height", "100%")
				.css("width", "100%");
			
			for (var j = 0; j < maxYLocation; j++) {
				var $cardadd = $("<img>")
				.attr("src", "/resources/img/card/dashAddCard.png")
				.css("height", "100px")
				.css("width", "100px")
				
				
				var $carddiv = $("<div>")
					.css("height", "100px")
					.css("width", "100%")
					.css("border", "1px solid white");
					
				$carddiv.append($cardadd);
				$carddiv.click(function(){
					$tilesbody.removeClass("col-12").addClass("col-10");
					$("div.activityLog").show();
				});
			$cardBase.append($carddiv);
		}
			

			var $div = $("<div>")
				.css("height", "100%")
				.css("width", 99 / maxXLocation + "%")
				.css("float", "left");
				
				$div.append($cardBase);
				
			$("#divbase").append($div);
		}
		
		
	}

	

</script>