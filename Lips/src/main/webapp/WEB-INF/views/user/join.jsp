<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<div class="joinBox">
	<form action="/user/join" method="POST" id="joinform">
		<div class="formItem">
			<label for="inputId">아이디</label>
			<input class="input large" type="text" id="inputId" name="userId" />
		</div>
		
		<div class="formItem">
			<label for="inputPw">비밀번호</label>
			<input class="input large" type="text" id="inputPw" name="pw" />
		</div>
		
		<div class="formItem">
			<label for="inputEmail">이메일</label>
			<input class="input large" type="text" id="inputEmail" name="email" />
		</div>
		
		<div class="formItem">
			<label for="inputNick">닉네임</label>
			<input class="input large" type="text" id="inputNick" name="nick" />
		</div>
		
		<div class="formItem">
			<label for="inputPhone">연락처</label>
			<input class="input large" type="text" id="inputPhone" name="phone" />
		</div>
		
		<div class="formItem">
			<label for="inputBirth">생년월일</label>
			<input class="input large" type="date" id="inputBirth" name="birth"/>
		</div>
		
		<div class="formItem">
			<input class="btn large focus" type="submit" value="Submit"/> 
		</div>
	</form>



</div>