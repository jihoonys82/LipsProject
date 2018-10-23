<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="col col-12" style="margin: 3px; text-align: right; padding: 12px;">
<a href="/dashboard/dashBoardCustom?dashboardId=${dashBoardId}" >
	<button class="btn focus">Custom</button>
</a>

</div>


<script>

$(document).ready(function(){ 

	
	var $divbase = $("<div>")
					.attr("id", "divbase")
					.css("height", "100%");
	$("div.col-10").append( $divbase );
		var cardNo = 0;

	
	for(var i =1; i< ${maxX}+1; i++){
		var positionX = i ;
		
		var $div = $("<div>").attr("id", "div"+i)
		.css("width", ${99/maxX}+"%")
		.css("height", "100%")
		.css("float", "left")
// 		.css("border", "1px solid white")
		.load("/card/cardcontroller?dashboardId=${dashBoardId}&positionX="+positionX);
		$("#divbase").append( $div);

	
	}
});
</script>