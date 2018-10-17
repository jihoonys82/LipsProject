<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<h1>
	메인페이지에요
</h1>
	<sec:authorize access="hasAuthority('USER')">
		<sec:authentication property="principal.userId"/> 님 환영합니다.
<%-- 	 =${sessionScope.user.userId } --%>
		<sec:authentication property="principal.nick" />
	</sec:authorize>
<P>  The time on the server is ${serverTime}. </P>
