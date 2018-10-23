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
	var lineValue 
	
	$("div.activityLog").empty();
	$(document).ready(function combobox(){ 
		jui.ready([ "ui.combo" ], function(combo) {
		    combo_1 = combo("#comboLine", {
		        index: 2,
		        event: {
		            change: function(data) {
		                alert("text(" + data.text + "), value(" + data.value + ")");
		            }
		        }
		    });
		});
	})
	
</script>