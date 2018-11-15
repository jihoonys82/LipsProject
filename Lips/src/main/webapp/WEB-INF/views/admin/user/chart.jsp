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

		<div class="body">
			<div class="row">
				<div class="col col-12">
					<div class="infoBox col col-4">
						<div class="boxWrapper">
							<div class="numBox">
								${cntList[0] }
							</div>
						<div>
								총 사용자
						</div>
						</div>
					</div>
					
					<div class="infoBox col col-4">
						<div class="boxWrapper">
							<div class="numBox">
								${cntList[1] }
							</div>
						<div>
								신규 사용자
						</div>
						</div>
					</div>
			
					<div class="infoBox col col-4">
						<div class="boxWrapper">
							<div class="numBox">
								${cntList[2] }
							</div>
						<div>
								탈퇴한 사용자
						</div>
						</div>
					</div>
				
				</div>	
			</div> <!-- row 끝 -->
		</div>	<!-- body 끝 -->
		
		<div class="body forSizing-chart">
		<div class="row">
			<div class="test col col-12">
				<div class="chartBox col col-5" id="multi" style="width: 50%;border: none;"></div>
				<div class="chartBox col col-5" id="pie" style="width: 50%;border: none;"></div>
			</div>
		</div>
	</div>
		
		
	</div>	

<script>
	
   	var arr = ${chart.data};
   	var closeArr = ${chart.closeData};
   	
   	//-------------아래는 테스트용 배열 생성------------
// 	var closeArr = [];
//    	for (var i = 0 ; i<arr.length;i++){
//    		closeArr.push(i);
//    	}
//-----------------------------------------------

	var multiNames = {
   			NEWUSER : "신규  유저",
   			CLOSEUSER	: "탈퇴 유저"
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
	
	for(var i = 0 ; i<arr.length; i++){
		arr[i]["CLOSEUSER"] = closeArr[i].CLOSEUSER;
		data.push(arr[i]);
	}
	
	multiChart("#multi", {
		width : 500,
		height : 385,
	    axis : [{
	        x : {
	            type : "block",
	            domain : "DMONTH",
	            line : true
	        },
	        y : {
	            type : "range",
	            domain : function(d) { return [d.NEWUSER, d.CLOSEUSER]; },
	            step : 5,
	            line : true,
	            orient : "left",
	        },
	        data :  data
	    }],
	    brush : {
	        type : "column",
	        target : [ "NEWUSER","CLOSEUSER" ],
			colors : ["#881600","#CBFF8C"]
	    },
	    widget : [
	    	{ type : "title", text : "월별 사용자 변동사항" },
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
	var pieArr = ${chart.pieChart};
	var pieData = {};
	var pieName = [{name : "newAcc"},{name : "closedAcc"}];
	var pieArrData = [];
	var pieSum = 0;
	for(var i = 0;i<pieArr.length;i++){
		pieSum +=pieArr[i];
	}
	for(var i = 0;i<pieArr.length;i++){
		pieData[pieName[i].name] = Math.round((pieArr[i]/pieSum)*100);
	}
		pieArrData.push(pieData);
	
	var names = {
	    closedAcc : "탈퇴한 사용자",
	    newAcc: "신규 사용자"
	};

	pieChart("#pie", {
	    padding : 50,
		width : 500,
		height : 385,
	    axis : {
	        data : pieArrData
	    },
	    brush : {
	        type : "pie",
	        showText : "inside",
	        format : function(k, v) {
	            return v + "%";
	        },
			colors : ["#96648F","#FF9896"]
	    },
	    widget : [{
	        type : "title",
	        text : "이번 달 사용자 현황"
	    }, {
	        type : "tooltip",
	        orient : "left",
	        format : function(data, k) {
	            return {
	                key: names[k],
	                value: data[k]
	            }
	        }
	    }, {
	        type : "legend",
	        format : function(k) {
	            return names[k];
	        }
	    }]
	});
	
</script>


</body>
</html>