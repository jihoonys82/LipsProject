<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<script type="text/javascript" src="/resources/js/moment.min.js"></script>
    
	<div class="panel">
		<div class="body">
			<div class="viewProBox">
			<div class="row">
			
				<div class="col col-12">	
					
					<div class="viewTwinBox col col-5">
						<div class="infomation">프로젝트 정보</div>
							<div class="view-form-row">
							<label for="proName" class="view-form-label">프로젝트 명</label>
							<input type="text" name="proName" id="proName" class="input view-form-input" readonly="readonly"
								value="${proInfo.projectName }"/>
							</div>
							
							<div class="view-form-row">
							<label for="proNum" class="view-form-label">참여인원</label>
							<input type="text" name="proNum" id="proNum" class="input view-form-input" readonly="readonly"
								value="${pList[0] } 명" /> 
							</div>
									
							<div class="view-form-row">
							<label for="proProgress" class="view-form-label">진행 상황</label>
								<c:if test="${proInfo.status eq 'OPEN'}">
									<input type="text" name="proProgress" id="proProgress" class="input view-form-input" readonly="readonly"
										value="진행중"/> 
								</c:if>
								<c:if test="${proInfo.status eq 'PENDING'}">
									<input type="text" name="proProgress" id="proProgress" class="input view-form-input" readonly="readonly"
										value="중단"/> 
								</c:if>
								<c:if test="${proInfo.status eq 'CLOSE'}">
									<input type="text" name="proProgress" id="proProgress" class="input view-form-input" readonly="readonly"
										value="진행중"/> 
								</c:if>
							</div>

							<div class="view-form-row">
							<label for="proType" class="view-form-label">프로젝트 공개 여부</label>
								<c:if test="${proInfo.projectOpen eq 1}">
									<input type="text" name="proType" id="proType" class="input view-form-input" readonly="readonly"
										value="공개"/> 
								</c:if>
								<c:if test="${proInfo.projectOpen eq 0}">
									<input type="text" name="proType" id="proType" class="input view-form-input" readonly="readonly"
										value="비공개"/> 								
								</c:if>
							</div>				
													
							<div class="view-form-row">
							<label for="proIssue" class="view-form-label">등록된 이슈</label>
							<input type="text" name="proIssue" id="proIssue" class="input view-form-input" readonly="readonly"
								value="${pList[1] } 개"/> 
							</div>
							
							<div class="view-form-row">
							<label for="proOpenDate" class="view-form-label">프로젝트 개설일</label>
							<input type="text" name="proOpenDate" id="proOpenDate" class="input view-form-input" readonly="readonly"
								value="<fmt:formatDate value="${proInfo.createDate }" pattern="yyyy-MM-dd" />"/> 
							</div>
							
							<div class="view-form-row">
								<label for="proProDate" class="view-form-label">프로젝트 진행일</label>
								<input type="text" name="proProDate" id="proProDate" class="input view-form-input" readonly="readonly" />
							</div>
					</div>		
									
					<div class="viewTwinBox col col-5">
						<div class="infomation">참여인원 정보</div>
					
							<div class="view-form-row">
								<label for="userLeader" class="view-form-label">프로젝트 리더</label>
								<input type="text" name="userLeader" id="userLeader" class="input view-form-input" readonly="readonly"
									value="${proInfo.projectLeader }"/> 
							</div>
														
							<div class="view-form-row">
								<label for="userMember" class="view-form-label">프로젝트 멤버</label>
									<c:if test="${uPInfo[0].userId ne null}">
											<c:forEach items="${uPInfo}" var="uPInfo">
												<div>
													<ul>
													<li>
														<input type="text" name="userMember" id="userMember" class="input view-form-input" readonly="readonly"
															value="${uPInfo.userId }"/>
													</li>
													</ul>
												</div>
											</c:forEach> 								
									</c:if>
									<c:if test="${uPInfo[0].userId eq null}">
										<div>
											<input type="text" name="userMember" id="userMember" class="input view-form-input" readonly="readonly"
												value="참여멤버 없음"/>
										</div> 																
									</c:if>
							</div>
							
						<div class="forPaging">
							<div style="display:block; text-align:center;">
								<div class="paging" style="width:350px;">		
											<a href="#" class="prev" style="display:block;">Previous</a>
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
					</div> <!-- col col-5_ end  -->
										
				
				</div> <!-- col col-12_end -->
			</div>	<!-- row_end -->
			</div>
		</div>	<!-- body_end -->
		
		<div class="body">
			<div class=float-left>
				<i class="icon-return1"></i>
<!-- 				<a class="btn normal focus">뒤로 가기</a> -->
			</div>
		
			<div class="viewProBtn">
				<a class="btn normal focus">사용자에게 공지</a>
				<a class="btn normal focus">프로젝트 재개</a>
				<a class="btn normal focus">프로젝트 종료</a>		
			</div>
		</div>
		
		
	</div>	<!-- panel_end -->	
<!-- </div>	col col-10_end  -->

<script>
$(document).ready(function() {

	var cd = document.getElementById("proOpenDate");
		var cDate = new Date(cd.value	);
		var diff = moment(cDate).diff(moment());
		var absDiff = Math.abs(diff);
		var	diffDay		= Math.floor(absDiff / (60 * 60 * 1000 * 24) * 1)
		var	diffHour	= Math.floor((absDiff % (60 * 60 * 1000 * 24)) / (60 *60 * 1000) * 1)
		var	diffMin		= Math.floor(((absDiff % (60 * 60 * 1000 * 24)) % (60 * 60 * 1000)) / (60 * 1000) * 1)
		var remainTime 	= "";
		if(diffDay !=0) 	remainTime += diffDay+"일 ";
		if(diffHour !=0) 	remainTime += diffHour +"시간 ";
		remainTime += diffMin +"분 ";
		if(Math.sign(diff)<0) {
			remainTime +="경과"; 
		}
		else remainTime +="남음";
		document.getElementById("proProDate").value = remainTime;
	
});



</script>

	
</body>
</html>