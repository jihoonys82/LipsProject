<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authentication property="principal.nick" var="usernick" />
<script>
$(document).ready(function() {
	var usernick = '${usernick }';
	var notifyTitle="Lips 알림 서비스";
	var options = {
			body	: usernick+"님 환영합니다. \r\n현재 알림기능을 사용 중 입니다."
	}
	notify(notifyTitle,options);
});
</script>
<h1>메인페이지에요</h1>
<sec:authorize access="hasAuthority('USER')">
	<sec:authentication property="principal.nick" /> 님 환영합니다.	
	</sec:authorize>



