<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="panel">
	<div class="body">
		<div class="infomationWith col col-9">프로젝트</div>
		<div class=infomation col col-3">
			<ul id="tab_1" class="tab top">
				<li><a href="/admin/project/chart">차트</a></li>
				<li><a href="/admin/project/text">텍스트</a></li>
			</ul>
		</div>
	</div>

	<div class="body forDisplay-body-first" >
			<div class="forDisplay-body-second row">
				<div class="blackBox inline-block w-5">
					기간
				</div>

				<input type="date" class="color-date input w-15"/>
				<input type="date" class="color-date input w-15"/>
				
				<div class="inline-block w-15">
					<a class="btn mini focus">
						오늘
					</a> 
					<a class="btn mini focus">일주일</a> 
					<a class="btn mini focus">한 달</a>				
				</div>	

				<div id="combo_1" class="combo inline-block w-20">
					
					<a class="btn small forSizing-btn-first">Select...</a>
					<a class="btn small toggle"><i class="icon-arrow2"></i></a>
					<ul>
						<li value="1">프로젝트 명</li>
						<li value="2">프로젝트 key</li>
						<li value="3">프로젝트 상태</li>
					</ul>
				
				</div>
				<div class="inline-block w-20">
					<input type="text" class="forSizing-input input"/>
			
					<button class="btn small focus"
						onclick="alert(combo_1.getText())">검색</button>
				</div>
			</div>
	</div>
	

	<div class="body">
		<div class="row">
			<div class="col col-12">
				<div class="infoBox col col-3">
					<div class="boxWrapper">
						<div class="numBox">
							${cntList[0] }
						</div>
						<div>총 프로젝트</div>
					</div>
				</div>

				<div class="infoBox col col-3">
					<div class="boxWrapper">
						<div class="numBox">
							${cntList[1] }
						</div>
						<div>신규 프로젝트</div>
					</div>
				</div>

				<div class="infoBox col col-3">
					<div class="boxWrapper">
						<div class="numBox">
							${cntList[2] }
						</div>
						<div>진행  프로젝트</div>
					</div>
					
				</div>

				<div class="infoBox col col-3">
					<div class="boxWrapper">
						<div class="numBox">
							${cntList[3] }
						</div>
						<div>완료된 프로젝트</div>
					</div>
				</div>
			</div>
		</div>
		<!-- row 끝 -->
	</div>
	<!-- body 끝 -->

	<div class="body forSizing-chart">
		<div class="row">
			<div class="test col col-12">
				<div class="chartBox col col-5" id="chart"></div>
				<div class="chartBox col col-5"></div>
			</div>
		</div>
	</div>

</div>
<script>
	jui.ready([ "ui.combo" ], function(combo) {
		combo_1 = combo("#combo_1",
				{
					index : 2,
					event : {
						change : function(data) {
							alert("text(" + data.text + "), value("
									+ data.value + ")");
						}
					}
				});
	});
	
	jui.define("chart.brush.simplescatter", [], function() {
	    var SimpleScatterBrush = function() { 
	        this.draw = function() {
	            var g = this.chart.svg.group(),
	                data = this.axis.data,
	                keys = this.brush.target;
	            
	            for(var i = 0; i < data.length; i++) {
	                for(var j = 0; j < keys.length; j++) {
	                    var value = data[i][keys[j]];
	                    
	                    g.append(this.chart.svg.circle({
	                        fill : this.color(i, j),
	                        r : 5,
	                        cx : this.axis.x(i),
	                        cy : this.axis.y(value)
	                    }));
	                }
	            }
	            
	            return g;
	        }
	    }
	    
	    return SimpleScatterBrush;
	}, "chart.brush.core");
	
	jui.ready([ "chart.builder" ], function(builder) {
	    builder("#chart", {
	        width : 680,
	        height : 400,
	        axis : [{
	            x : {
	                type : "block",
	                domain : "key"
	            },
	            y : {
	                type : "range",
	                domain : [ 0, 50 ]
	            },
	            data : [
	                { key: "Q1", value1: 10, value2: 30 },
	                { key: "Q2", value1: 15, value2: 20 },
	                { key: "Q3", value1: 30, value2: 15 },
	                { key: "Q4", value1: 20, value2: 40 }
	            ]
	        }],
	        brush : [{
	            type : "simplescatter",
	            target : [ "value1", "value2" ]
	        }]
	    });
	});
</script>


</body>
</html>