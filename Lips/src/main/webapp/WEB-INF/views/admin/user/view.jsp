<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

	<div class="panel">
		<div class="body">
			<div class="viewUserBox">
				<div class="view-form-row">
					<label for="nick" class="view-form-label">아이디</label>
					<input type="text" name="id" id="id" class="input view-form-input" readonly="readonly" value="${userInfo.userId }"/> 
				</div>
				<div class="view-form-row">
					<label for="joinDate" class="view-form-label">가입일</label>
					<input type="text" name="joinDate" id="joinDate" class="input view-form-input" readonly="readonly" 
						value="<fmt:formatDate value="${userInfo.createDate}" pattern="yyyy-MM-dd" />"/> 
				</div>

				<div class="view-form-row">
					<label for="status" class="view-form-label">회원상태</label>
						<c:if test="${userInfo.blocked eq 0 && userInfo.userLevel eq 1 }">						
							<input type="text" name="status" id="status" class="input view-form-input" readonly="readonly" value="가입"/>										
						</c:if>
						<c:if test="${userInfo.blocked eq 0 && userInfo.userLevel eq 0}">
							<input type="text" name="status" id="status" class="input view-form-input" readonly="readonly" value="탈퇴"/>
						</c:if>
						<c:if test="${userInfo.blocked eq 1 && userInfo.userLevel eq 0}">
							<input type="text" name="status" id="status" class="input view-form-input" readonly="readonly" value="강제탈퇴"/>
						</c:if>
				</div>

				<div class="view-form-row">
					<label for="birth" class="view-form-label">생년월일</label>
					<input type="text" name="birth" id="birth" class="input view-form-input" readonly="readonly"
						value="<fmt:formatDate value="${userInfo.birth}" pattern="yyyy-MM-dd" />" />
				</div>
				<div class="view-form-row">
					<label for="phone" class="view-form-label">연락처</label>
					<input type="text" name="phone" id="phone" class="input view-form-input" readonly="readonly" value="${userInfo.phone }"/> 
				</div>
				<div class="view-form-row">
					<label for="email" class="view-form-label">이메일</label>
					<input type="text" name="email" id="email" class="input view-form-input" readonly="readonly" value="${userInfo.email }"/> 
				</div>
				
				<div class="view-form-row">
					<label for="activeProject" class="view-form-label">참여 중인 프로젝트</label>
						<c:if test="${projectInfo[0].projectName ne null}">
							<c:forEach items="${projectInfo }" var="pInfo">
									<div>
										<ul>
											<li>
												<span id="activeProject">${pInfo.projectName}</span>
<!-- 												<input type="text" name="activeProject" id="activeProject" class="input mini view-form-input" readonly="readonly"  -->
<%-- 													value="${pInfo.projectName }"/>  --%>
											</li>
										</ul>
									</div>
							</c:forEach>		
						</c:if>
						<c:if test="${projectInfo[0].projectName eq null}">
							<span id="activeProject">참여 프로젝트 없음</span> 
						</c:if>
					
				</div>
				
	
				<div class="viewUserBtn">
				
					<a class="btn normal" style="float: right;" onclick="goBack()">뒤로 가기</a>
					<a class="btn normal focus">프로젝트 공지</a>
					<a class="btn normal focus" onclick="win_1.show()">정지 해제</a>
					<a class="btn normal focus" onclick="modal_2.show()">탈퇴 처리</a>
				</div>
			</div>
		</div>
	</div>

<!-- <div id="modal_1" class="msgbox" style="display: none;"> -->
<!-- 	<div class="head">정지 해제</div> -->
<!-- 	<div class="body"> -->
<!-- 		<div id="modalReopen" style="text-align: center; margin-top: 45px;"> -->
<%-- 			<p>${userInfo.userId } 님의 강등을 취소하시겠습니까?</p> --%>
<!-- 			<a class="btn focus small" id="btnReopen">확인</a> <a class="btn small" id="btnCancel_1">취소</a> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->

<div id="win_1" class="window">
    <div class="head">
        <div class="left">정지해제</div>
        <div class="right">
            <a href="#" class="close"><i class="icon-exit"></i></a>
        </div>
    </div>
    <div class="body">
        <div id="modalReopen" style="text-align: center;">
			<p>${userInfo.userId } 님의 강등을 취소하시겠습니까?</p>
		</div>
    </div>
    <div class="foot" align="center">
        <a href="#" class="btn focus close" id="btnReopen">확인</a> <a class="btn close" id="btnCancel_1">취소</a>
    </div>
</div>

<div id="modal_2" class="msgbox" style="display: none; width: 20em;">
	<div class="head">탈퇴 처리</div>
	<div class="body" >
		<div id="modalClose" style="text-align: center; margin-bottom: 10%;">
			<p>${userInfo.userId } 님을 강등시키시겠습니까?</p>
		</div>
		<div style="text-align: center;">
			<a class="btn focus small close" id="btnClose">확인</a> <a class="btn small close" id="btnCancel_2">취소</a>
		</div>
	</div>
</div>


<script type="text/javascript">

	function goBack() {
	    window.history.back(-1);
	}

	$(document).ready(function(){
		
		$("#btnCancel_1").click(function() {
			$("#win_1").hide();
			// TODO 검은색 배경 지우는 법 찾기
		});
	
		$("#btnCancel_2").click(function() {
			modal_2.hide();
			// TODO 검은색 배경 지우는 법 찾기 
		});		
		
		
		$("#btnReopen").click(function() {
			$.ajax({
				type: "post"
				, url: "/admin/user/view"
				, dataType: "json"
				, data: {"userId": "${userInfo.userId}", "param": "true" }
				, success: function(data) {
// 					var infos = new Array();
					
// 					infos[0] = data.blocked;
// 					infos[1] = data.level; 
			
				    	$("#stauts").removeAttr("readonly");
				    	$("#status").empty();
				        $("#status").val("가입");
				        
//				    $("#btnReopen").click(function(){			    	
// 				    	$("#status").attr("readonly",false);
//				    });
					
					
				}, error: function() {
					alert("error");
				}
			})
			
		});	
		
		$("#btnClose").click(function() {
			$.ajax({
				type: "post"
				, url: "/admin/user/view"
				, dataType: "json"
				, data: {"userId": "${userInfo.userId}", "param":"false" }
				, success: function(data) {
				    	
// 				    	$("#status").attr("readonly",false);
						
				    	$("#stauts").removeAttr("readonly");
				    	$("#status").empty();
				        $("#status").val("강제탈퇴");
				        
//					$("#btnClose").click(function(){
// 				        $("#modal_2").modal().hide();			        
//				    });
					
					
				}, error: function() {
					
					alert("error");
				}
			})
			
		});		
		
	});
	
	
	jui.ready([ "ui.modal" ], function(modal) {
		$("#modal_2").appendTo("body");

		modal_2 = modal("#modal_2", {
			color : "gray",
			autoHide: false
		});
		
	});
	
	jui.ready([ "ui.window" ], function(win) {
	    win_1 = win("#win_1", {
	        width: 300,
	        height: 300,
	        modal: true
	    });
	});
	
	
</script>		
		
		
</body>
</html>