<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
<div class="panel">
	<div class="body">
		<div class="infomationWith col col-9">사용자</div>
		<div class= infomation col col-3">
			<ul id="tab_1" class="tab top">
				<li><a href="/admin/user/chart">차트</a></li>
				<li><a href="/admin/user/text">텍스트</a></li>
			</ul>
		</div>
	</div>
		
<!-- 	<div class="body forDisplay-body-first" > -->
<!-- 			<div class="forDisplay-body-second row"> -->
<!-- 				<div class="blackBox inline-block w-5"> -->
<!-- 					기간 -->
<!-- 				</div> -->

<!-- 				<input type="date" class="color-date input w-15"/> -->
<!-- 				<input type="date" class="color-date input w-15"/> -->
				
<!-- 				<div class="inline-block w-15"> -->
<!-- 					<a class="btn mini focus"> -->
<!-- 						오늘 -->
<!-- 					</a>  -->
<!-- 					<a class="btn mini focus">일주일</a>  -->
<!-- 					<a class="btn mini focus">한 달</a>				 -->
<!-- 				</div>	 -->

<!-- 				<div id="combo_1" class="combo inline-block w-20"> -->
					
<!-- 					<a class="btn small forSizing-btn-first">Select...</a> -->
<!-- 					<a class="btn small toggle"><i class="icon-arrow2"></i></a> -->
<!-- 					<ul> -->
<!-- 						<li value="1">유저 아이디</li> -->
<!-- 						<li value="2">유저 닉네임</li> -->
<!-- 					</ul> -->
				
<!-- 				</div> -->
<!-- 				<div class="inline-block w-20"> -->
<!-- 					<input type="text" class="forSizing-input input"/> -->
			
<!-- 					<button class="btn small focus" -->
<!-- 						onclick="alert(combo_1.getText())">검색</button> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 	</div> -->
		
		<div class="body">
			<div class="row">
				<div class="col col-12">
					<div class="infoBox col col-3">
						<div class="boxWrapper">
							<div class="numBox">
								${cntList[0] }
							</div>
						<div>
								총 사용자
						</div>
						</div>
					</div>
					
					<div class="infoBox col col-3">
						<div class="boxWrapper">
							<div class="numBox">
								${cntList[1] }
							</div>
						<div>
								신규 사용자
						</div>
						</div>
					</div>
			
					<div class="infoBox col col-3">
						<div class="boxWrapper">
							<div class="numBox">
								${cntList[2] }
							</div>
						<div>
								탈퇴한 사용자
						</div>
						</div>
					</div>
			
					<div class="infoBox col col-3">
						<div class="boxWrapper">
							<div class="numBox">
								${allUserCnt }
							</div>
						<div>
								접속 중인 사용자
						</div>
						</div>
					</div>	
				</div>	
			</div> <!-- row 끝 -->
		</div>	<!-- body 끝 -->
		
		<div class="body forSizing-chart">
		<div class="row">
			<div class="test col col-12">
				<div class="chartBox col col-5" id="multi"></div>
				<div class="chartBox col col-5" id="pie"></div>
			</div>
		</div>
	</div>
		
		
	</div>	

<script>
	
   	var arr = ${chart.data};
   	var multiNames = {
   			NEWUSER : "신규 가입자"
   	};
   	
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
	
	var multiChart = jui.include("chart.builder");
	var data = [];
	
	for(var i = arr.length-5 ; i<arr.length; i++){
		data.push(arr[i]); 
	}
	
	multiChart("#multi", {
		width : 500,
		height : 400,
	    axis : [{
	        x : {
	            type : "block",
	            domain : "QUARTER",
	            line : true
	        },
	        y : {
	            type : "range",
	            domain : function(d) { return [d.NEWUSER]; },
	            step : 5,
	            line : true,
	            orient : "left",
	        },
	        data :  data
	    }],
	    brush : {
	        type : "column",
	        target : [ "NEWUSER" ]
	    },
	    widget : [
	    	{ type : "title", text : "Column Sample" },
	        { type : "tooltip", 
	          format : function(data, k) {
		           return {
		                key: multiNames[k],
		                value: data[k]
		            }
		        }	
	        },
	    	{ type : "legend",
		      format : function(k) {
		          return multiNames[k];
		       }	
	    	}
	    ]
	});
	
	var pieChart = jui.include("chart.builder");
	var pieNames = {
	    closedAcc : "탈퇴한 사용자",
	    newAcc: "신규 사용자",
	    pCreater: "프로젝트 생성자"
	};

	pieChart("#pie", {
	    padding : 150,
		width : 500,
		height : 400,
	    axis : {
	        data : [
	            { closedAcc : 40,
	            	newAcc : '${cntList[1]}', 
	            	pCreater : 6 }
	        ]
	    },
	    brush : {
	        type : "pie",
	        showText : "inside",
	        format : function(k, v) {
	            return v + "%";
	        }
	    },
	    widget : [{
	        type : "title",
	        text : "Pie Sample"
	    }, {
	        type : "tooltip",
	        orient : "left",
	        format : function(data, k) {
	            return {
	                key: pieNames[k],
	                value: data[k]
	            }
	        }
	    }, {
	        type : "legend",
	        format : function(k) {
	            return pieNames[k];
	        }
	    }]
	});
	
</script>


</body>
</html>