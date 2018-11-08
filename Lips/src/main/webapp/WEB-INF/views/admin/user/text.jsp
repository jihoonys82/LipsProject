<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
   

	<div class="panel">
		<div class="body">
			   	<div class="infomationWith col col-9">사용자</div>
			   	  	<div class=infomation col col-3"> 
   						<ul id="tab_1" class="tab top"> 
    						 <li><a href="/admin/user/chart">차트</a></li> 
  		       				<li><a href="/admin/user/text">텍스트</a></li> 
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
						<option value="userid">userid</option>
						<option value="usernick">usernick</option>
					</select>
				</div>

				<div class="inline-block" id="ComboChangeInput">
					<input id="comboInput" type="text" class="forSizing-input input" placeholder="입력하세용" />
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
								총 사용자
						</div>
						</div>
					</div>
					
					<div class="infoBox col col-3">
						<div class="boxWrapper">
							<div class="numBox">
								${cntList[1] }
							</div>
						<div>
								신규 사용자
						</div>
						</div>
					</div>
			
					<div class="infoBox col col-3">
						<div class="boxWrapper">
							<div class="numBox">
								${cntList[2] }
							</div>
						<div>
								탈퇴한 사용자
						</div>
						</div>
					</div>
			
					<div class="infoBox col col-3">
						<div class="boxWrapper">
							<div class="numBox">
								${cntList[3] }
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
			<div class="forSizing-uTable">

			<table class="table classic stripe">
				<thead>
					<tr>
						<th>ID</th>
						<th>닉네임</th>
						<th>가입일</th>
						<th>상태</th>
						<th>프로젝트 리더</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${uList }" var="uList" varStatus="i" >
						<tr class="text-center">
							<td>${uList.userId }</td>
							<td>${uList.nick }</td>
							<td><fmt:formatDate value="${uList.createDate}" pattern="yyyy-MM-dd" /></td>
							<c:if test="${uList.blocked eq 0 && uList.userLevel > 1}">						
								<td>관리자</td>
							</c:if>
							<c:if test="${uList.blocked eq 0 && uList.userLevel eq 1 }">						
								<td>가입</td>
							</c:if>
							<c:if test="${uList.blocked eq 0 && uList.userLevel eq 0}">
								<td>탈퇴</td>
							</c:if>
							<c:if test="${uList.blocked eq 1 && uList.userLevel eq 0}">
								<td>강제 탈퇴</td>
							</c:if>
							<c:if test="${uLeaderList[i.index] eq true}">
								<td><i class="icon-pin"></i></td>
							</c:if>
							<c:if test="${uLeaderList[i.index] eq false}">
								<td></td>
							</c:if>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div class="forSizing-uPaging">
				<div style="display: block; text-align: center;">
					<div class="paging" style="width: 350px;">
						<a href="/admin/user/text?curPage=${paging.curPage-1}" class="prev" style="display: block;">Previous</a>
						<div class="list">
								<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="page">
									<c:if test="${paging.curPage eq page }">
										<a href="/admin/user/text?curPage=${page }" class="active">${page }
									</c:if>
									<c:if test="${paging.curPage ne page }">
										<a href="/admin/user/text?curPage=${page}">${page }
									</c:if>
										</a>
							</c:forEach>
						</div>
						<a href="/admin/user/text?curPage=${paging.curPage+1 }" class="next">Next</a>
					</div>
				</div>
			</div>

		</div>
	</div>
		
</div>	
<form hidden="true" action="/admin/user/text" method="Post" id="indexform"></form>

<script type="text/javascript">



 	$(document).ready(function(){ 
 		
 		$("#comboOption").on("change", function() {
		});

 		$("table").on("click", "tr", function() { 
 			var userId = $(this).children("td").eq(0).text(); 
  			
 			$(location).attr("href","/admin/user/view?userId="+userId); 
   		}); 
  	});
 	
	//검색 버튼 function
	var index =	function(){
  		var $startdate = $("#startdate").val();
		var $enddate = $("#enddate").val();
		var $combodata = $("#comboOption").val();
		var $inputValue = $("#comboInput").val(); 
	
		var dataCollection = new Object();
		var indexList = new Array();
		
		dataCollection.startdate = $startdate;
		dataCollection.enddate = $enddate;
		dataCollection.combodata = $combodata;
		dataCollection.inputValue = $inputValue;
		
		indexList.push(dataCollection);
		
		var indexData = JSON.stringify(indexList);
		
		var $indexInput = $("<input>").attr("name", "indexData").attr("value", indexData);
		$("#indexform").append($indexInput);

		$("#indexform").submit();
			
		}
</script>

</body>
</html>