<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div style="height: 300px; margin: 3px; display:flex; align-items:center;">
<c:if test="${issues.size() ne 0 }">

<div class="issueList">
		<div class="panel col col-12" id="issueList">
			<div class="head">
				<div class="right">
					<a href="/issue/issueList?listType=${listType}&projectId=${projectId}" class="btn" style="float: right;">이슈 자세히 보기</a>
				</div>
			</div>
			<table class="table classic hover">
				<thead>
					<tr>
						<th>이슈 제목</th>
						<th>담당자</th>
						<th>남은기간</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${issues }" var="issue">
					<tr class="issueLine">
						<td>${issue.issueTitle }</td>
						<td>${issue.assignee }</td>
						<td><span class="countDateAllisueDeadLine"><fmt:formatDate value="${issue.expectedEndDate }" pattern="yyyy/MM/dd HH:mm:ss" /></span></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- end of panel -->
</div>
	</c:if>
	<c:if test="${issues.size() eq 0 }">
		<div class="navbar" style="width: 100%">
			<h2 style="margin: 10px; text-align: center;"> 
				이슈가 없습니다 <br>
				이슈를 생성해 주세요<br>
			</h2>
				<a style="float: right;" class="btn focus" href="/issue/create">이슈 생성</a>
		</div>
	</c:if>

</div>

<script>
$(document).ready(function() {

	
	
	$(".issueLine").on('click',function(){
		var issueId = $(this).children("td").eq(0).text();
		$(location).attr("href", "/issue/detail?issueId=" + issueId);
	});
	
	//countDate("countDate");
	var cdList = document.getElementsByClassName("countDateAllisueDeadLine");

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
	
	}
	
});
</script>
