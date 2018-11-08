<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="panel">
	<div class="body">
		<div class="infomationWith col col-9">프로젝트</div>
		<div class=infomation col col-3">
			<ul id="tab_1" class="tab top">
				<li><a href="/admin/project/chart">차트</a></li>
				<li><a href="/admin/project/text">텍스트</a></li>
				<li>${chart.data}</li>
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
<!-- 						<li value="1">프로젝트 명</li> -->
<!-- 						<li value="2">프로젝트 key</li> -->
<!-- 						<li value="3">프로젝트 상태</li> -->
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
				<div class="chartBox col col-5" id="multi"></div>
				<div class="chartBox col col-5" id="pie"></div>
			</div>
		</div>
	</div>

</div>

<script>
var arr = ${chart.newP};
var arr2 = ${chart.closedP};
var arr3 = ${chart.overP};

console.log("arr3[0] : " + arr3[0]);
// 종료된 프로젝트 추가하기 

var multiNames = {
		NEWPROJECT : "신규 프로젝트",
		CLOSEPROJECT : "종료 프로젝트",
		OVERDUEPROJECT : "종료일이 지난 프로젝트"
};

var multiChart = jui.include("chart.builder");
var data = [];
var data2 = [];
var data3 = [];
var data4 = [];

for(var i = arr.length-5; i<arr.length; i++) {
	data.push(arr[i]);
}

for(var i = arr2.length-5; i<arr2.length; i++) {
	data.push(arr2[i]);
}

for(var i = 0; i<arr3.length; i++) {
	data3.push(arr3[i]);
}


console.log("data3 :  " + data3);
console.log("data3[0] : " + data3[0]);
console.log("data[4].CLOSEPROJECT : " + data[4].CLOSEPROJECT);
// console.log("data[4].NEWPROJECT : " + )
// console.log("data3[3].CLOSEPROJECT : " + data3[0].QUARTER);

var data2 = [
    { QUARTER : data[0].QUARTER, NEWPROJECT : data[0].NEWPROJECT, CLOSEPROJECT : data[5].CLOSEPROJECT},
    { QUARTER : data[1].QUARTER, NEWPROJECT : data[1].NEWPROJECT, CLOSEPROJECT : data[6].CLOSEPROJECT},
    { QUARTER : data[2].QUARTER, NEWPROJECT : data[2].NEWPROJECT, CLOSEPROJECT : data[7].CLOSEPROJECT},
    { QUARTER : data[3].QUARTER, NEWPROJECT : data[3].NEWPROJECT, CLOSEPROJECT : data[8].CLOSEPROJECT}
];

var data4 = [
	{ QUARTER : data[0].QUARTER, OVERDUEPROJECT : data3[0].OVERDUEPROJECT},
	{ QUARTER : data[1].QUARTER, OVERDUEPROJECT : data3[1].OVERDUEPROJECT},
	{ QUARTER : data[2].QUARTER, OVERDUEPROJECT : data3[2].OVERDUEPROJECT},
	{ QUARTER : data[3].QUARTER, OVERDUEPROJECT : data3[3].OVERDUEPROJECT}
];



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
            domain : function(d) { return [Math.max(d.NEWPROJECT), Math.max(d.CLOSEPROJECT)]; },
            step : 5,
            line : true,
            orient : "left"
        },
        data : data2
        
    }, {
    	x : {
    		type : "block",
    		domain : "QUARTER",
    		line : true
    	}, 
    	y : {
    		type : "range",
    	    domain : function(d) {
            	return Math.max(d.OVERDUEPROJECT);
            },
            orient : "right"
    		
    	},
    	data : data4
    	,extend : 0
    }],
    brush : [
    	{ type : "column", target : [ "NEWPROJECT", "CLOSEPROJECT" ],  colors : [ 2, "#DEC2FF" ] },
    	{ type : "line", target : "OVERDUEPROJECT", axis : 1, colors : [ "#A397E6" ] , symbol : "curve" },
    ],
    widget : [
    	{ type : "title", text : "Column Sample" },
        { type : "tooltip",
	      format : function(data2, k) {
		       return {
		            key: multiNames[k],
		            value: data2[k]
		            }
		        }		
        },
    	{ type : "legend",
        	  brush : [0,1],
		      format : function(k) {
		          return multiNames[k];
		       }

    	}
    ]
});

var pieChart = jui.include("chart.builder");
var names = {
    ie: "IE",
    ff: "Fire Fox",
    chrome: "Chrome",
    safari: "Safari",
    other: "Others"
};

pieChart("#pie", {
	width : 500,
	height : 400,
    padding : 50,
    axis : {
        data : [
            { ie : 70, ff : 11, chrome : 9, safari : 6, other : 4 }
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