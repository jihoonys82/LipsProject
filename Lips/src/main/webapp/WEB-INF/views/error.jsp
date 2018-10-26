<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bad Request</title>
<style>
body{
	background-color	: black;
	color				: white;
	text-align			: center;
}
#managerInfo {
	border				: 1px solid white;
	width				: 40%;
	margin				: 0px auto;
}
</style>
</head>
	<img src="/resources/img/logo2.png" alt="logo"
		style="width: 100%; height: 200px;">
	<hr>
	<h1>${errorTitle }</h1>
	<hr>
	<h2>${errorBody[0] }</h2>
	<br>
	<c:forEach items="${errorBody }" begin="1" var="val" varStatus="step">
	<b>${step.count}.&nbsp&nbsp${val }</b><br>
	</c:forEach>
	<br>

	<h3>오류가 지속될 경우 담당자에게 문의 바랍니다.</h3>
	<br>
	<div id="managerInfo">
		<h4>정지훈 팀장</h4>
		<div style="display: -webkit-inline-box;">
			<table >
				<tr>
					<td><b>Mobile</b></td>
					<td>+82 10-7689-0531</td>
					</tr>
					<tr>
					<td><b>E-Mail</b></td>
					<td>jihoonys82@gmail.com</td>
				</tr>
			</table>
		</div>
	</div>

</body>
</html>