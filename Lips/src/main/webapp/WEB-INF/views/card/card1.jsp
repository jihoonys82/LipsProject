<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div style="margin: 3px; display:flex; align-items:center;">
	<div id="datepicker_4" class="calendar">
	    <div class="head" style="hight:30px;">  
	        <div class="prev"><i class="icon-chevron-left"></i></div>
	        <div class="title"></div>
	        <div class="next"><i class="icon-chevron-right"></i></div>
	    </div>
	    <table class="body">
	        <tr>
	            <th>SUN</th><th>MON</th><th>TUE</th><th>WED</th><th>THU</th><th>FRI</th><th>SAT</th>
	        </tr>
	    </table>
	</div>
	
	<script id="tpl_date" type="text/template">
    <td>
    <! if(type != "none") { !>
        <! if(day == 0) { !>
        <span style="color: red;"><!= date !></span>
        <! } else if(day == 6) { !>
        <span style="color: blue;"><!= date !></span>
        <! } else { !>
        <span><!= date !></span>
        <! } !>
    <! } !>
    </td>
	</script>
	<script>
	jui.ready([ "ui.datepicker" ], function(datepicker) {
	    datepicker_4 = datepicker("#datepicker_4", {
	        titleFormat: "yyyy. MM",
	        format: "yyyy-MM-dd",
	        event: {
	            select: function(date, e) {
	                alert(date);
	            }
	        },
	        tpl: {
	            date: $("#tpl_date").html()
	        }
	    });
	});
	</script>
</div>
