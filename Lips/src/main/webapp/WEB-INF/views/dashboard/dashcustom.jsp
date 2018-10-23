<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="col col-12" style="margin-top: 10px;" id="headNav">
	<div class="panel">
		<div class="head">
			<strong>Line Select</strong>

			<div style="float: right;">
				<div id="comboLine" class="combo">
					<a class="btn small" style="width: 179px;">Select...</a> <a
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
<script>
$("div.activityLog").empty();

var $divbase = $("<div>")
.attr("id", "divbase")
.css("height", "100%");
$("div.col-10").append( $divbase );
var cardNo = 0;

var lineData = new Array();
var MaxXLocation = 2*1;
var LocationData = new Array();

	$(document).ready(function combobox() {
		layoutSetting(1);
		jui.ready([ "ui.combo" ], function(combo) {
			comboLine = combo("#comboLine", {
				index : 0,
				event : {
					change : function(data) {
						MaxXLocation = data.value*1;
						$("#divbase").empty();
						layoutSetting(MaxXLocation);
					}	
				}
			});
		});
			
		
		$("div.activityLog").load("/card/assetList");
		
	});
	
	function layoutSetting(MaxXLocation){
			
			for(var i =1; i< MaxXLocation+1; i++){
				var positionX = i ;
				
				var $div = $("<div>").attr("id", "div"+i)
				.css("width", 99/MaxXLocation+"%")
				.css("height", "100%")
				.css("float", "left")
				.css("border", "1px solid white")
				.text("YLocation <div> 추가 안함")
//				 	.load("/card/cardcontroller?dashboardId=${dashBoardId}&positionX="+positionX);
				$("#divbase").append( $div);
			}
		};
		




	//     	function dataCollect(){	};
</script>