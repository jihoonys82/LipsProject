<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        

	<div class="panel">
		<div class="body">
			   	<div class="infomationWith col col-9">프로젝트</div>
			   	  	<div class=infomation col col-3"> 
   						<ul id="tab_1" class="tab top"> 
    						 <li><a href="/admin/project/chart">차트</a></li> 
  		       				<li><a href="/admin/project/text">텍스트</a></li> 
 						</ul>
   					</div> 
		</div>
		
		<div class="body">
			<div class="blackBox col col-1">기간</div>
     				<div class="whiteBox col col-1"> 
   						2018-10-12 
   					</div> 
 
  					<div class="whiteBox col col-1"> 
   						2018-10-24
   					</div> 
   					
   					<a class="btn mini focus">오늘</a>
  					<a class="btn mini focus">일주일</a>
  					<a class="btn mini focus">한 달</a>

  					
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
			<div class="forSizing-uTable">
				
			<table class="table classic stripe">
			<thead>
				<tr>
					<th>프로젝트 No.</th><th>진행 일자</th><th>프로젝트 유형</th><th>진행 상황</th><th>프로젝트 리더</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pList }" var="pList">
					<tr class="text-center">
						<td>${pList.projectId }</td>
						<td>${pList.projectName }</td>
						<td>${pList.status }</td>
						<td>${pList.projectLeader }</td>
						<td>${pList.projectCreater }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

			<div class="forSizing-pPaging">
				<div style="display: block; text-align: center;">
					<div class="paging" style="width: 350px;">
						<a href="#" class="prev" style="display: block;">Previous</a>
						<div class="list">
							<a href="#">1</a> <a href="#" class="active">2</a> <a href="#">3</a>
							<a href="#">4</a> <a href="#">5</a>
						</div>
						<a href="#" class="next">Next</a>
					</div>
				</div>
			</div>

		</div>	
	</div>
		
		
		
		
</div>	

					
</body>
</html>