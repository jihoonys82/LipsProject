<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="body">
	<div class="row">
		<div class="col col-1">
			${comment.userId }
		</div>
		<div class="col col-10">
			${comment.commentContent }
			<small> - <fmt:formatDate value="${comment.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/> </small>
		</div>
		<c:if test="${comment.userId eq userId }" >
			<button class="btn focus mini commentDelete"><span class="icon icon-close"></span></button>
			<input type="hidden" value="${comment.commentId }" />
		</c:if>
	</div>
	<c:if test="${comment.attachFile > 0 }"> 
		<div class="row">
			<div class="col col-1"></div>
			<div class="col col-10">
				<span>첨부파일</span>
				<span class="commentAttachFile"></span>
			</div>
		</div>
	</c:if>
</div>