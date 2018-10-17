<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
var chart = jui.include("chart.builder");

chart("#result", {
    axis : {
        x : {
            type : "range",
            domain : [ -40, 60 ],
            step : 10,
            line : true
        },
        y : {
            type : "block",
            domain : "quarter",
            line : true
        },
        data : [
            { quarter : "1Q", sales : 50, profit : 35 },
            { quarter : "2Q", sales : -20, profit : -30 },
            { quarter : "3Q", sales : 10, profit : -5 },
            { quarter : "4Q", sales : 30, profit : 25 }
        ]
    },
    brush : {
        type : "bar",
        target : [ "sales", "profit"]
    },
    widget : [
        { type : "title", text : "Bar Sample" },
        { type : "tooltip", orient: "right" },
        { type : "legend" }
    ]
});
</script>

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
						<div class="numBox">1</div>
						<div id="sizing-first">프로젝트 참여인원</div>
					</div>
				</div>
				<div class="infoBox col col-4">
					<div class="boxWrapper">
						<div class="numBox">2</div>
						<div id="sizing-second">진행중인 프로젝트</div>
					</div>
				</div>
				<div class="infoBox col col-4">
					<div class="boxWrapper">
						<div class="numBox">5</div>
						<div>접속중인 인원</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 바디- 차트 -->
	<div class="body">
		<div class="row">
			<div class="test col col-12">
				<div class="chartBox col col-5" id="result"></div>
				<div class="chartBox col col-5">chart</div>
			</div>
		</div>
	</div>

</div>
</body>
</html>