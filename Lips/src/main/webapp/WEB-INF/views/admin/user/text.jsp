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
			   	<div class="infomationWith col col-9">사용자</div>
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
								200
							</div>
						<div>
								총 사용자
						</div>
						</div>
					</div>
					
					<div class="infoBox col col-3">
						<div class="boxWrapper">
							<div class="numBox">
								20
							</div>
						<div>
								신규 사용자
						</div>
						</div>
					</div>
			
					<div class="infoBox col col-3">
						<div class="boxWrapper">
							<div class="numBox">
								12
							</div>
						<div>
								탈퇴한 사용자
						</div>
						</div>
					</div>
			
					<div class="infoBox col col-3">
						<div class="boxWrapper">
							<div class="numBox">
								35
							</div>
						<div>
								프로젝트 생성자
						</div>
						</div>
					</div>	
				</div>	
			</div> <!-- row 끝 -->
		</div>	<!-- body 끝 -->
		
		<div class="body">
			<div class="row">
				
			<table class="table classic stripe">
			<thead>
				<tr>
					<th>회원 No.</th><th>갱신 일자</th><th>상태</th><th>진행 상황</th><th>프로젝트 리더</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>회원 No.</td><td>갱신 일자</td><td>상태</td><td>프로젝트 진행 여부</td><td>사용자 이름</td>
				</tr>
				<tr>
					<td>회원 No.</td><td>갱신 일자</td><td>상태</td><td>프로젝트 진행 여부</td><td>사용자 이름</td>
				</tr>
				<tr>
					<td>회원 No.</td><td>갱신 일자</td><td>상태</td><td>프로젝트 진행 여부</td><td>사용자 이름</td>
				</tr>
			</tbody>
		</table>
			
			</div>	
		</div>
		
		<div class="body">
			<div class="row">
				<div class="paging alignCenter" style="width: 1200px;">
					<a href="#" class="prev">Previous</a>
						<div class="list">
							<a href="#">1</a>
							<a href="#" class="active">2</a>
							<a href="#">3</a>
							<a href="#">4</a>
							<a href="#">5</a>
						</div>
				<a href="#" class="next">Next</a>
				</div>	
			</div>
		</div>
		
		
		
	</div>	
</div>	



</body>
</html>