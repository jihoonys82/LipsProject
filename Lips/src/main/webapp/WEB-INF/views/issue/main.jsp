<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="/resources/js/moment.min.js"></script>
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
.right{
	float:right;
	margin: 10px;
}
</style>
<div class="right">
	<a class="btn focus" href="/issue/create">새이슈</a>
</div>
<div class="row">
	<div class="col col-6 issueHeadline">
		<div class="h3" style="margin-bottom:15px">데드라인이 가까운 이슈</div>
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
					<td><span class="label success mini issueStage">${issueCloseDeadline.issueStage }</span></td>		
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
		<div class="h3" style="margin-bottom:15px">가장 많이 팔로잉 한 이슈</div>
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
<div class="row">
	<div class="col col-12 myIssue">
		<div class="panel">
			<div class="head">
				<strong>내게 할당된 이슈</strong>
				<c:if test="${issueAssigned.size() ne 0 }">					
					<a href="/issue/issueList?listType=AssignedIssue" class="btn focus small btnMore">더보기</a>
				</c:if>
			</div>
			<table id="tbAssigned" class="table classic hover">
				<thead>
					<tr>
						<th class="w-10">이슈번호</th>
						<th>제목</th>
						<th class="w-10">이슈 생성자</th>
						<th class="w-15">남은 기간</th>
						<th class="w-20">단계</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${issueAssigned.size() eq 0 }">
						<tr>
							<td colspan="5" style="text-align:center;">할당된 이슈가 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach items="${issueAssigned }" var="issue">
					<tr >
						<td class="issueLine">${issue.issueId }</td>
						<td class="issueLine" >${issue.issueTitle }</td>
						<td class="issueLine">${issue.createUser }</td>
						<td class="issueLine"><span class="countDate"><fmt:formatDate value="${issue.expectedEndDate}" pattern="yyyy/MM/dd HH:mm:ss"/></span></td>
						<td>
							<div class="myIssueStage">
								<button class="btn mini myIssueStageBtn stageDown"><span class="icon icon-chevron-left"></span></button>
								<span class="label mini success issueStage">${issue.issueStage}</span>
								<input type="hidden" value="${issue.issueStage }" />
								<input type="hidden" value="${issue.issueId }" />
								<button class="btn mini myIssueStageBtn stageUP"><span class="icon icon-chevron-right"></span></button>							
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
				<c:if test="${issueFollowing.size() ne 0 }">
					<a href="/issue/issueList?listType=FollowingIssue" class="btn focus small btnMore">더보기</a>						
				</c:if>
			</div>
			<table id="tbFollowing" class="table classic hover">
				<thead>
					<tr>
						<th class="myCols-1">이슈번호</th>
						<th>제목</th>
						<th class="myCols-1">이슈 생성자</th>
						<th class="myCols-1">이슈 담당자</th>
						<th class="myCols-2">남은 기간</th>
						<th class="myCols-2">단계</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${issueFollowing.size() eq 0 }">
						<tr>
							<td colspan="5" style="text-align:center;">팔로잉하는 이슈가 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach items="${issueFollowing }" var="folIssue">
						<tr>
							<td>${folIssue.issueId }</td>
							<td>${folIssue.issueTitle }</td>
							<td>${folIssue.createUser }</td>
							<td>${folIssue.assignee }</td>
							<td><span class="countDate"><fmt:formatDate value="${folIssue.expectedEndDate}" pattern="yyyy/MM/dd HH:mm:ss"/></span></td>
							<td>
								<div class="myIssueStage">
									<span class="label success mini issueStage">${folIssue.issueStage }</span>								
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	 </div>
</div>
<script>
$(document).ready(function() {		
		$(".issueLine").on('click',function(){
			var issueId = $(this).parent().children("td").eq(0).text();
			$(location).attr("href", "/issue/detail?issueId=" + issueId);
		});
		//stage Down
		$(".stageDown").on('click',function(){
			stageChange(this , 'down');
		});
		//stage Up
		$(".stageUP").on('click',function(){
			stageChange(this , 'up');
		});
		
	//countDate("countDate");
	var cdList = document.getElementsByClassName("countDate");

	for(i=0; i<cdList.length;i++) {
		if(cdList[i].innerText == ""){
			continue;
		}
		
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
	
	var stageChange = function(obj , changes) {
		var change = changes ;
		var issueId = $(obj).parent().children("input").eq(1).val();
// 		console.log(issueId);
// 		console.log(change);
		var allData = { "change": change, "issueId": issueId };
		
		$.ajax({
            type : 'post',
            url : '/issue/changeStage',
            dataType : 'JSON',
            data : allData,
            success : function(data){
                var stageId = data.stageId;
                var stageName = data.stageName;
                $(obj).parent().children("input").eq(0).val(stageId);
                $(obj).parent().children("span").text(stageName);
            }
        });

	}
});
</script>
