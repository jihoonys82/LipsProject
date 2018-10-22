<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/tip-darkgray/tip-darkgray.css" />
<script type="text/javascript" src="/resources/js/userinfo/jquery.poshytip.min.js?ver=1" ></script>

<script>
$(document).ready(function() {
	$("#inputId").poshytip({
		content: '중복된 아이디 입니다.',
			className: 'tip-darkgray',
			bgImageFrameSize: 11,
		showOn: 'none',
		alignTo: 'target',
		alignX: 'inner-left',
		offsetX: 0,
		offsetY: 5
		});
	$("#inputPw").poshytip({
		content: '비밀번호는  최소한 하나의 숫자또는 문자를 포함하여 8 자 이상이어야 하며 대문자와 특수 문자 모두 사용할 수 있습니다 (예 : # ) ? , ! .',
		className: 'tip-darkgray',
		bgImageFrameSize: 11,
		showOn: 'none',
		alignTo: 'target',
		alignX: 'inner-left',
		offsetX: 0,
		offsetY: 5
		});
	$("#inputPwCheck").poshytip({
		content: '비밀번호와 비밀번호 확인이 일치하지 않거나 사용 불가능한 비밀번호 입니다.',
		className: 'tip-darkgray',
		bgImageFrameSize: 11,
		showOn: 'none',
		alignTo: 'target',
		alignX: 'inner-left',
		offsetX: 0,
		offsetY: 5,
		});
	$("#inputNick").poshytip({
		content: '닉네임은 2글자 이상 8글자 미만인 영어, 한글, 숫자만 가능합니다.',
		className: 'tip-darkgray',
		bgImageFrameSize: 11,
		showOn: 'none',
		alignTo: 'target',
		alignX: 'inner-left',
		offsetX: 0,
		offsetY: 5
		});
	$("#inputPhone").poshytip({
		content: '\'-\'를 제외한 숫자만 입력해 주세요.',
		className: 'tip-darkgray',
		bgImageFrameSize: 11,
		showOn: 'none',
		alignTo: 'target',
		alignX: 'inner-left',
		offsetX: 0,
		offsetY: 5
		});
	$('#emailAuthBtn').poshytip({
		content: '인증 이메일 전송중 입니다.',
		className: 'tip-darkgray',
		bgImageFrameSize: 11,
		showOn: 'none',
		alignTo: 'target',
		alignX: 'inner-left',
		offsetX: 0,
		offsetY: 5
		});
});
</script>