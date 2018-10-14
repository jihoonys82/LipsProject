<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script type="text/javascript">
window.onload=function(){
	
	if(window.Notification){
		Notification.requestPermission();
	}
	notify();
}
function notify(){
	if(Notification.permission !== 'granted'){
		alert('notification is disabled');
	}else{
		var notification = new Notification('Lips 로그인 알림',{
			icon:'/resources/img/logo.png',
			body:'새로운 계정에서 로그인하여 자동 로그아웃 됩니다.',
		});
		
	}
}
</script>