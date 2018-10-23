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
		
	<div class="body forDisplay-body-first" >
			<div class="forDisplay-body-second row">
				<div class="blackBox col col-1">
					기간
				</div>

				<input type="date" class="col col-2 color-date input"/>
				<input type="date" class="col col-2 color-date input"/>
				
				<div class="col col-2" style="vertical-align: baseline;" >
					<a class="btn mini focus">
						오늘
					</a> 
					<a class="btn mini focus">일주일</a> 
					<a class="btn mini focus">한 달</a>				
				</div>	

				<div id="combo_1" class="combo col col-2">
					
					<a class="btn small forSizing-btn-first">Select...</a>
					<a class="btn small toggle"><i class="icon-arrow2"></i></a>
					<ul>
						<li value="1">프로젝트 명</li>
						<li value="2">프로젝트 key</li>
						<li value="3">프로젝트 상태</li>
					</ul>
				
				</div>
				<div class="col col-2">
					<input type="text" class="forSizing-input input"/>
			
					<button class="btn small focus"
						onclick="alert(combo_1.getText())">검색</button>
				</div>
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
						<div>
								총 프로젝트
						</div>
						</div>
					</div>
					
					<div class="infoBox col col-3">
						<div class="boxWrapper">
							<div class="numBox">
								${cntList[1] }
							</div>
						<div>
								신규 프로젝트
						</div>
						</div>
					</div>
			
					<div class="infoBox col col-3">
						<div class="boxWrapper">
							<div class="numBox">
								${cntList[2] }
							</div>
						<div>
								진행 프로젝트
						</div>
						</div>
					</div>
			
					<div class="infoBox col col-3">
						<div class="boxWrapper">
							<div class="numBox">
								${cntList[3] }
							</div>
						<div>
								완료된 프로젝트
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
					<th>프로젝트 No.</th><th>프로젝트 이름</th><th>진행 상황</th><th>공개 여부</th><th>프로젝트 리더</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pList }" var="pList">
					<tr class="text-center">
						<td>${pList.projectId }</td>
						<td>${pList.projectName }</td>
						<c:choose>
							<c:when test="${pList.status eq 'OPEN'}">
								<td>진행 중</td>
							</c:when>
							<c:when test="${pList.status eq 'PENDING'}">
								<td>중단</td>
							</c:when>
							<c:when test="${pList.status eq 'CLOSE'}">
								<td>완료</td>
							</c:when>
							<c:otherwise>
								<td>알 수 없음</td>
							</c:otherwise>
						</c:choose>

						<c:if test="${pList.projectOpen eq 1}">
								<td>공개</td>
						</c:if>
						<c:if test="${pList.projectOpen eq 0}">
								<td>비공개</td>
						</c:if>
						<td>${pList.projectLeader }</td>
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

<script type="text/javascript">
 	$(document).ready(function(){ 
  		
  		$("table").on("click", "tr", function() { 
 			var projectId = $(this).children("td").eq(0).text(); 
  			
 			$(location).attr("href","/admin/project/view?projectId="+projectId); 
   		}); 
  		
   	});

</script>	

					
</body>
</html>