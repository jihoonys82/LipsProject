<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/tip-darkgray/tip-darkgray.css" />
<script type="text/javascript" src="/resources/js/userinfo/jquery.poshytip.min.js?ver=1" ></script>
<script>
$(document).ready(function() {
	$("#searchIdEmail").poshytip({
		content: '회원정보에 등록된 Email로 아이디를 발송하였습니다.',
		className: 'tip-darkgray',
		bgImageFrameSize: 11,
		showOn: 'none',
		alignTo: 'target',
		alignX: 'inner-left',
		offsetX: 0,
		offsetY: 5
		});
	$("#searchIdBtn").poshytip({
		content: '등록된 Email로 메일을 전송 중 입니다.',
		className: 'tip-darkgray',
		bgImageFrameSize: 11,
		showOn: 'none',
		alignTo: 'target',
		alignX: 'inner-left',
		offsetX: 0,
		offsetY: 5
		});
	$("#searchPwId").poshytip({
		content: '회원정보에 등록된 Email로 임시 비밀번호를 발송하였습니다.',
		className: 'tip-darkgray',
		bgImageFrameSize: 11,
		showOn: 'none',
		alignTo: 'target',
		alignX: 'inner-left',
		offsetX: 0,
		offsetY: 5
		});
	$("#searchPwBtn").poshytip({
		content: '등록된 Email로 메일을 전송 중 입니다.',
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