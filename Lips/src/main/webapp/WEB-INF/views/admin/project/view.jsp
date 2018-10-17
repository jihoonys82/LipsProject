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
			<div class="viewProBox">
			<div class="row">
			
				<div class="col col-12">	
					
					<div class="viewTwinBox col col-5">
						<div class="infomation">프로젝트 정보</div>
							<div class="view-form-row">
							<label for="proName" class="view-form-label">프로젝트 명</label>
							<input type="text" name="proName" id="proName" class="input view-form-input" readonly="readonly"/>
							</div>
							
							<div class="view-form-row">
							<label for="proNum" class="view-form-label">참여인원</label>
							<input type="text" name="proNum" id="proNum" class="input view-form-input" readonly="readonly"/> 
							</div>
									
							<div class="view-form-row">
							<label for="proType" class="view-form-label">프로젝트 유형</label>
							<input type="text" name="proType" id="proType" class="input view-form-input" readonly="readonly"/> 
							</div>				
						
							<div class="view-form-row">
							<label for="proProgress" class="view-form-label">진행 상황</label>
							<input type="text" name="proProgress" id="proProgress" class="input view-form-input" readonly="readonly"/> 
							</div>
							
							<div class="view-form-row">
							<label for="proIssue" class="view-form-label">등록된 이슈</label>
							<input type="text" name="proIssue" id="proIssue" class="input view-form-input" readonly="readonly"/> 
							</div>
							
							<div class="view-form-row">
							<label for="proOpenDate" class="view-form-label">프로젝트 개설일</label>
							<input type="text" name="proOpenDate" id="proOpenDate" class="input view-form-input" readonly="readonly"/> 
							</div>
							
							<div class="view-form-row">
							<label for="proProDate" class="view-form-label">프로젝트 진행일</label>
							<input type="text" name="proProDate" id="proProDate" class="input view-form-input" readonly="readonly"/> 
							</div>
					</div>		
									
					<div class="viewTwinBox col col-5">
						<div class="infomation">참여인원 정보</div>	
							<div class="view-form-row">
								<label for="userLeader" class="view-form-label">프로젝트 리더</label>
								<input type="text" name="userLeader" id="userLeader" class="input view-form-input" readonly="readonly"/> 
							</div>
							
							<div class="view-form-row">
								<label for="userMember1" class="view-form-label">프로젝트 멤버</label>
								<input type="text" name="userMember" id="userMember1" class="input view-form-input" readonly="readonly"/> 
							</div>
							
							<div class="view-form-row">
								<label for="userMember2" class="view-form-label">프로젝트 멤버</label>
								<input type="text" name="userMember" id="userMember2" class="input view-form-input" readonly="readonly"/> 
							</div>
							
							<div class="view-form-row">
								<label for="userMember3" class="view-form-label">프로젝트 멤버</label>
								<input type="text" name="userMember" id="userMember3" class="input view-form-input" readonly="readonly"/> 
							</div>
							
							<div class="view-form-row">
								<label for="userMember4" class="view-form-label">프로젝트 멤버</label>
								<input type="text" name="userMember" id="userMember4" class="input view-form-input" readonly="readonly"/> 
							</div>
							
							<div class="view-form-row">
								<label for="userMember5" class="view-form-label">프로젝트 멤버</label>
								<input type="text" name="userMember" id="userMember5" class="input view-form-input" readonly="readonly"/> 
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
			<div class="viewProBtn">
				<a class="btn normal focus">프로젝트 공지</a>
				<a class="btn normal focus">프로젝트 재개</a>
				<a class="btn normal focus">프로젝트 종료</a>				
			</div>
		</div>
		
		
	</div>	<!-- panel_end -->	
<!-- </div>	col col-10_end  -->

	
</body>
</html>