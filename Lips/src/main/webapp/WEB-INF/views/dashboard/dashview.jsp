<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

1111111111111
<script>
	
	$(document).ready(function(){
		
		
		var $divbase = $("<div>").attr("id", "divbase");
		$("div.col-10").append( $divbase );
	
		var i =1 ; 
		var j =1 ;
		var cardNo = 1 ;
		
	
		
		for(i; i< ${maxX}+1; i++){

			var $div = $("<div>").attr("id", "div"+i).text("test")
			.css("width", ${99/maxX}+"%")
			.css("height", "100%")
			.css("float", "left")
			.css("border", "1px solid white")
			.css("margin-top", "5px");
			$("#divbase").append( $div);
			
			//lineMax["i"]
			for( j=1; j<1; j++){
			var $card = $("<div>")
						.attr("id", "card"+cardNo )
						.text("card"+cardNo);
			
// 			var $seldiv = ${"#divbase > #div i"};
				$('div'+i).append($card);
			cardNo++;
			}
		};
		
	});
</script>