<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" href="/resources/css/userinfo/join.css?ver=2" />

<h1 style="text-align:center" id="termsTitle">이용 약관 동의</h1>
<div class="termsBox" id="termsBox">
	<div></div>
	<div>
		<jsp:include page="./terms.jsp" />
	</div>
</div>
<script>
	var agreeRead = false;
	var agreeTogle = true;
	$(document).ready(function() {
		$(".joinBox").hide();
		$("#termsBox").scroll(function() {
			var dh = document.getElementById('termsBox').scrollHeight;
			var dch = document.getElementById('termsBox').clientHeight;
			var dct = document.getElementById('termsBox').scrollTop;
			if ((dh == (dct + dch))) {
				agreeRead=true;
				$("#agreeBtn").removeClass('disabled');
			}
		});
		$("#agreeBtn").click(function() {
			if(!agreeRead){
				alert("약관을 확인한 후 동의해주세요.");
				return;
			}
			if(agreeTogle){
				agreeTogle = false;
				$("#agreeBtn").addClass("focus").html("동의합니다.");
				$(".joinBox").show(400);
				$("#termsBox").hide(400);
				$("#termsTitle").hide();
			}else{
				agreeTogle = true;
				$("#agreeBtn").removeClass("focus").html("동의하지 않습니다.");
				$(".joinBox").hide(400);
				$("#termsBox").show(400);
				$("#termsTitle").show();
			}
		})
	});
</script>

<div class="agreeBox">
	이용약관 및 개인정보 수집 및 이용에 &nbsp<button class="btn disabled" id="agreeBtn" style="text-align:center;">동의하지 않습니다.</button>
</div>
<div class="joinBox">
	<h1>회원 가입</h1><br><br>
	<form action="/user/join" method="POST" id="joinform">
		<div class="formItem">
			<label for="inputId">아이디 (ID)</label> <input class="input large"
				type="text" id="inputId" name="userId" />
		</div>

		<div class="formItem">
			<label for="inputPw">비밀번호 (PASSWORD)</label> <input class="input large"
				type="password" id="inputPw" name="pw" />
		</div>
		<div class="formItem">
			<label for="inputPwCheck">비밀번호 확인 (CONFIRM)</label> <input class="input large"
				type="password" id="inputPwCheck" name="pwCheck" />
		</div>

		<div class="formItem">
			<label for="inputEmail">이메일 (EMAIL)</label><button style="width:200px; text-align : center;">인증</button> <input class="input large"
				type="text" id="inputEmail" name="email" style="width:300px"/>
		</div>

		<div class="formItem">
			<label for="inputNick">닉네임 (NICK)</label> <input class="input large"
				type="text" id="inputNick" name="nick" />
		</div>

		<div class="formItem">
			<label for="inputPhone">연락처 (PHONE)</label> <input class="input large"
				type="text" id="inputPhone" name="phone" />
		</div>

		<div class="formItem">
			<label for="inputBirth">생년월일 (BIRTH)</label> <input class="input large"
				type="date" id="inputBirth" name="birth" style="width:300px;"/>
		</div>

		<div class="formItem">
			<input class="btn large focus" type="submit" value="Submit" />
		</div>
	</form>

</div><br><br><br><br><br><br><br><br><br><br><br><br><br><br>