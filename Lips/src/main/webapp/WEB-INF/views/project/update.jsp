<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/moment.min.js"></script>
<style>
.scrolltbody {
    display: block;
    width: 400px;
    border-collapse: collapse;
}
.scrolltbody th { border: 1px solid #000; background: pink; }
.scrolltbody td { border: 1px solid #000; border-top: 0; }
.scrolltbody tbody {
    display: block;
    height: 200px;
    overflow: auto;
}
.scrolltbody th:nth-of-type(1), .scrolltbody td:nth-of-type(1) { width: 120px; }
.scrolltbody th:nth-of-type(2), .scrolltbody td:nth-of-type(2) { width: 120px; }
.scrolltbody th:nth-of-type(3), .scrolltbody td:nth-of-type(3) { width: 120px; }
.scrolltbody th:last-child { width: 100px; }
.scrolltbody td:last-child { width: calc( 100px - 19px );  }


/* project_view */
.usertable {
	text-align: center;
	position: relative;
	right: 1em;
}

.viewProBox {
	height: 44em;
	overflow: hidden;
}

.viewProBtn {
	text-align: right;
	position: relative;
}

.viewTwinBox {
	display: inline-block;
	border: 1px solid gray;
	padding: 1em;
	margin: 1em;
	color: black;
	/* 	margin-left: 3em; */
	/* 	margin-right: 3em; */
	height: 39.5em;
		line-height: 3em;
}

.forPaging {
	margin: 8em;
}

/* user_view */
.view-form-row {
	width: 100%;
	margin: 1em;
}

.view-form-row .view-form-label {
	display: inline-block;
	width: 25%;
	margin-right: 5px;
}

.view-form-row .view-form-input {
	width: 60%;
}

.viewUserBox {
	height: 48.2em;
}

.viewUserBtn {
	bottom: -30%;
	text-align: center;
	position: relative;
}
</style>
<div class="row">
	<div class="h3 issueHeading">프로젝트 관리</div>
	<div class="panel myIssue">
		<div class="head">
			<strong>[${updatePageinfo.projectinfo.projectKey}]${updatePageinfo.projectinfo.projectName}</strong>
		</div>

		<div class="body">
			<div class="panel">
				<div class="viewProBox">
					<div class="row">

						<div class="col col-12">

							<div class="viewTwinBox col col-5"
								style="float: left; left: 3.5em;">

								<div class="btn">
									<strong>Project Info</strong>
								</div>
								<div class="view-form-row">
									<label for="proName" class="view-form-label">프로젝트 명</label> <input
										type="text" name="proName" id="proName"
										class="input view-form-input" readonly="readonly"
										value="${updatePageinfo.projectinfo.projectName }" />
								</div>

								<div class="view-form-row">
									<label for="proName" class="view-form-label">프로젝트 Key</label> <input
										type="text" name="proKey" id="proKey"
										class="input view-form-input" readonly="readonly"
										value="${updatePageinfo.projectinfo.projectKey }" />
								</div>

								<div class="view-form-row">
									<label for="proNum" class="view-form-label">참여인원</label> <input
										type="text" name="proNum" id="proNum"
										class="input view-form-input" readonly="readonly"
										value="${updatePageinfo.usercount } 명" />
								</div>

								<div class="view-form-row">
									<label for="proProgress" class="view-form-label">진행 상황</label>
									<c:if test="${updatePageinfo.projectinfo.status eq 'OPEN'}">
										<input type="text" name="proProgress" id="proProgress"
											class="input view-form-input" readonly="readonly" value="진행중" />
									</c:if>
									<c:if test="${updatePageinfo.projectinfo.status eq 'PENDING'}">
										<input type="text" name="proProgress" id="proProgress"
											class="input view-form-input" readonly="readonly" value="중단" />
									</c:if>
									<c:if test="${updatePageinfo.projectinfo.status eq 'CLOSE'}">
										<input type="text" name="proProgress" id="proProgress"
											class="input view-form-input" readonly="readonly" value="진행중" />
									</c:if>
								</div>

								<div class="view-form-row">
									<label for="proType" class="view-form-label">프로젝트 공개 여부</label>
									<c:if test="${updatePageinfo.projectinfo.projectOpen eq 1}">
										<input type="text" name="proType" id="proType"
											class="input view-form-input" readonly="readonly" value="공개" />
									</c:if>
									<c:if test="${updatePageinfo.projectinfo.projectOpen eq 0}">
										<input type="text" name="proType" id="proType"
											class="input view-form-input" readonly="readonly" value="비공개" />
									</c:if>
								</div>

								<div class="view-form-row">
									<label for="proIssue" class="view-form-label">등록된 이슈</label> <input
										type="text" name="proIssue" id="proIssue"
										class="input view-form-input" readonly="readonly"
										value="${updatePageinfo.issuecount } 개" />
								</div>

								<div class="view-form-row">
									<label for="proOpenDate" class="view-form-label">프로젝트
										개설일</label> <input type="text" name="proOpenDate" id="proOpenDate"
										class="input view-form-input" readonly="readonly"
										value="<fmt:formatDate value="${updatePageinfo.projectinfo.createDate }" pattern="yyyy-MM-dd " />" />
								</div>

								<div class="view-form-row">
									<label for="proProDate" class="view-form-label">프로젝트
										진행일</label> <input type="text" name="proProDate" id="proProDate"
										class="input view-form-input" readonly="readonly" />
								</div>
							</div>

							<div class="viewTwinBox col col-5"
								style="float: right; right: 3.5em;">
								<div class="btn">
									<strong>Project Memeber</strong>
								</div>

								<div class="view-form-row">
									<label for="userLeader" class="view-form-label">프로젝트 리더</label>
									<input type="text" name="userLeader" id="userLeader"
										class="input view-form-input" readonly="readonly"
										value="${updatePageinfo.projectinfo.projectLeader }" />
								</div>

								<div class="view-form-row">
									<label for="userMember" class="view-form-label">프로젝트 멤버</label>
									<div class="usertable">
									</div>
								</div>



<table class='scrolltbody table classic'>
	<thead>
		<tr>
			<th style="width:26.25%">#</th>
			<th style="width:26.3%"> 아이디 </th>
			<th style="width:26.5%"> 상태 </th>
			<th> 관리</th>
		</tr>
	</thead>
	
	<tbody>
		<%! int i =0; %>
		<c:forEach items="${updatePageinfo.projectUserinfo}" var="pminfo">
			<% i++; %>
			<tr id="${pminfo.userId }">
				<td><%=i%></td>
				<td>${pminfo.userId}</td>
				<td>
					<c:if test="${pminfo.userLevel eq '-1'}">프로젝트 탈퇴</c:if>
					<c:if test="${pminfo.userLevel eq '0'}">이용 정지</c:if>
					<c:if test="${pminfo.userLevel eq '1'}">참여중</c:if>
					<c:if test="${pminfo.userLevel eq '2'}">프로젝트리더</c:if>
				</td>
				<td style="text-align: center" >
					<c:set var="usercheck" value="${updatePageinfo.projectinfo.projectLeader }" />
					<c:choose>
						<c:when test="${pminfo.userId eq usercheck }"> <button id ="itsme=" class="btn focus">Leader</button></c:when>
						<c:when test="${pminfo.userLevel eq '0'}"> <button id ="pardon" class="btn focus" onclick="pardon(this)" value="${pminfo.userId}"> 정지 해제</button></c:when>
						<c:when test="${pminfo.userLevel eq '1'}"> <button id = "ban" class="btn" onclick="ban(this)" value="${pminfo.userId}"> 이용 정지</button></c:when>
		
						<c:otherwise>
							<button class="btn"> 메롱롱</button>
						</c:otherwise>
					</c:choose>
						<!-- 20181029 1.버튼 -유저레벨 변경 에이잭스로 처리  -->
				</td>
			</tr>
			
		</c:forEach>

	</tbody>
</table>
								


							</div>
							<!-- col col-5_ end  -->


						</div>
						<!-- col col-12_end -->
					</div>
					<!-- row_end -->
				</div>
			</div>
			<!-- body_end -->

			<div class="body">
				<div class=float-left>
					<i class="icon-return1"></i>
					<!-- 				<a class="btn normal focus">뒤로 가기</a> -->
				</div>

				<div class="viewProBtn">
					<a class="btn normal focus">사용자에게 공지</a> <a
						class="btn normal focus">프로젝트 재개</a> <a class="btn normal focus">프로젝트
						종료</a>
				</div>
			</div>


		</div>


	</div>


</div>

<script>
	$(document)
			.ready(
					function() {

						var cd = '<fmt:formatDate value="${updatePageinfo.projectinfo.createDate }" pattern="yyyy-MM-dd HH:mm:ss" />';
						//var cDate = new Date(cd.value);
						var diff = moment(cd).diff(moment());
						var absDiff = Math.abs(diff);
						var diffDay = Math.floor(absDiff
								/ (60 * 60 * 1000 * 24) * 1)
						var diffHour = Math
								.floor((absDiff % (60 * 60 * 1000 * 24))
										/ (60 * 60 * 1000) * 1)
						var diffMin = Math
								.floor(((absDiff % (60 * 60 * 1000 * 24)) % (60 * 60 * 1000))
										/ (60 * 1000) * 1)
						var remainTime = "";
						if (diffDay != 0)
							remainTime += diffDay + "일 ";
						if (diffHour != 0)
							remainTime += diffHour + "시간 ";
						remainTime += diffMin + "분 ";
						if (Math.sign(diff) < 0) {
							remainTime += "경과";
						} else
							remainTime += "남음";
						document.getElementById("proProDate").value = remainTime;

						
						
						
						
						
						
					});

	function ban(dom){
		var projectId = '${updatePageinfo.projectinfo.projectId}';
		var userId = '${pminfo.userId}';
		$.ajax({
			type : "post"
			, url : "/project/update/member/ban"
			, beforesend: function(){}
			, data:{ "userId" : dom.value,
					"projectId" : projectId}	
			, dataType:"json"
			, success : function(data) {
				//alert("해당 유저를 ban 하였음");

								//아이디에 추가하는방식 안돼
				$("tr#"+dom.value + " td:nth-child(3)").html("이용 정지");
				$("tr#"+dom.value + " td:nth-child(4)").html("<button class='btn focus' id='pardon' onclick='pardon(this)'>정지 해제</button>");
				//console.log($("tr#"+dom.value + " td:nth-child(2)").text());
				$("tr#"+dom.value + " td:nth-child(4) button").attr("value", $("tr#"+dom.value + " td:nth-child(2)").text());
				
									//아이디 값을 찾을 수 없어 넣을 수 없음
									// 방법 1ajax에서 아이디도 같이 보낸다.
				//$("#pardon").val("${pminfo.userId}");
			}, error : function() {console.log("밴 실패");
			}
			
			
		});
	
	}
	
	function pardon(dom){
		var projectId = '${updatePageinfo.projectinfo.projectId}';
		var userId = '${pminfo.userId}';
		$.ajax({
			type : "post"
			, url : "/project/update/member/pardon"
			, beforesend: function(){}
			, data:{ "userId" : dom.value,
					"projectId" : projectId}	
			, dataType:"json"
			, success : function(data) {
				//alert("ban 해제");
				$("tr#"+dom.value + " td:nth-child(3)").html("참여중");
				$("tr#"+dom.value + " td:nth-child(4)").html("<button class='btn' id='ban' onclick='ban(this)'>이용 정지</button>")
// 				console.log($("tr#"+dom.value + " td:nth-child(2)").text());
				$("tr#"+dom.value + " td:nth-child(4) button").attr("value", $("tr#"+dom.value + " td:nth-child(2)").text());
			}, error : function() {console.log("용서 실패");
			}
			
			
		});
	
	}

	
</script>

