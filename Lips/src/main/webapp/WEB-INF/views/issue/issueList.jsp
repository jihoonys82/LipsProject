<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
.mt-1 {
	margin-top : 	1em;
}
.mb-1 {
	margin-bottom:	1em;
}
.alignCenter {
	display: 		block; 
	text-align: 	center;
}
.issueList{
	padding:10px;
}

.issueListPaging{
	width: 500px;
}
.alignCenter {
	display: 		block; 
	text-align: 	center;
}
.right{
	float:right;
}
</style>
<div class="issueList">
	<div class="row mb-1">
		<div class="h2">${listType }</div>
	</div>
	<div class="hr"></div>
	<div class="row mt-1 mb-1">
		<div class="panel col col-12" id="issueList">
			<div class="head">
				<strong>Issue List</strong>
				<div class="right">
					<a class="btn focus small" href="/issue/create">새이슈</a>
				</div>
			</div>
			<table class="table classic hover">
				<thead>
					<tr>
						<th class="w-10">#</th>
						<th>이슈 제목</th>
						<th class="w-5"><span class="icon icon-happy"></span></th>
						<th class="w-10">생성자</th>
						<th class="w-10">담당자</th>
						<th class="w-20">남은기간</th>
						<th class="w-10">단계</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${issues }" var="issue">
					<tr class="issueLine">
						<td>${issue.issueId }</td>
						<td>${issue.issueTitle }</td>
						<td><span class="icon icon-happy"></span></td>
						<td>${issue.createUser }</td>
						<td>${issue.assignee }</td>
						<td><span class="countDate"><fmt:formatDate value="${issue.expectedEndDate }" pattern="yyyy/MM/dd HH:mm:ss" /></span></td>
						<td class="alignCenter">
							<div class="myIssueStage">
								<span class="label success mini issueStage">${issue.issueStage }</span>								
							</div>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- end of panel -->
	</div><!-- end of row -->
	<div class="row">
		<div class="col col-3"></div>
		<div class="col col-6">
			<jsp:include page="/WEB-INF/views/issue/issuePaging.jsp" />
		</div>
	</div>
</div>

<script type="text/javascript" src="/resources/js/moment.min.js"></script>
<script>
$(document).ready(function() {
	
	$(".issueLine").on('click',function(){
		var issueId = $(this).children("td").eq(0).text();
		$(location).attr("href", "/issue/detail?issueId=" + issueId);
	});
	
	//countDate("countDate");
	var cdList = document.getElementsByClassName("countDate");

	for(i=0; i<cdList.length;i++) {
		
		var cDate = new Date(cdList[i].innerText);
		var diff = moment(cDate).diff(moment());
		var absDiff = Math.abs(diff);
		var	diffDay		= Math.floor(absDiff / (60 * 60 * 1000 * 24) * 1)
		var	diffHour	= Math.floor((absDiff % (60 * 60 * 1000 * 24)) / (60 *60 * 1000) * 1)
		var	diffMin		= Math.floor(((absDiff % (60 * 60 * 1000 * 24)) % (60 * 60 * 1000)) / (60 * 1000) * 1)
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
	
	//issue Stage id to stage Name
	var stageNum = document.getElementsByClassName("issueStage");
	
	<c:forEach items="${issueStage}" var="stage">
		for(var i=0;i<stageNum.length;i++) {
			if("${stage.stageAssetId}" == stageNum[i].innerHTML){
				stageNum[i].innerHTML = "${stage.stageName}";
				if(stageNum[i].innerHTML == "99"){
					stageNum[i].classList.remove("success");
				}
			}
		} 	
	</c:forEach>
	
});
</script>
