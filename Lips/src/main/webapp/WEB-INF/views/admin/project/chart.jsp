<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="panel">
	<div class="body">
		<div class="infomationWith col col-9">프로젝트</div>
		<div class=infomation col col-3">
			<ul id="tab_1" class="tab top">
				<li><a href="/admin/project/chart">차트</a></li>
				<li><a href="/admin/project/text">텍스트</a></li>
				<li><a href="/admin/project/category">카테고리</a></li>
			</ul>
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
				<div class="chartBox col col-5" id="multi" style="width: 50%;border: none;"></div>
				<div class="chartBox col col-5" id="pie" style="width: 50%;border: none;"></div>
			</div>
		</div>
	</div>

</div>

<script>
var newArr = ${chart.newP};
var closeArr = ${chart.closedP};
var overArr = ${chart.overP};

var multiNames = {
		NEWPROJECT : "신규 프로젝트",
		CLOSEPROJECT : "종료 프로젝트",
		OVERDUEPROJECT : "종료일이 지난 프로젝트"
};

var multiChart = jui.include("chart.builder");
var data = [];
var data3 = [];

for(var i = 0; i<newArr.length; i++) {
// 	if(closeArr[i] == null){
// 		closeArr[i] = 0;
// 	}
	newArr[i]["CLOSEPROJECT"] = closeArr[i].CLOSEPROJECT;
	data.push(newArr[i]);	
}

for(var i = 0; i<overArr.length; i++) {
	data3.push(overArr[i]);
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
            domain : function(d) { return [d.NEWPROJECT, d.CLOSEPROJECT] },
            step : 5,
            line : true,
            orient : "left"
        },
        data : data
    }, {
    	x : {
    		type : "block",
    		line : true
    	}, 
    	y : {
    		type : "range",
    	    domain : function(d) {
            	return [d.OVERDUEPROJECT];
            },
            orient : "right"
    		
    	},
    	data : data3
    	,extend : 0
    }],
    brush : [
    	{ type : "column", target : [ "NEWPROJECT", "CLOSEPROJECT" ],  colors : [ "#C67017", "#CFFF96" ] },
    	{ type : "line", target : "OVERDUEPROJECT", axis : 1, colors : [ "#E5E577" ] },
    ],
    widget : [
    	{ type : "title", text : "월별 프로젝트 변동사항" },
        { type : "tooltip",
	      format : function(data, k) {
		       return {
		            key: multiNames[k],
		            value: data[k]
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
var pieArr = ${chart.pieChart};
var pieData = {};
var pieName = [{name : "overdue"},{name : "done"},{name : "ing"}];
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
    ing : "진행중",
    done : "진행완료",
    overdue : "만료"
};

pieChart("#pie", {
	width : 500,
	height : 385,
    padding : 50,
    axis : {
        data : pieArrData
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
        text : "이번 달 프로젝트 진행상황"
    }, {
        type : "tooltip",
        orient : "left",
        format : function(data, k) {
            return {
                key: names[k],
                value: data[k] + "%"
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