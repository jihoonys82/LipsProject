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
					<label for="activeProject" class="view-form-label">참여 중인 프로젝트</label>
					<input type="text" name="activeProject" id="activeProject" class="input view-form-input" readonly="readonly"/> 
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
	
				<div class="viewUserBtn">
					<a class="btn normal focus">프로젝트 공지</a>
					<a class="btn normal focus">정지 해제</a>
					<a class="btn normal focus">탈퇴 처리</a>
				</div>
			</div>
		</div>
	</div>
		
		
</body>
</html>