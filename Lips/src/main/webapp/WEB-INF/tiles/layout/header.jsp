<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="navbar header">
	<div class="headerLogo">
		<img src="/resources/img/logo.png" alt="logo" width="100" height="50" onclick="goMain()">
		<script>function goMain(){window.location.href= '/main';}</script>
	</div><!-- end of headerLogo -->
	<div class="inline">
		<ul class="nav">
			<li><a href="/project/main">프로젝트</a></li>
			<li><a href="/issue/main">이슈</a></li>
			<li><a href="#">마이페이지</a></li>
			<li><a href="#">가이드</a></li>
		</ul>
	</div>
	<div class="inline right menu-right">
		<div class="combo">
			<input type="text" class="input" />
			<a class="btn">Search</a>
		</div>
		<sec:authorize access="hasAuthority('USER')">
			<a class="btn" href="<c:url value='/user/logout' />">logout</a>
		</sec:authorize>
		<sec:authorize access="!hasAuthority('USER')">
				<a class="btn" href="<c:url value='/user/login' />">login</a>
		</sec:authorize>
	</div>
	
</div>