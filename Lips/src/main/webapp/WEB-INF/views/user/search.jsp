<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/resources/css/userinfo/search.css?ver=1" />
<jsp:include page="./searchposhy.jsp" />
<script type="text/javascript">
function searchId(){
	$("#searchIdBtn").poshytip('show');
	$.ajax({
		url : "/user/search/id",
		type : "POST",
		data : {
			"email" : $("#searchIdEmail").val()
		},
		success : function(responseData) {
			if(responseData.result){
				$("#searchIdBtn").poshytip('hide');
				$('#searchIdEmail').poshytip('show');
				setTimeout(function(){
					$('#searchIdEmail').poshytip('hide');
				},3000);
			}else{
				$("#searchIdBtn").poshytip('hide');
				alert('입력값을 확인해 주세요.');
			}
		},
		error : function(exception) {
			$("#searchIdBtn").poshytip('hide');
			alert('메일전송에 실패했습니다. 다시 시도해 주세요.');
		}
	});
}
function searchPw(){
	$("#searchPwBtn").poshytip('show');
	$.ajax({
		url : "/user/search/pw",
		type : "POST",
		data : {
			"userId": $("#searchPwId").val(),
			"email" : $("#searchPwEmail").val()
		},
		success : function(responseData) {
			if(responseData.result){
				$("#searchPwBtn").poshytip('hide');
				$('#searchPwId').poshytip('show');
				setTimeout(function(){
					$('#searchPwId').poshytip('hide');
				},3000);
			}
			else{
				$("#searchPwBtn").poshytip('hide');
				alert('입력값을 확인해 주세요.');
			}
		},
		error : function(exception) {
			$("#searchPwBtn").poshytip('hide');
			alert('메일전송에 실패했습니다. 다시 시도해 주세요.');
		}
	});
}
</script>
<div class="searchBox">
	<h1>아이디 찾기</h1><br><br>
	
		<div class="formItem">
			<label for="searchIdEmail">이메일 (E-Mail)</label> 
			<input class="input large" type="email" id="searchIdEmail" name="email" />
		</div>
		<div class="formItem">
			<input id="searchIdBtn" type="button" class="btn large focus" value="submit" onclick="searchId()"/>
		</div>

	<h1>비밀번호 찾기</h1><br><br>
		<div class="formItem">
			<label for="searchPwId">아이디 (ID)</label> 
			<input class="input large" type="text" id="searchPwId" name="userId" />
		</div>
		<div class="formItem">
			<label for="searchPwEmail">이메일 (E-Mail)</label> <input class="input large"
				type="email" id="searchPwEmail" name="email"/>
		</div>
		<div class="formItem">
			<input id="searchPwBtn" type="button" class="btn large focus" value="submit" onclick="searchPw()"/>
		</div>
</div><br><br><br><br><br><br><br><br><br><br><br><br><br><br>