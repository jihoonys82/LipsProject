<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	
	$(document).ready(function(){
		var $divbase = $("<div>").attr("id", "divbase");
		$("div.col-10").append( $divbase );
// 		var $Yval = 
// 			if(${maxLocation.Ylocation%maxLocation.Xlocation eq 0}){return 0}
// 		else if(${maxLocation.Ylocation%maxLocation.Xlocation eq 1}){return 1}
// 		else if(${maxLocation.Ylocation%maxLocation.Xlocation eq 2}){return 2}
// 		else if(${maxLocation.Ylocation%maxLocation.Xlocation eq 3}){return 3};
	
		var i =1 ; 
		var j =1 ;
		var cardNo = 1 ;
		
		for(i; i< ${maxLocation.Xlocation}+1; i++){

			var $div = $("<div>").attr("id", "div"+i).text("test")
			.css("width", ${99/maxLocation.Xlocation }+"%")
			.css("height", "100%")
			.css("float", "left")
			.css("border", "1px solid white")
			.css("margin-top", "5px");
			$("#divbase").append( $div);
			
			 
			for( j=1; j<${maxLocation.Ylocation}+1; j++){
			var $card = $("<div>").attr("id", "card"+cardNo ).text("card"+cardNo);
			
				
			cardNo++;
			}
		};
		
	});
</script>