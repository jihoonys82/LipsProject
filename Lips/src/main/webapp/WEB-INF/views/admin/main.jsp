<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/admin.css" />

<!-- ### Stylesheet link here ### -->
<!-- Basic style components -->
<link rel="stylesheet" href="/resources/jui/dist/ui.min.css" />
<link rel="stylesheet" href="/resources/jui/dist/ui-dark.min.css" />
<link rel="stylesheet" href="/resources/jui/dist/grid.min.css" />
<link rel="stylesheet" href="/resources/jui/dist/grid-dark.min.css" />

<!-- project Default StyleSheet -->
<link rel="stylesheet" href="/resources/css/lips.css?ver=4"  />

<!-- ### Script Load here ### -->
<!-- Required script files -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="/resources/jui/dist/core.min.js"></script>
<script src="/resources/jui/dist/ui.min.js"></script>
<script src="/resources/jui/dist/grid.min.js"></script>

<script src="/resources/jui/dist/core.min.js"></script>
<script src="/resources/jui/dist/chart.min.js"></script>

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


</head>
<body class="jui">

<div class="navbar flat" style="overflow: hidden;">
	<div class="inline right">
		<span>admin 님 어서오세요</span>
	</div>
</div>

<nav class="col col-2">
	<div class="panel">
		<div class="body">
			<a href="#"><span class="nav-label">대시보드</span></a>		
		</div>
		<div class="body">	      
			<a href="#"><span class="nav-label">공지사항</span></a>
		</div>
		<div class="body">
	    	<a href="project/chart"><span class="nav-label">프로젝트</span></a>
		</div>
		<div class="body">
		     <a href="#"><span class="nav-label">사용자</span></a>
		</div>
		<div class="body">
		    <a href="#"><span class="nav-label">서비스</span></a>
		</div>
		<div class="body" style="min-height:30em;"></div>
	</div>
</nav>

<div class="col col-10">

  <div class="body-content">
  	<p class="br">
  	
<!-- 바디- 상단 상태바 -->
  		<div class="row">
  			<div class="infomation col col-12">대시보드</div>
  		</div>
  		
<!-- 바디- 인원체크 부분 -->  		
		<div class="row">
			<div class="infoBox col col-4">
				<div class="boxWrapper">
					<div class="numBox">
						1
					</div>
					<div>
						프로젝트 참여인원
					</div>
				</div>
			</div>
			<div class="infoBox col col-4">
				<div class="boxWrapper">
					<div class="numBox">
						2
					</div>
					<div>
						진행중인 프로젝트
					</div>
				</div>
			</div>
			<div class="infoBox col col-4">
				<div class="boxWrapper">
					<div class="numBox">
						5
					</div>
					<div>
						접속중인 인원
					</div>
				</div>
			</div>
		</div>
		
<!-- 바디- 차트 -->		
		<div class="row">
			<div class="test col col-12">
			<div class="chartBox col col-5" id="result">
				
			</div>
			<div class="chartBox col col-5">
				chart
			</div>
			</div>
		</div>
		
		
  	</p>
  </div>
</div>

<!-- Script link here  -->
<script type="text/javascript" src="/resources/js/lips.js"></script>
</body>
</html>