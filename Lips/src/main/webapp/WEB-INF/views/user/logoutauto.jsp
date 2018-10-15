<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/resources/css/login.css?ver=2"  />
<div>
<h3>다른 기기에서 로그인 하여 자동 로그아웃 됩니다.</h3><br>
</div>
<div class="loginBox">
	<form action="/user/login" method="POST">
		<div class="formItem">
			<input class="input large" type="text" id="userId" name="userId" />
		</div>
		<div class="formItem">
			<input class="input large" type="text" id="pw" name="pw" />
		</div>
		<div class="formItem">
			<label for="useCookie">자동로그인</label>
			<input class="input large" type="checkbox" id="useCookie" name="useCookie" value="true"/>
		</div>
		<div class="formItem">
			<input class="btn large focus" type="submit" value="login"/>
			<a class="btn large" href="/user/join" >Join</a> 
		</div>
	</form>
</div>