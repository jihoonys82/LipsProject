<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link rel="stylesheet" href="/resources/css/userinfo/join.css?ver=2" />
<jsp:include page="./joinposhy.jsp" />
<h1 style="text-align:center" id="termsTitle">이용 약관 동의</h1>
<div class="termsBox" id="termsBox">
	<div></div>
	<div>
		<jsp:include page="./terms.jsp" />
	</div>
</div>
<script type="text/javascript" src="/resources/js/userinfo/inputValid.js?ver=1"></script>
<script>
	var agreeRead = false;
	var agreeTogle = true;
	$(document).ready(function() {
		$(".joinBox").hide();
		$("#emailAuth").hide();
		$("#termsBox").scroll(function() {
			var dh = document.getElementById('termsBox').scrollHeight;
			var dch = document.getElementById('termsBox').clientHeight;
			var dct = document.getElementById('termsBox').scrollTop;
			if ((dh <= (dct + dch + 20))) {
				agreeRead = true;
				$("#agreeBtn").removeClass('disabled');
			}
		});
		$("#agreeBtn").click(function() {
			if (!agreeRead) {
				alert("약관을 확인한 후 동의해주세요.");
				return;
			}
			if (agreeTogle) {
				agreeTogle = false;
				$("#agreeBtn").addClass("focus");
				$(".joinBox").show(400);
				$("#termsBox").hide(400);
				$("#termsTitle").hide();
			} else {
				agreeTogle = true;
				$("#agreeBtn").removeClass("focus");
				$(".joinBox").hide(400);
				$("#termsBox").show(400);
				$("#termsTitle").show();
			}
		})
	});
	function checkInputForm(){
		if(!completeId||!completePw||!completeNick||!completePhone||!completeBirth||!completeEmailAuth||!completeEmailOverlap){
			alert('입력값을 확인해 주세요');
			return;
		}
		else{
			$('#joinform').submit();
		}
	}

</script>

<div class="agreeBox">
	이용약관, 개인정보 수집 및 이용에 &nbsp<button class="btn disabled" id="agreeBtn" style="text-align:center;">동의합니다.</button>
</div>
<div class="joinBox">
	<h1>회원 가입</h1><br><br>
	<form action="/user/join" method="POST" id="joinform" >
		<div class="formItem">
			<label for="inputId">아이디 (ID)</label> <input class="input large"
				type="text" id="inputId" name="userId" onfocusout="checkId(this);"/>
		</div>

		<div class="formItem">
			<label for="inputPw">비밀번호 (PASSWORD)</label> <input class="input large"
				type="password" id="inputPw" name="pw" onfocus="$('#inputPw').poshytip('show');" onfocusout="$('#inputPw').poshytip('hide');"/>
		</div>
		<div class="formItem">
			<label for="inputPwCheck">비밀번호 확인 (CONFIRM)</label> <input class="input large"
				type="password" id="inputPwCheck" name="pwCheck" onfocusout="isValidPw(this.value)"/>
		</div>

		<div class="formItem">
			<label for="inputEmail">이메일 (EMAIL)</label>
			<input type="button" id="emailAuthBtn" class="btn focus" style="width:18%; text-align : center; margin : 10px;" value="인증" onclick="ValidEmail($('#inputEmail').val());"/>
			<input class="input large"type="email" id="inputEmail" name="email" style="width:39%" onfocusout="validEmailOverlap(this.value)"/>
		</div>
		<div class="formItem"  style="margin:0px;" > 
			<input type="text" id="emailAuth" class="input large" placeholder="인증번호를 입력해 주세요." onfocusout="validEmailAuth(this.value)" style=" width:40%">
		</div>

		<div class="formItem">
			<label for="inputNick">닉네임 (NICK)</label> <input class="input large"
				type="text" id="inputNick" name="nick" onfocus="$('#inputNick').poshytip('show');" onfocusout="isValidNick(this.value)"/>
		</div>

		<div class="formItem">
			<label for="inputPhone">연락처 (PHONE)</label> <input class="input large"
				type="text" id="inputPhone" name="phone" onfocus="$('#inputPhone').poshytip('show');" onfocusout="isValidPhone(this.value)"/>
		</div>

		<div class="formItem">
			<label for="inputBirth">생년월일 (BIRTH)</label> <input class="input large"
				type="date" id="inputBirth" name="birth" style="width:48%;" onfocusout="isValidBirth(this.value)"/>
		</div>
		<div class="formItem">
			<input type="button" class="btn large focus" onclick="checkInputForm()" value="submit"/>
		</div>
	</form>

</div><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<script>


</script>

