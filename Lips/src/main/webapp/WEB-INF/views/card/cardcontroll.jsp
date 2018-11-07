<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" buffer="1024kb"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<c:forEach items="${selCard}" var="Card" >
		<div >
		<c:set value="${Card.assetView}" var="url"/>
			<c:import url="/card/${url }?dashboardId=${Card.dashboardId}&positionX=${Card.positionX }&positionY=${Card.positionY}&projectId=${projectId}"/>
		</div>
	</c:forEach>
</div>