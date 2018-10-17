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
			<div class="test col col-12">
			<div class="chartBox col col-5" id="result">
				
			</div>
			<div class="chartBox col col-5">
				
				
			</div>
			</div>
			</div>
		</div>
		
			<div class="dropdown" style="display: block;">
			<ul style="width: 150px">
				<li><i class="icon-refresh"></i> Combo Box1</li>
				<li class="divider"></li>
				<li>Combo Box2</li>
				<li>Combo Box3</li>
				<li>Combo Box4</li>
			</ul>
		</div>
		
		</div>
		
		
<!-- 	</div>	 -->

<!-- </div>	 -->



</body>
</html>