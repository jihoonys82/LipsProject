<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="clockmain" style="height: 300px; margin: 3px;">
</div>

<script>
$(document).ready(function(){ 
var clockdiv= $("<div>").attr("color","white").addClass("navbar")
						.attr("margin-top", "150px");

// .attr("height","300px").attr("margin","3px");
insertdiv();

function checkTime(i) {
    if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
    return i;
}
function insertdiv(){
	var dateline = $("<div>").attr("id","dateline").attr("width", "100%").attr("height", "50%").addClass("h1");
	var timeline = $("<div>").attr("id","timeline").attr("width", "100%").attr("height", "50%").addClass("h1");
	
	clockdiv.append(dateline);
	clockdiv.append(timeline);
	$("#clockmain").append(clockdiv);
	
	startDay();
	startTime();
}
function startDay(){
	clockdiv.children("#dateline").empty(); 
	
	 var today = new Date(); 
	    
	    var months = ["Jan", "Feb", "Marh", "Apr", "May", "June", "July", "Aug", "Sep", "Oct", "Nov", "Dec"];
	    var month = months[today.getMonth()];
	 
	    var dayNum = today.getDate();
	  	
	    var days = ["Sun", "Mon", "Tues", "Wed", "Thurs", "Fri", "Satur"];
	    var day = days[today.getDay()];
	    
	    clockdiv.children("#dateline").text(month+"  "+dayNum + " : " + day);
	    
	    var d = setTimeout(startDay, 60000);
}
function startTime() {
	
	clockdiv.children("#timeline").empty();
	
	 var today = new Date(); 
	 
    var h = today.getHours(); 
    var m = today.getMinutes(); 
    var s = today.getSeconds();
    m = checkTime(m);
    s = checkTime(s);
  	
	clockdiv.children("#timeline").text(h+ "H "+ m + "M " + s + "S " );
    
    var t = setTimeout(startTime, 500);

}


});
</script>