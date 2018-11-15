<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row mb-1">
	<div class="h2">Free Board</div>
</div>
<div class="hr"></div>
<div class="panel col col-12" id="freeboardList" style="padding: 10px;">
	<div style="margin: 10px; float: right;">
		<a class="btn focus" href="write">글쓰기</a>
	</div>
	<table class="table classic hover">
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="item">
				<tr onclick="viewBoard(${item.fboardId })">
					<td>${item.fboardId }</td>
					<td>${item.fboardTitle}</td>
					<td>${item.fboardWriter }</td>
					<td>${item.fboardWriteday }</td>
					<td>${item.readcnt }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div class="forSizing-pPaging">
	<div style="display: block; text-align: center;">
		<div class="paging" style="width: 350px;">
			<a href="/freeboard/list?curPage=${paging.curPage-1}" class="prev"
				style="display: block;">Prev</a>
			<div class="list">
				<c:forEach begin="${paging.startPage }" end="${paging.endPage}"
					var="page">
					<c:if test="${paging.curPage eq page }">
						<a href="/freeboard/list?curPage=${page }" class="active">${page }
					</c:if>
					<c:if test="${paging.curPage ne page }">
						<a href="/freeboard/list?curPage=${page}">${page }
					</c:if>
					</a>
				</c:forEach>
			</div>
			<a href="/freeboard/list?curPage=${paging.curPage+1 }" class="next">Next</a>
		</div>
	</div>
</div>
<div hidden="true">
<form id="freeboardform"  hidden="true" action="/freeboard/detail" method="get">
	<input name="fboardId" value="">
</form>
<input >

</div>
<script>
var viewBoard = function(freeboardId){

	var freeboardform = $("#freeboardform");
	freeboardform.children("input").val(freeboardId);
	freeboardform.submit();
	
}			
</script>
