<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/resources/css/userinfo/login.css?ver=2"  />



<div class="loginBox">
	<form action="/login" method="POST" id="loginform">
		<div class="formItem">
			<input class="input large" type="text" id="userId" name="userId" placeholder="ID or EMAIL"/>
		</div>
		<div class="formItem">
			<input class="input large" type="password" id="pw" name="pw" placeholder="************"/>
		</div>
		<div class="formItem">
			<label for="useCookie">Remember Me</label>
			<input class="input large" type="checkbox" id="useCookie" name="useCookie" value="true"/>
		</div>
		<div class="formItem">
			<input class="btn large focus" type="submit" value="login"/>
			<a class="btn large" href="/user/join" >Join</a> 
		</div>
	</form>
	<div>
		<p style="float:right">forgot your <a href="/user/search" style="color:#9c75ec">password</a>?</p>
	</div>
</div>
<script type="text/javascript">
window.onload = function(){
	if(${isRetry eq true}){
		alert('login failed')
		}
};
</script>