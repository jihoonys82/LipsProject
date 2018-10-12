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
			<a href=""><span class="nav-label">대시보드</span></a>		
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
	<div class="panel">
		<div class="body">
			   	<div class="infomationWith col col-9">프로젝트</div>
			   	  	<div class=infomation col col-3"> 
   						<ul id="tab_1" class="tab top"> 
    						 <li><a href="#chart">차트</a></li> 
  		       				<li><a href="#text">텍스트</a></li> 
 						</ul>
   					</div> 
		</div>
		
		<div class="body">
			<div class="blackBox col col-1">기간</div>
     				<div class="whiteBox col col-1"> 
   						2018-10-12 
   					</div> 
<!-- '-' 넣기 --> 
  					<div class="whiteBox col col-1"> 
   						2018-10-24
   					</div> 
   					
   					<a class="btn mini focus">오늘</a>
  					<a class="btn mini focus">일주일</a>
  					<a class="btn mini focus">한 달</a>
  					
<!--   				 	<div class="dropdown" style="margin-left: -15px;"> -->
<!--             	       	  <ul style="width: 120px;"> -->
<!-- 			                <li value="1">Dropdown 1</li> -->
<!-- 			                <li value="2">Dropdown 2</li> -->
<!-- 			                <li value="3">Dropdown 3</li> -->
<!-- 			                <li value="4">Dropdown 4</li> -->
<!-- 			            </ul> -->
<!--   			      </div> -->
  					
		</div>
		
		<div class="body">
			<div class="row">
				<div class="col col-12">
					<div class="infoBox col col-3">
						<div class="boxWrapper">
							<div class="numBox">
								45
							</div>
						<div>
								총 프로젝트
						</div>
						</div>
					</div>
					
					<div class="infoBox col col-3">
						<div class="boxWrapper">
							<div class="numBox">
								3
							</div>
						<div>
								신규 프로젝트
						</div>
						</div>
					</div>
			
					<div class="infoBox col col-3">
						<div class="boxWrapper">
							<div class="numBox">
								12
							</div>
						<div>
								완료된 프로젝트
						</div>
						</div>
					</div>
			
					<div class="infoBox col col-3">
						<div class="boxWrapper">
							<div class="numBox">
								2
							</div>
						<div>
								중단된 프로젝트
						</div>
						</div>
					</div>	
				</div>	
			</div> <!-- row 끝 -->
		</div>	<!-- body 끝 -->
		
		<div class="body">
			<div class="row">
			<div class="test col col-12">
			<div class="chartBox col col-5" id="result">
				
			</div>
			<div class="chartBox col col-5">
				chart
			</div>
			</div>
			</div>
		</div>
		
		
	</div>	

</div>	



</body>
</html>