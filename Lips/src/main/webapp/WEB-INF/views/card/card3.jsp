<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div style="height: 300px; margin: 3px; display:flex; align-items:center;">
<div class="issueHeadline">
		<h3 style="text-align: center;">가장 많이 팔로잉 한 이슈</h3>
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
					<td><span class="label success mini issueStage">${issueMostFollowed.issueStage }</span></td>		
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

<script>
$(document).ready(function() {
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