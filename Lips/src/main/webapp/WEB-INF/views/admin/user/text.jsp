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
		
	<div class="body forDisplay-body-first">
			<div class="forDisplay-body-second row">
				<div class="blackBox col col-1">
					기간
				</div>
				<input type="date" class="col col-2 color-date input"/>
				<input type="date" class="col col-2 color-date input"/>
				
				<div class="col col-2">
					<a class="btn mini focus margin-a">오늘</a> 
					<a class="btn mini focus">일주일</a> 
					<a class="btn mini focus">한 달</a>				
				</div>	

				<div id="combo_1" class="combo col col-2">
					
					<a class="btn small forSizing-btn-first">Select...</a>
					<a class="btn small toggle"><i class="icon-arrow2"></i></a>
					<ul>
						<li value="1">유저 아이디</li>
						<li value="2">유저 닉네임</li>
						<li value="3">강등된 유저</li>
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
								<td><i class="icon-checkbox"></i></td>
							</c:if>
							<c:if test="${uLeaderList[i.index] eq false}">
								<td><i class="icon-checkbox2"></i></td>
							</c:if>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div class="forSizing-uPaging">
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
 			var userId = $(this).children("td").eq(0).text(); 
  			
 			$(location).attr("href","/admin/user/view?userId="+userId); 
   		}); 
  		
   	});
 	
	jui.ready([ "ui.combo" ], function(combo) {
		combo_1 = combo("#combo_1",
				{
					index : 2,
					event : {
						change : function(data) {
							alert("text(" + data.text + "), value("
									+ data.value + ")");
						}
					}
				});
	});
</script>

</body>
</html>