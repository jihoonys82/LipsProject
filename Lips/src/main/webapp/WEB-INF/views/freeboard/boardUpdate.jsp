<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<script>
jui.ready([ "ui.modal" ], function(modal) {
	$("#modal_1").appendTo("body");
						
	modal_1 = modal("#modal_1", {
	color: "black"
	});
});
</script>
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
		<div class="h2">게시글 수정</div>
	</div>
	<div class="hr"></div>
	<div class="row mt-1 mb-1">
		<div class="panel" id="freeboardUpdate">
			<div class="head">
				<strong>Freeboard Update</strong>
			</div>
			<div class="body">
				<form action="/freeboard/boardUpdate" method="Post">
				<input hidden="true" name="fboardId" value="${boardRetrieve.fboardId}">
				<div class="issue-form-row">
					<label for="title" class="issue-form-label">제목</label>
					<input type="text" class="input issue-form-input" name="fboardTitle" value="${boardRetrieve.fboardTitle }" />
				</div>
				<div class="issue-form-row">
					<label for="author" class="issue-form-label">작성자</label>
					<div class="input issue-form-input">
						${boardRetrieve.fboardWriter}
					</div>
				</div>
				<div class="issue-form-row">
					<label for="content" class="issue-form-label">내용</label>
					<textarea style="resize: none;" name="fboardContent" class="input issue-form-input" rows="10">${boardRetrieve.fboardContent }</textarea>
				</div>
				<div class="alignCenter">
					<button class="btn" >Update</button>
				</div>
				</form>
			</div>	
		</div>
	</div>
</div>	
