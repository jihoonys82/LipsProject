<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal.userId" var="userId"/> 
<style>
.wrap {
	margin: 10px;
}
/* issue form */
.issue-form-row {
	width: 		100%;
	margin:		1em;
}
.issue-form-row .issue-form-label {
	display: inline-block;
	width: 		15%;
	margin-right: 5px;
}
.issue-form-row .issue-form-input {
	width: 		60%;
}
.issue-form-row button {
	width: 100px;
}
.alignCenter {
	display: block;
	text-align: center;
}
</style>
<div class="wrap">

	<div class="row mb-1">
		<div class="h2">게시글 쓰기</div>
	</div>
	<div class="hr"></div>
	<div class="row mt-1 mb-1">
		<div class="panel" id="freeboardWrite">
			<div class="head">
				<strong>Freeboard Write</strong>
			</div>
			<div class="body">
				<form action="/freeboard/write" method="post">
					<div class="issue-form-row">
						<label for="title" class="issue-form-label">제목</label>
						<input type="text" name="fboardTitle" class="input issue-form-input" />
					</div>
					<div class="issue-form-row">
						<label for="author" class="issue-form-label">작성자</label>
						<input type="text" class="input issue-form-input" value="${userId}" disabled />
						<input type="hidden" name="fboardWriter" class="input issue-form-input" value="${userId }" />
					</div>
					<div class="issue-form-row">
						<label for="content" class="issue-form-label">내용</label>
						<textarea style="resize: none;" name="fboardContent" class="input issue-form-input" rows="10"></textarea>
					</div>
					<div class="alignCenter">
						<button class="btn focus">Write</button>
					</div>
				</form>
			</div>
		</div>
	</div>	
</div>