<%@page import="lips.userinfo.dto.UserByToken"%>
<%@page import="lips.userinfo.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" href="/resources/css/userinfo/mypage.css?ver=2" />
<jsp:include page="./joinposhy.jsp" />
<script type="text/javascript"
	src="/resources/js/userinfo/inputValid.js?ver=1"></script>
	<script type="text/javascript">
	function checkUpdateForm(){
		if(!completePw||!completeNick||!completePhone||!completeBirth){
		
			console.log(completePw);
			console.log(completeNick);
			console.log(completePhone);
			console.log(completeBirth);
			alert('입력값을 확인해 주세요');
			return;
		}
		else{
			$('#mypageform').submit();
		}
	}
	</script>
<div class="myPageBox">
	<h1>마이페이지</h1>
	<br> <br>
	<form action="/user/mypage/update" method="POST" id="mypageform">
		<div class="formItem">
			<label for="inputId">아이디 (ID)</label> <input class="input large"
				type="text" id="inputId" name="userId"
				value="<sec:authentication property='principal.userId' />"
				readonly="readonly" />
		</div>
		<div class="formItem">
			<label for="inputPw">비밀번호 (PASSWORD)</label> <input
				class="input large" type="password" id="inputPw" name="pw"
				onfocus="$('#inputPw').poshytip('show');"
				onfocusout="$('#inputPw').poshytip('hide');" />
		</div>
		<div class="formItem">
			<label for="inputPwCheck">비밀번호 확인 (CONFIRM)</label> <input
				class="input large" type="password" id="inputPwCheck" name="pwCheck"
				onfocusout="isValidPw(this.value)" />
		</div>

		<div class="formItem">
			<label for="inputEmail">이메일 (EMAIL)</label> <input
				class="input large" type="email" id="inputEmail" name="email"
				value="<sec:authentication property='principal.email' />"
				readonly="readonly" />
		</div>

		<div class="formItem">
			<label for="inputNick">닉네임 (NICK)</label> <input class="input large"
				type="text" id="inputNick" name="nick"
				onfocus="$('#inputNick').poshytip('show');"
				onfocusout="isValidNick(this.value)"
				value="<sec:authentication property='principal.nick' />" />
		</div>

		<div class="formItem">
			<label for="inputPhone">연락처 (PHONE)</label> <input
				class="input large" type="text" id="inputPhone" name="phone"
				onfocus="$('#inputPhone').poshytip('show');"
				onfocusout="isValidPhone(this.value)"
				value="<sec:authentication property='principal.phone' />" />
		</div>

		<div class="formItem">
			<fmt:formatDate pattern="yyyy-MM-dd"
				value="<%=new UserByToken().getInstance().getBirth()%>" var='birth' />
			<label for="inputBirth">생년월일 (BIRTH)</label> <input
				class="input large" type="date" id="inputBirth" name="birth"
				style="width: 48%;" onfocusout="isValidBirth(this.value)"
				value='${birth }' />

		</div>


		<div class="formItem">
			<input type="button" class="btn large focus"
				onclick="checkUpdateForm()" value="submit" />
		</div>
	</form>

</div>