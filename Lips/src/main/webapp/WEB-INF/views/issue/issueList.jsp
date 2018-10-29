<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style> 
.w-5 {
	width: 5%;
}
.w-10 {
	width: 10%;
}
.w-15 {
	width: 15%;
}
.w-20 {
	width: 20%;
}
.w-30 {
	width: 30%;
}
.w-40 {
	width: 39%;
}

.alignCenter {
	display: 		block; 
	text-align: 	center;
}

</style>
<div>
	<div class="row">
		<div class="h2">${listType }</div>
	</div>
	<div class="hr"></div>
	<div class="row">
		<div class="panel col col-12" id="issueList">
			<div class="head">
				<strong>Issue List</strong>
			</div>
			<table class="table classic hover">
				<thead>
					<tr>
						<th class="w-10">#</th>
						<th class="w-40">이슈 제목</th>
						<th class="w-5"><span class="icon icon-happy"></span></th>
						<th class="w-10">생성자</th>
						<th class="w-10">담당자</th>
						<th class="w-15">남은기간</th>
						<th class="w-10">단계</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${issues }" var="issue">
					<tr>
						<td>${issue.issueId }</td>
						<td>${issue.issueTitle }</td>
						<td><span class="icon icon-happy"></span></td>
						<td>${issue.createUser }</td>
						<td>${issue.assignee }</td>
						<td>${issue.expectedEndDate }</td>
						
						<td>${issue.issueStage }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- end of panel -->
	</div><!-- end of row -->
</div>