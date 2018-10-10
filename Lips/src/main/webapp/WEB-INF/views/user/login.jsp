<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/resources/css/login.css?ver=1"  />
<form action="/user/login" method="POST">
<input class="input large" type="text" id="userId" name="userId" />
<input class="input large" type="text" id="pw" name="pw" />
<label for="useCookie">자동로그인</label>
<input class="input large" type="checkbox" id="useCookie" name="useCookie" value="true"/>
<input class="input large" type="submit" value="전송"/>
</form>