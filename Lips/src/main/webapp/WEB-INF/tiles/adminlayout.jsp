<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lips - Project Management System</title>
<!-- ### Stylesheet link here ### -->
<!-- Basic style components -->
<link rel="stylesheet" href="/resources/jui/dist/ui.min.css" />
<link rel="stylesheet" href="/resources/jui/dist/ui-dark.min.css" />
<link rel="stylesheet" href="/resources/jui/dist/grid.min.css" />
<link rel="stylesheet" href="/resources/jui/dist/grid-dark.min.css" />

<!-- project Default StyleSheet -->
<link rel="stylesheet" href="/resources/css/admin.css?ver=4" />

<!-- ### Script Load here ### -->
<!-- Required script files -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="/resources/jui/dist/core.min.js"></script>
<script src="/resources/jui/dist/grid.min.js"></script>
<script src="/resources/jui/dist/chart.js"></script>
<script src="/resources/jui/dist/ui.min.js"></script>


</head>
<body class="jui">
	<!-- header  -->
	<tiles:insertAttribute name="header" />

	<div class="col col-10">
		<tiles:insertAttribute name="body" />
	</div>

</body>
</html>