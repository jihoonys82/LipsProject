var completeId = false;
var completePw = false;
var completeNick = false;
var completePhone = false;
var completeBirth = false;
var completeEmailOverlap = false;
var completeEmailAuth = false;

function validId(idDom) {
	let regx = /^(?=.*[a-zA-Z0-9]).{4,20}$/;
	if(!regx.test(idDom.value)){
		$("#inputId").poshytip("update","아이디는 4글자 이상 20글자 미만의 영어/숫자만 사용 가능합니다.");
		$("#inputId").css("border-color", "red");
		$("#inputId").poshytip("show");
		setTimeout(function() {
			$('#inputId').poshytip("hide");
		}, 3000);
		return;
	}
	$.ajax({
		url : "/user/join/checkid",
		type : "POST",
		data : {
			"userId" : $("#inputId").val()
		},
		success : function(responseData) {
			var result = responseData.check;
			if (!result) {
				$("#inputId").poshytip("update","이미 사용중인 아이디 입니다.");
				$("#inputId").css("border-color", "red");
				$("#inputId").poshytip("show");
				completeId = false;
			} else {
				$("#inputId").css("border-color", "#9c75ec");
				$("#inputId").poshytip("hide");
				completeId = true;
			}
		}
	});
}

function validPw(input) {
	let regx = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,}$/;
	var inputPw1 = $('#inputPw').val();
	if (input != inputPw1 || !regx.test(input)) {
		$('#inputPwCheck').poshytip("show");
		$("#inputPw").css("border-color", "red");
		$("#inputPwCheck").css("border-color", "red");
		setTimeout(function() {
			$('#inputPwCheck').poshytip("hide");
		}, 3000);
		completePw = false;
		return;
	} else {
		$("#inputPw").css("border-color", "#9c75ec");
		$("#inputPwCheck").css("border-color", "#9c75ec");
		$('#inputPwCheck').poshytip("hide");
		completePw = true;
	}
}
function validNick(input) {
	let regx = /^(?=.*[a-zA-Z가-힣0-9]).{2,8}$/;
	if (!regx.test(input)) {
		$("#inputNick").css("border-color", "red");
		completeNick = false;
	} else {
		$("#inputNick").css("border-color", "#9c75ec");
		completeNick = true;
	}
	$("#inputNick").poshytip("hide");
}
function validPhone(input) {
	let regx = /^(?=.*[0-9]).{10,11}$/;
	if (!regx.test(input)) {
		$("#inputPhone").css("border-color", "red");
		completePhone = false;
	} else {
		$("#inputPhone").css("border-color", "#9c75ec");
		completePhone = true;
	}
	$("#inputPhone").poshytip("hide");
}
function validBirth(input) {
	var inputDate = new Date(input);
	var date = new Date();
	if (date > inputDate) {
		$("#inputBirth").css("border-color", "#9c75ec");
		completeBirth = true;
	} else {
		$("#inputBirth").css("border-color", "red");
		completeBirth = false;
	}
}

var emailAuthCode = null;// 이메일 인증코드

function validEmail(input) {
	if (!completeEmailOverlap)return;
	$('#emailAuthBtn').poshytip('show');
	$.ajax({
		url : "/user/join/mailSend",
		type : "POST",
		data : {
			"email" : input
		},
		success : function(responseData) {
			emailAuthCode = responseData.code;
			$('#emailAuthBtn').poshytip('hide');
			$('#emailAuth').hide();
			$('#emailAuth').show(400);
		},
		error : function(exception) {
			alert('메일전송에 실패했습니다. 다시 시도해 주세요.');
		}
	});
}
function validEmailOverlap(input) {
	$.ajax({
		url : "/user/join/mailOverlap",
		type : "POST",
		data : {
			"email" : input
		},
		success : function(responseData) {
			var result = responseData.check;
			if (!result) {
				$("#inputEmail").css("border-color", "red");
				$("#inputEmail").poshytip("show");
				completeEmailOverlap = false;
			} else {
				$("#inputEmail").css("border-color", "#9c75ec");
				$("#inputEmail").poshytip("hide");
				completeEmailOverlap = true;
			}
		}
	});
}

function validEmailAuth(input) {
	if (input == emailAuthCode) {
		$("#emailAuth").css("border-color", "#9c75ec");
		completeEmailAuth = true;
	} else {
		$("#emailAuth").css("border-color", "red");
		completeEmailAuth = false;
	}

}
