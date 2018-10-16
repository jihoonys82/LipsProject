<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="/resources/css/login.css?ver=2"  />

<div class="loginBox">
	<form action="/user/login" method="POST" id="loginform">
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
	
	<script type="text/javascript">
	$( document ).ready(function() {
	    $('#userId').val('test');
	    $('#pw').val('1234');
	    $('#loginform').submit();
	});
	</script>
	
</div>