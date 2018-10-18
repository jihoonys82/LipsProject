<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="/resources/js/moment.min.js"></script>
<div class="row">
	<div class="col col-6 issueHeadline">
		<h3>데드라인이 가까운 이슈</h3>
		<table class="table classic stripeless">
			<thead>
				<tr>
					<th class="twidth">이슈 제목</th>
					<th>${issueCloseDeadline.issueTitle }</th>
				</tr>
			</thead>
		 	<tbody>
		 		<tr>
					<td>남은 기간 </td>	
					<td><span class="countDate"><fmt:formatDate value="${issueCloseDeadline.expectedEndDate}" pattern="yyyy/MM/dd HH:mm:ss"/></span></td>		
		 		</tr>
		 		<tr>
					<td>이슈 내용</td>
					<td>${issueCloseDeadline.issueContent }</td>		
		 		</tr>
		 		<tr>
					<td>이슈진행단계</td>
					<td>${issueCloseDeadline.issueStage }</td>		
		 		</tr>
		 		<tr>
					<td>이슈댓글 수</td>
					<td>${commentCloseDeadline }</td>		
		 		</tr>
		 		<tr>
					<td>팔로워 수</td>
					<td>${watcherCloseDeadline }</td>		
		 		</tr>
		 	</tbody>
		</table>
	</div>
	<div class="col col-6 issueHeadline">
		<h3>가장 많이 팔로잉 한 이슈</h3>
		<table class="table classic stripeless">
			<thead>
				<tr>
					<th class="twidth">이슈 제목</th>
					<th>${issueMostFollowed.issueTitle }</th>
				</tr>
			</thead>
		 	<tbody>
		 		<tr>
					<td>남은 기간</td>
					<td><span class="countDate"><fmt:formatDate value="${issueMostFollowed.expectedEndDate}" pattern="yyyy/MM/dd HH:mm:ss"/></span></td>		
		 		</tr>
		 		<tr>
					<td>이슈 내용</td>
					<td>${issueMostFollowed.issueContent }</td>		
		 		</tr>
		 		<tr>
					<td>이슈진행단계</td>
					<td>${issueMostFollowed.issueStage }</td>		
		 		</tr>
		 		<tr>
					<td>이슈댓글 수</td>
					<td>${commentMostFollowed }</td>		
		 		</tr>
		 		<tr>
					<td>팔로워 수</td>
					<td>${watcherMostFollowed }</td>		
		 		</tr>
		 	</tbody>
		</table>
	</div>
</div>
<div class="row">
	<div class="col col-12 myIssue">
		<div class="panel">
			<div class="head">
				<strong>내게 할당된 이슈</strong>
				<button class="btn focus small btnMore">더보기</button>
			</div>
			<table class="table classic hover">
				<thead>
					<tr>
						<th class="myCols-1">이슈번호</th>
						<th>제목</th>
						<th class="myCols-1">이슈 생성자</th>
						<th class="myCols-2">남은 기간</th>
						<th class="myCols-2">단계</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${issueAssigned }" var="issue">
					<tr>
						<td>${issue.issueId }</td>
						<td>${issue.issueTitle }</td>
						<td>${issue.createUser }</td>
						<td><span class="countDate"><fmt:formatDate value="${issue.expectedEndDate}" pattern="yyyy/MM/dd HH:mm:ss"/></span></td>
						<td>
							<div class="myIssueStage">
								<button class="btn btn-small myIssueStageBtn"><span class="icon icon-chevron-left"></span></button>
								${issue.issueStage }
								<button class="btn btn-small myIssueStageBtn"><span class="icon icon-chevron-right"></span></button>							
							</div>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	 </div>
</div>

<div class="row">
	<div class="col col-12 myIssue">
		<div class="panel">
			<div class="head">
				<strong>내가 팔로잉한 이슈</strong>
				<button class="btn focus small btnMore">더보기</button>
			</div>
			<table class="table classic hover">
				<thead>
					<tr>
						<th class="myCols-1">이슈번호</th>
						<th>제목</th>
						<th class="myCols-1">이슈 생성자</th>
						<th class="myCols-1">이슈 담당자</th>
						<th class="myCols-2">남은 기간</th>
						<th class="myCols-1">단계</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${issueFollowing }" var="folIssue">
						<tr>
							<td>${folIssue.issueId }</td>
							<td>${folIssue.issueTitle }</td>
							<td>${folIssue.createUser }</td>
							<td>${folIssue.assignee }</td>
							<td><span class="countDate"><fmt:formatDate value="${folIssue.expectedEndDate}" pattern="yyyy/MM/dd HH:mm:ss"/></span></td>
							<td>${folIssue.issueStage }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	 </div>
</div>
<script>
$(document).ready(function() {
	//countDate("countDate");
	var cdList = document.getElementsByClassName("countDate");

	for(i=0; i<cdList.length;i++) {
		
		var cDate = new Date(cdList[i].innerText);
		var diff = moment(cDate).diff(moment());
		var	diffDay		= Math.floor(diff / (60 * 60 * 1000 * 24) * 1)
		var	diffHour	= Math.floor((diff % (60 * 60 * 1000 * 24)) / (60 *60 * 1000) * 1)
		var	diffMin		= Math.floor(((diff % (60 * 60 * 1000 * 24)) % (60 * 60 * 1000)) / (60 * 1000) * 1)
		var remainTime 	= "";
		if(diffDay !=0) 	remainTime += diffDay+"일 ";
		if(diffHour !=0) 	remainTime += diffHour +"시간 ";
		remainTime += diffMin +"분 ";
		if(Math.sign(diff)<0) {
			remainTime +="지남";
			cdList[i].style.color= "#FF0000";
		}
		else remainTime +="남음";
	
		cdList[i].innerText = remainTime;
	}
});
</script>
