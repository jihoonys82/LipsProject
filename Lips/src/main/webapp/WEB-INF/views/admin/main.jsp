<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<div class="panel">
			
<!-- 바디- 상단 상태바 -->
  		<div class="body">
  			<div class="infomation col col-12">대시보드</div>
  		</div>
  		
<!-- 바디- 인원체크 부분 -->
	<div class="body">
		<div class="row">
			<div class="col col-12">
				<div class="infoBox col col-4">
					<div class="boxWrapper">
						<div class="numBox">
							${cntList[0] }
						</div>
						<div id="sizing-first">프로젝트 참여인원</div>
					</div>
				</div>
				<div class="infoBox col col-4">
					<div class="boxWrapper">
						<div class="numBox">
							${cntList[1] }
						</div>
						<div id="sizing-second">진행중인 프로젝트</div>
					</div>
				</div>
				<div class="infoBox col col-4">
					<div class="boxWrapper">
						<div class="numBox">
							${cntList[2] }
						</div>
						<div>총 사용자</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 바디- 차트 -->
	<div class="body forSizing-mainChart">
		<div class="row">
			<div class="test col col-12">
				<div class="chartBox col col-5" id="proChart" style="width: 50%;border: none;"></div>
				<div class="chartBox col col-5" id="userChart" style="width: 50%;border: none;"></div>
			</div>
		</div>
	</div>

</div>

<script>
var arr = ${chart.pChart};
var arr2 = ${chart.uChart};

var proNames = {
		TOTALPROJECT : "총 프로젝트"		
};
var userNames = {
		TOTALUSER : "총 사용자"
};
	
var proChart = jui.include("chart.builder");
var userChart = jui.include("chart.builder");

var data = [];
var data2 = [];

var pTotal = 0;
var uTotal = 0;

for(var i = arr.length-5 ; i<arr.length; i++){
	pTotal += arr[i].TOTALPROJECT;
	arr[i]["TOTALPROJECT"] = pTotal;
	data.push(arr[i]);	
}

for(var j = arr2.length-5 ; j<arr2.length; j++){
	uTotal += arr2[j].TOTALUSER;
	arr2[j]["TOTALUSER"] = uTotal;
	data2.push(arr2[j]);	
}

// for(var j = arr2.length-5 ; j<arr2.length; j++){
// 	uTotal += arr2[i].TOTALUSER;
// 	arr2[i]["TOTALUSER"] = uTotal;
// 	data2.push(arr2[j]);
// }

proChart("#proChart", {
	width : 500,
	height : 400,
    axis : [{
        x : {
            type : "block",
            domain : "DMONTH",
            line : true
        },
        y : {
            type : "range",
            domain : function(d) { return [d.TOTALPROJECT]; },
            step : 5,
            line : true,
            orient : "left",
        },
        data :  data
    }],
    brush : {
        type : "column",
        target : "TOTALPROJECT",
        colors : ["#14313D"]
    },
    widget : [
    	{ type : "title", text : "월별 총 프로젝트" },
        { type : "tooltip", 
          format : function(data, k) {
	           return {
	                key: proNames[k],
	                value: data[k]
	            }
	        }	
        },
    	{ type : "legend",
	      format : function(k) {
	          return proNames[k];
	       }	
    	}
    ]
});

userChart("#userChart", {
	width : 500,
	height : 400,
    axis : [{
        x : {
            type : "block",
            line : true,
            domain : "DMONTH"
        },
        y : {
            type : "range",
            domain : function(d) { return [d.TOTALUSER]; },
            step : 5,
            line : true,
            orient : "left",
        },
        data :  data2
    }],
    brush : {
        type : "column",
        target : "TOTALUSER",
        colors : ["#4E0110"]
    },
    widget : [
    	{ type : "title", text : "월별 총 사용자" },
        { type : "tooltip", 
          format : function(data2, k) {
	           return {
	                key: userNames[k],
	                value: data2[k]
	            }
	        }	
        },
    	{ type : "legend",
	      format : function(k) {
	          return userNames[k];
	       }	
    	}
    ]
});

</script>

</body>
</html>