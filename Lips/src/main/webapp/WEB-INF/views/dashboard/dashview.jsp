<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>





<script>

	$(document).ready(function(){ 

	
		var $divbase = $("<div>")
						.attr("id", "divbase")
						.css("height", "100%");
		$("div.col-10").append( $divbase );
			var cardNo = 0;
	
		
		for(var i =1; i< ${maxX}+1; i++){

			var $div = $("<div>").attr("id", "div"+i)
			.css("width", ${99/maxX}+"%")
			.css("height", "100%")
			.css("float", "left")
// 			.css("border", "1px solid white")
			.css("margin-top", "5px");
			$("#divbase").append( $div);
			
				for(var j =0; j<${maxY}; j++){
					
					console.log(cardNo);
					
					var $card = $("<div>")
							.attr("id", "card"+cardNo )
							.css("margin", "5px")
							.css("height", "15em")
							.load("/card/${viewName[""+cardNo+""]}");
							//paused
					var cardNo = cardNo++;	
					$div.append($card);
					
				};
		};
	});
</script>