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
				<div class="blackBox inline-block w-5">기간</div>

				<input id="startdate" type="date" class="color-date input w-15"/>
				<input id="enddate" type="date" class="color-date input w-15"/>
				
				<div class="combo" style="margin-left: 10px;">
					검색 옵션 : <select id="comboOption" class="btn small toggle ">
						<option value="projectname" >projectname</option>
						<option value="projectkey">projectkey</option>
						<option value="status">status</option>
					</select>
				</div>

				<div class="inline-block" id="ComboChangeInput">
					<div id="statusCombo" hidden="true">
						<div class="combo"  style="margin-left: 10px;" >
						<select id="statusOption" class="btn small toggle ">
							<option value="OPEN">OPEN</option>
							<option value="PENDING">PENDING</option>
							<option value="CLOSE">CLOSE</option>
						</select> 
						</div>
					</div>

					<div id="othersCombo">
						<input id="comboInput" type="text" class="forSizing-input input" placeholder="입력하세용" />
					</div>
				</div>
				<button class="btn small focus" onclick="index()" style="float: right;">검색</button>
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
					<th>프로젝트 No.</th><th>프로젝트 이름</th><th>프로젝트 키</th><th>진행 상황</th><th>공개 여부</th><th>프로젝트 리더</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pList }" var="pList">
					<tr class="text-center">
						<td>${pList.projectId}</td>
						<td>${pList.projectName}</td>
						<td>${pList.projectKey}</td>
						<c:choose>
							<c:when test="${pList.status eq 'OPEN'}">
								<td>진행 중</td>
							</c:when>
							<c:when test="${pList.status eq 'PENDING'}">
								<td>중단</td>
							</c:when>
							<c:when test="${pList.status eq 'CLOSE'}">
								<td>종료</td>
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
						<a href="/admin/project/text?curPage=${paging.curPage-1}" class="prev" style="display: block;">Previous</a>
						<div class="list">
							<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="page">
								<c:if test="${paging.curPage eq page }">
								<a href="/admin/project/text?curPage=${page }" class="active">${page }
								</c:if>
								<c:if test="${paging.curPage ne page }">
								<a href="/admin/project/text?curPage=${page}">${page }
								</c:if>
								</a>
							</c:forEach>
						</div>
						<a href="/admin/project/text?curPage=${paging.curPage+1 }" class="next">Next</a>
					</div>
				</div>
			</div>

		</div>	
	</div>
</div>
<form hidden="true" action="/admin/project/text" method="Post" id="indexform"></form>

<script type="text/javascript">
	var statusOption = "OPEN";
	var comboOption = "projectname";


 	$(document).ready(function(){ 
 		
 		$("#comboOption").on("change", function() {
 			comboOption = $("#comboOption").val();
			combochangeF(comboOption);
		});
 		
 		$("#statusOption").on("change", function() {
 			statusOption = $("#statusOption").val();
		});
 	
 		var combochangeF = function(changedata){
 			if(changedata == "status"){
 				
 				$("#ComboChangeInput").children().hide();
 				$("#statusCombo").show()
 				
 			}else if(changedata == "projectname"){

 				$("#ComboChangeInput").children().hide();
 				$("#othersCombo").show()
 				
 			}else if(changedata == "projectkey"){
 			
 				$("#ComboChangeInput").children().hide();
 				$("#othersCombo").show()
 			}
 		}
 		
 		
  		$("table").on("click", "tr", function() { 
 			var projectId = $(this).children("td").eq(0).text(); 
  			
 			$(location).attr("href","/admin/project/view?projectId="+projectId); 
   		}); 
  	});
 	
	//검색 버튼 function
	var index =	function(){
  		var $startdate = $("#startdate").val();
		var $enddate = $("#enddate").val();
		var $combodata = comboOption; 

		if($combodata == "status"){
		var	$inputValue = statusOption;
		
		}else{
			
		var $inputValue = $("#comboInput").val(); 
		
		}
		console.log($inputValue);
		
		var dataCollection = new Object();
		var indexList = new Array();
		
		dataCollection.startdate = $startdate;
		dataCollection.enddate = $enddate;
		dataCollection.combodata = $combodata;
		dataCollection.inputValue = $inputValue;
		
		indexList.push(dataCollection);
		
		var indexData = JSON.stringify(indexList);
// 		console.log(indexData);
		
		var $indexInput = $("<input>").attr("name", "indexData").attr("value", indexData);
		$("#indexform").append($indexInput);

		$("#indexform").submit();
			
		}
</script>	

					
</body>
</html>