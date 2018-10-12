<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="navbar header">
	<div class="headerLogo">
		<img src="/resources/img/logo.png" alt="logo" width="100" height="50">
	</div><!-- end of headerLogo -->
	<div class="inline">
		<ul class="nav">
			<li><a href="/project/main">프로젝트</a></li>
			<li><a href="#">이슈</a></li>
			<li><a href="#">마이페이지</a></li>
			<li><a href="#">가이드</a></li>
		</ul>
	</div>
	<div class="inline right menu-right">
		<div class="combo">
			<input type="text" class="input" />
			<a class="btn">Search</a>
		</div>
		<c:if test="${sessionScope.login eq true }" >
			<a class="btn" href="/user/logout" id="logout" >logout</a>
		</c:if>
		<c:if test="${sessionScope.login ne true }" >
			<a class="btn" href="/user/login" id="login">login</a>
		</c:if>
	</div>
	
</div>