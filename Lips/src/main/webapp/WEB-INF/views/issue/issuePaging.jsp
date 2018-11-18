<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- pagination --%>
<style type="text/css">
    a[disabled="disabled"] {
        pointer-events: none;
    }
</style>
<c:if test="${param.userId ne null }">
	<c:set var="setUserId" value="&userId=" />
</c:if>
<div class="paging">
	<c:if test="${paging.curPage eq 1 }">
		<a href="/issue/issueList?listType=${param.listType }&projectId=${param.projectId }" class="prev" disabled="disabled">Previous</a>
	</c:if>
	<c:if test="${paging.curPage ne 1 }">
		<a href="/issue/issueList?listType=${param.listType }&projectId=${param.projectId }${setUserId}${param.userId }&curPage=${paging.curPage-1 }" class="prev">Previous</a>
	</c:if>
	<div class="list">
		<c:forEach var="page" begin="${paging.startPage }" end="${paging.endPage }">
	    	<c:if test="${paging.curPage eq page }">
	    		<a href="/issue/issueList?listType=${param.listType }&projectId=${param.projectId }${setUserId}${param.userId }&curPage=${page }" class="active" disabled="disabled">${page }</a>
	    	</c:if>
	    	<c:if test="${paging.curPage ne page }">
	    		<a href="/issue/issueList?listType=${param.listType }&projectId=${param.projectId }${setUserId}${param.userId }&curPage=${page }">${page }</a>	
	    	</c:if>
	    </c:forEach>
	</div>
	
	<c:if test="${paging.totalPage eq curPage }">
		<a href="/issue/issueList?listType=${param.listType }&projectId=${param.projectId }" class="next" disabled="disabled" >Next</a>
	</c:if>
	<c:if test="${paging.totalPage ne curPage }">
		<a href="/issue/issueList?listType=${param.listType }&projectId=${param.projectId }${setUserId}${param.userId }&curPage=${paging.curPage+1 }" class="next">Next</a>
	</c:if>
</div>