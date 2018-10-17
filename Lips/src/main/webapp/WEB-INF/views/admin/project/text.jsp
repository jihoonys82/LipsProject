<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>Insert title here</title> -->

<%-- <%@ include file="/WEB-INF/views/admin/cdn.jsp" %> --%>

<!-- </head> -->
<!-- <body class="jui"> -->
<%-- <%@ include file="/WEB-INF/views/admin/navbar.jsp" %> --%>

<!-- <div class="col col-10"> -->
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
				
			<table class="table classic stripe">
			<thead>
				<tr>
					<th>프로젝트 No.</th><th>진행 일자</th><th>프로젝트 유형</th><th>진행 상황</th><th>프로젝트 리더</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>프로젝트 No.</td><td>진행 일자</td><td>프로젝트 유형</td><td>진행 상황</td><td>프로젝트 리더</td>
				</tr>
				<tr>
					<td>프로젝트 No.</td><td>진행 일자</td><td>프로젝트 유형</td><td>진행 상황</td><td>프로젝트 리더</td>
				</tr>
				<tr>
					<td>프로젝트 No.</td><td>진행 일자</td><td>프로젝트 유형</td><td>진행 상황</td><td>프로젝트 리더</td>
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
<!-- </div>	 -->
					
</body>
</html>