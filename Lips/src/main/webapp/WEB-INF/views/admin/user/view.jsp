<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/resources/css/admin.css" />

<!-- ### Stylesheet link here ### -->
<!-- Basic style components -->
<link rel="stylesheet" href="/resources/jui/dist/ui.min.css" />
<link rel="stylesheet" href="/resources/jui/dist/ui-dark.min.css" />
<link rel="stylesheet" href="/resources/jui/dist/grid.min.css" />
<link rel="stylesheet" href="/resources/jui/dist/grid-dark.min.css" />

<!-- project Default StyleSheet -->
<link rel="stylesheet" href="/resources/css/lips.css?ver=4"  />

<!-- ### Script Load here ### -->
<!-- Required script files -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="/resources/jui/dist/core.min.js"></script>
<script src="/resources/jui/dist/ui.min.js"></script>
<script src="/resources/jui/dist/grid.min.js"></script>

<script src="/resources/jui/dist/core.min.js"></script>
<script src="/resources/jui/dist/chart.min.js"></script>

</head>
<body class="jui">

<div class="navbar flat" style="overflow: hidden;">
	<div class="inline right">
		<span>admin 님 어서오세요</span>
	</div>
</div>
	
<nav class="col col-2">

	<div class="panel">
		<div class="body">
			<a href=""><span class="nav-label">대시보드</span></a>		
		</div>
		<div class="body">	      
			<a href="#"><span class="nav-label">공지사항</span></a>
		</div>
		<div class="body">
	    	<a href="project/chart"><span class="nav-label">프로젝트</span></a>
		</div>
		<div class="body">
		     <a href="#"><span class="nav-label">사용자</span></a>
		</div>
		<div class="body">
		    <a href="#"><span class="nav-label">서비스</span></a>
		</div>
		<div class="body" style="min-height:30em;"></div>
	</div>
	
</nav>
	
<div class="col col-10">
	<div class="panel">
		<div class="body">
			<div class="viewUserBox">
				<div class="view-form-row">
					<label for="nick" class="view-form-label">이름</label>
					<input type="text" name="nick" id="nick" class="input view-form-input" readonly="readonly"/> 
				</div>
				<div class="view-form-row">
					<label for="joinDate" class="view-form-label">가입일</label>
					<input type="text" name="joinDate" id="joinDate" class="input view-form-input" readonly="readonly"/> 
				</div>
				<div class="view-form-row">
					<label for="activeProject" class="view-form-label">참여 중인 프로젝트</label>
					<input type="text" name="activeProject" id="activeProject" class="input view-form-input" readonly="readonly"/> 
				</div>
				<div class="view-form-row">
					<label for="status" class="view-form-label">회원상태</label>
					<input type="text" name="status" id="status" class="input view-form-input" readonly="readonly"/> 
				</div>
				<div class="view-form-row">
					<label for="birth" class="view-form-label">생년월일</label>
					<input type="text" name="birth" id="birth" class="input view-form-input" readonly="readonly"/> 
				</div>
				<div class="view-form-row">
					<label for="phone" class="view-form-label">연락처</label>
					<input type="text" name="phone" id="phone" class="input view-form-input" readonly="readonly"/> 
				</div>
				<div class="view-form-row">
					<label for="email" class="view-form-label">이메일</label>
					<input type="text" name="email" id="email" class="input view-form-input" readonly="readonly"/> 
				</div>
	
				<div class="viewUserBtn">
					<a class="btn normal focus">프로젝트 공지</a>
					<a class="btn normal focus">정지 해제</a>
					<a class="btn normal focus">탈퇴 처리</a>
				</div>
			</div>
		</div>
	</div>
		
</div>

		
</body>
</html>