<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/moment.min.js"></script>
<style>
.active {
	background: #835acc;
}

.scrolltbody {
	display: block;
	width: 320px;
	border-collapse: collapse;
}

.scrolltbody th {
	border: 1px solid #000;
	background: pink;
}

.scrolltbody td {
	border: 1px solid #000;
	border-top: 0;
}

.scrolltbody tbody {
	display: block;
	height: 200px;
	overflow: auto;
}

.scrolltbody th:nth-of-type(1), .scrolltbody td:nth-of-type(1) {
	width: 20px;
}

.scrolltbody th:nth-of-type(2), .scrolltbody td:nth-of-type(2) {
	width: 40px;
}

.scrolltbody th:nth-of-type(3), .scrolltbody td:nth-of-type(3) {
	width: 70px;
}

.scrolltbody th:nth-of-type(4), .scrolltbody td:nth-of-type(4) {
	width: 90px;
}

.scrolltbody th:last-child {
	width: 100px
}

.scrolltbody td:last-child {
	width: calc(100px - 19px);
}

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
	height: 41em;
	line-height: 2.6em;
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
		<div class="head" id="head">
			<strong>[${updatePageinfo.projectinfo.projectKey}]${updatePageinfo.projectinfo.projectName}</strong>
		</div>

		<div class="body">
			<div class="panel">
				<div class="viewProBox">
					<div class="row">

						<div class="col col-12">

							<div class="viewTwinBox col col-5"
								style="float: left; left: 3.5em;">

								<div>
									<strong class="btn">Project Info</strong>
									<button class="btn focus" id="projectUpdate"
										style="float: right;">변경사항 저장</button>
								</div>
								<div class="view-form-row">
									<label for="proName" class="view-form-label">프로젝트 명</label> <input
										type="text" name="proName" id="proName"
										class="input view-form-input"
										value="${updatePageinfo.projectinfo.projectName }" />
								</div>

								<div class="view-form-row">
									<label for="proName" class="view-form-label">프로젝트 Key</label> <input
										type="text" name="proKey" id="proKey"
										class="input view-form-input"
										value="${updatePageinfo.projectinfo.projectKey }" />
								</div>


								<div class="view-form-row">
									<label for="proNum" class="view-form-label">참여인원</label> <input
										type="text" name="proNum" id="proNum"
										class="input view-form-input" readonly="readonly"
										value="${updatePageinfo.usercount } 명" />
								</div>

								<div class="view-form-row">


									<label for="proNum" class="view-form-label">프로젝트 카테고리</label>

									<div id="catecate" style="display: inline;">
									<c:forEach items="${updatePageinfo.issueCategory}" var="is">
										<span class="label small danger">${is.assetName}</span>
									</c:forEach>
									</div>
									<button type="button" class="btn small focus" id="CateShow">
										<i class="icon-gear"></i>
									</button>


								</div>

								<div class="view-form-row">

									<label for="button_2" class="view-form-label">진행상황</label>
									<div id="button_2" class="group">
										<c:if test="${updatePageinfo.projectinfo.status eq 'PENDING'}">
											<a class="btn small  focus" value="true">일시 정지</a>
											<a class="btn small" value="false">진행 중</a>
										</c:if>

										<c:if test="${updatePageinfo.projectinfo.status eq 'OPEN'}">

											<a class="btn small" value="true">일시 정지</a>
											<a class="btn small focus" value="false">진행 중</a>
										</c:if>


										<c:if test="${updatePageinfo.projectinfo.status eq 'CLOSE'}">

											<span>프로젝트 종료</span>
										</c:if>
									</div>




								</div>

								<div class="view-form-row">
									<label for="button_1" class="view-form-label">프로젝트 공개
										여부</label>
									<div id="button_1" class="group">
										<c:if test="${updatePageinfo.projectinfo.projectOpen eq 0}">
											<a class="btn small  focus" value="true">비공개</a>
											<a class="btn small" value="false">공개</a>
										</c:if>

										<c:if test="${updatePageinfo.projectinfo.projectOpen eq 1}">

											<a class="btn small" value="true">비공개</a>
											<a class="btn small focus" value="false">공개</a>
										</c:if>
									</div>

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




								<div class="view-form-row">
									<label for="proProInviteCode" class="view-form-label">프로젝트
										초대 코드</label>
									<div id="combo_2" class="combo">
										<a class="btn" id="invitecode"
											style="width: 20em; border-color: #4f4f4f; background: #2a2a2a; color: white !important;">
											${updatePageinfo.invitecode.inviteCode }</a> <a
											class="btn toggle" id="inviteRefresh"><i
											class="icon-refresh"></i></a>

									</div>
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
									<div class="usertable"></div>
								</div>



								<table class='scrolltbody table classic'>
									<thead>
										<tr>
											<th>#</th>
											<th>아이디</th>
											<th>상태</th>
											<th>유저 관리</th>
											<th>리더 변경</th>
										</tr>
									</thead>
									<!-- 스크롤바 지우기 기능은 남아있음 -->
									<tbody style="-webkit-scrollbar {width: 0px;"}>

										<c:forEach items="${updatePageinfo.projectUserinfo}"
											var="pminfo" varStatus="a">

											<tr id="${pminfo.userId }">
												<td>${a.index +1 }</td>
												<td>${pminfo.userId}</td>
												<td><c:if test="${pminfo.userLevel eq '-1'}">프로젝트 탈퇴</c:if>
													<c:if test="${pminfo.userLevel eq '0'}">이용 정지</c:if> <c:if
														test="${pminfo.userLevel eq '1'}">참여중</c:if> <c:if
														test="${pminfo.userLevel eq '2'}">프로젝트리더</c:if></td>
												<td><c:set var="usercheck"
														value="${updatePageinfo.projectinfo.projectLeader }" /> <c:choose>
														<c:when test="${pminfo.userId eq usercheck }">
															<button id="itsme=" class="btn focus">Leader</button>
														</c:when>
														<c:when test="${pminfo.userLevel eq '0'}">
															<button id="pardon" class="btn focus"
																onclick="pardon(this)" value="${pminfo.userId}">
																정지 해제</button>
														</c:when>
														<c:when test="${pminfo.userLevel eq '1'}">
															<button id="ban" class="btn" onclick="ban(this)"
																value="${pminfo.userId}">이용 정지</button>
														</c:when>

														<c:otherwise>
															<button class="btn">메롱롱</button>	
														</c:otherwise>
													</c:choose> </td>
													<td><c:set var="usercheck"
														value="${updatePageinfo.projectinfo.projectLeader }" /> <c:choose>
														<c:when test="${pminfo.userId eq usercheck }">
															<button class="btn focus">Leader</button>
														</c:when>
														<c:otherwise>
															<button class="btn focus leader" onclick="leader(this)" value="${pminfo.userId}">리더 위임</button>
														</c:otherwise>
													</c:choose> </td>
													

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

				<div class="viewProBtn" id="closemama">



					<c:choose>
						<c:when test="${updatePageinfo.projectinfo.status eq 'CLOSE'}">
						</c:when>

						<c:otherwise>
							<a
								href="/issue/setupIssueStage?projectId=${updatePageinfo.projectinfo.projectId}"><button
									class="btn normal focus" id="Custom" style="bottom: 2em;">이슈
									진행단계 커스텀</button></a>
							<button class="btn normal focus" id="ProjectClose"
								style="bottom: 2em;">프로젝트 종료</button>
						</c:otherwise>
					</c:choose>










				</div>
			</div>


		</div>


	</div>


</div>




<!-- 윈도우모달  종료처리 -->

<div id="win_2" class="window">
	<div class="head">
		<div class="left">ProjectClose</div>
		<div class="right">
			<a href="#" class="close"><i class="icon-exit"></i></a>
		</div>
	</div>
	<div class="body" style="text-align: center; font-size: 1.5em">
		<br>
		<h5>정말 해당 프로젝트를 종료처리 하시겠습니까?</h5>
		<h5>프로젝트를 종료처리하시면 다시는 되돌릴 수 없습니다.</h5>
	</div>
	<div class="foot" align="center">
		<a href="#" class="btn focus" id="modalProjectClose">예 종료처리하겠습니다.</a>
		<a href="#" class="btn" id="jucancel">아니오 취소할게요.</a>
	</div>
</div>
<!-- 윈도우 모달 끝  -->

<!-- 윈도우모달 프로젝트리더넘기기 -->

<div id="win_3" class="window">
	<div class="head">
		<div class="left">
			<span>경고</span>
		</div>
		<div class="right">
			<a href="#" class="close"><i class="icon-exit"></i></a>
		</div>
	</div>
	<div class="body" style="text-align: center; font-size: 1.5em">
		<br>
		<h5>프로젝트 리더를 변경하시겠습니까?</h5>
		<h5>프로젝트 리더를 위임하시면 더 이상 프로젝트 관리페이지를 확인할 수 없습니다.</h5>
	</div>
	<div class="foot" align="center">
		<a href="#" class="btn focus" id="modalProjectLeader">예 새로운 프로젝트
			리더가 필요합니다.</a> <a href="#" class="btn" id="leadercancel">아니오 취소할게요.</a>
	</div>
</div>
<!-- 윈도우 모달 끝  -->

<!-- 카테고리 윈도우모달 -->
<div id="win_4" class="window">
	<div class="head">
		<div class="left">
			<span>변경할 테이블을 드래그하세요</span>
		</div>
		<div class="right">
			<a href="#" class="close"><i class="icon-exit"></i></a>
		</div>
	</div>
	<div class="body" style="text-align: center; font-size: 1.5em">
		<table id="table_20" class="table classic">
			<thead>
				<tr>
					<th style="text-align: center; width: 15%">Id</th>
					<th style="text-align: center; width: 15%">Code</th>
					<th style="text-align: center; width: 20%">Name</th>
					<th style="text-align: center">Desc</th>
				</tr>
			</thead>
			<tbody id="20body"></tbody>
		</table>


		<table id="table_21" class="table classic"
			style="margin-top: 30px; margin-bottom: 80px">
			<thead>
				<tr>
					<th style="text-align: center; width: 10%">Id</th>
					<th style="text-align: center; width: 15%">Name</th>
					<th style="text-align: center; width: 15%">Code</th>
					<th style="text-align: center">Desc</th>
				</tr>
			</thead>

			<tbody id="21body">
				<c:forEach items="${updatePageinfo.allCategory}" var="c">
					<tr class="catItem">
						<td class="itemId">${c.categoryAssetId }</td>
						<td class="itemName">${c.assetName}</td>
						<td class="itemCode">${c.assetCode}</td>
						<td><span class="itemDesc">${c.assetDescription}</span> <span
							value="${c.assetName}"
							style="background-color: #966ee5; float: right; border-radius: 3px; width: 15px;"><i
								class="icon-plus"></i></span></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>


		<!--  2018 11 12 모영호 여기까지함 에이잭스로 저장 처리하기-->
		<button type="button" class="btn focus" id="CateSave">카테고리 저장</button>
		<button type="button" class="btn focus" id="CateClose">닫기</button>



	</div>
	<script data-jui="#table_20" data-tpl="row" type="text/template">
    <tr>
		<td class="catId"><!= id !></td>
        <td><!= code !></td>
        <td><!= name !></td>
		<td>
			<!= desc !>
			<span class="deleteCat" style="background-color: #966ee5;float: right;border-radius: 3px; width: 15px;"><input class="hiddenCate"type="text" value="<!= id !>" style="visibility: hidden; display: contents"> <i class="icon-minus"></i></span>
		</td>
    </tr>
</script>
</div>
<!-- 윈도우 모달 끝  -->


<!-- 카테고리 윈도우모달 속 윈도우모달  -->
<!-- 끝  -->

<script type="text/javascript">
var status = "${updatePageinfo.projectinfo.status}";
var projectOpen = "${updatePageinfo.projectinfo.projectOpen}";
var userId;

	$(document).ready(function() {
		
		$("#newCate").click(function(){
			
			console.log("눌린다");
		});
		
		
		$("#jucancel").click(function(){
			win_2.hide();
		});
		
		$("#ProjectClose").click(function() {
			   win_2.show();
			});
		
		$("#CateShow").click(function() {
			   win_4.show();
			   
			   
			});
		$("#CateClose").click(function() {
			   win_4.hide();
			});
      
		$(".leader").click(function(){
			userId = $(this).val();
			console.log(userId);
			win_3.show();
		});
		
		// 이상하게 요게 안먹네 그래서 위에걸로 대체
// 		function leader(dom){
// 			userId = dom.value;
// 			 win_3.show();
// 		}
		
		$("#leadercancel").click(function(){
			win_3.hide();
		});
		
		//카테고리 세이브
	$("#CateSave").click(function() {
		console.log("#cateSave click");
		
		if(!($("#20body tr").length >0)){
			alert("최소 1개 이상의 카테고리를 저장해야 합니다.");
			return false;
		}
		
		var projectId = '${param.projectId}';
		//제이슨 객체 배열 받기
		//01. 자바 배열을 만든다
		var arr = [];		
	$("#20body tr").each(function(i) {
		//02. 제이슨 객체를 만든다.
		var obj = {};
		 jQuery.ajaxSettings.traditional = true;//jsonObject를 controller의 형식에 맞춰 받기 위함
		obj["categoryOrder"] = i+1;
		obj["categoryAssetId"] = Number($(this).find("td.catId").text());
		obj["projectId"] = projectId;
		//03. 제이슨 객체를 넣을때 스트링파이 해서 제이슨 문자열을 넣는다.
		arr.push(JSON.stringify(obj));
	});
	

	$.ajax({
		type : "post"
			, url : "/project/update/category"
			, beforesend: function(){
				
			}
// 			, data : { "arrlist" : JSON.stringify(arr),
			// 04. 자바 배열을 제이슨 타입으로 해서 보낸다
			// 05. 컨트롤러로 
			, data : { "arrlist" : JSON.stringify(arr),
					   "projectId" : projectId	
			}
			, success : function(data) {
				console.log("하하");
				//console.log(data.result[0].assetDescription);
				$("#catecate").html("");
					  for(var i=0;i<data.result.length;i++){
	                	 {
	                		 
	                		 $("#catecate").append("<span class='label small danger'>"+data.result[i].assetName+"</span> ");
	                		 
	                	}
	                }
					  win_4.hide();
					  alert("프로젝트 카테고리가 변경되었습니다.");
				
			}
			, error : function() {console.log("카테고리 저장 실패");}
		  })
	
		});	
		
		
		//////////////

$("#modalProjectLeader").click(function() {
	var projectId = '${param.projectId}';
	
$.ajax({
type : "post"
	, url : "/project/update/leader"
	, beforesend: function(){}
	, data : {
			"projectId": projectId,
			"userId" : userId
	}
	, dataType: "json"
	, success : function(data) {
		console.log("프로젝트 종료 성공");
// 		 win_3.hide();
		 alert("새로운 프로젝트 리더가 등록되었습니다.");	
		 $(location).attr('href', '/project/main');
		
		
	
	}
	, error : function() {console.log("프로젝트 종료 처리 실패");}
  })
});

		////////////
		
		
		
		
		//프로젝트 종료처리	
				$("#modalProjectClose").click(function() {
					var projectId = '${param.projectId}';
			$.ajax({
				type : "post"
					, url : "/project/close"
					, beforesend: function(){
						
						
					}
					, data : {
							"projectId": projectId
					}
					, dataType: "json"
					, success : function(data) {
						console.log("프로젝트 종료 성공");
						
					
						 $("#button_2").html("<span>프로젝트 종료</span>");
						 $("#closemama").html("");
						 win_2.hide();
						 alert("해당 프로젝트가 종료처리 되었습니다.");	
			
						
						
					
					}
					, error : function() {console.log("프로젝트 종료 처리 실패");}
				  })
		});
		
		
		
		
		
		
		//초대코드 다시만들기
			$("#inviteRefresh").click(function() {
		var projectKey ='${updatePageinfo.projectinfo.projectKey}';
		 
			$.ajax({
				type : "post"
					, url : "/project/reinvitecode"
					, beforesend: function(){}
					, data : {
							"projectKey" : projectKey 
					}
					, dataType: "json"
					, success : function(data) {
						
// 						 $("#invitecode").html(data.result);
						 $("#invitecode").text(data.result);
							 
						
// 						alert(data.result+"초대코드를 재생성하였습니다.");
						
						
					
					}
					, error : function() {console.log("초대코드 재생성 실패");}
				  })
		});

		
		
		
		
		
		$("#projectUpdate").click(function() {
		var projectId = '${param.projectId}';
			$.ajax({
				type : "post"
					, url : "/project/update/project"
					, beforesend: function(){}
					, data : {
							"projectId": projectId
							,"projectName": $("#proName").val()
							,"projectKey" : $("#proKey").val()
							,"status" : status
							,"projectOpen" : projectOpen
							,"invitecode" : $("#invitecode").text()
		               
							
						
					}
					, dataType: "json"
					, success : function(data) {
// 						console.log("프로젝트 업데이트 성공");
// 						console.log(data.result);
// 					$("#head").html("<strong>["+data.ProjectKey"]"+data.ProjectName"</strong>");
					$("#head").html("<strong>"+"["+data.ProjectKey+"]"+data.ProjectName+"</strong>");
							alert("프로젝트 정보를 수정하였습니다.");
// 							
						
						
						
					
					}
					, error : function() {console.log("프로젝트 업데이트 실패");}
				  })
		});
		
		
		

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
				alert("해당 유저를 ban 하였음");
				
				$("tr#"+dom.value + " td:nth-child(3)").html("이용 정지");
				$("tr#"+dom.value + " td:nth-child(4)").html("<button class='btn focus' id='pardon' onclick='pardon(this)'>정지 해제</button>");
				$("tr#"+dom.value + " td:nth-child(4) button").attr("value", $("tr#"+dom.value + " td:nth-child(2)").text());
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
				alert("ban 해제");
				$("tr#"+dom.value + " td:nth-child(3)").html("참여중");
				$("tr#"+dom.value + " td:nth-child(4)").html("<button class='btn' id='ban' onclick='ban(this)'>이용 정지</button>")
				$("tr#"+dom.value + " td:nth-child(4) button").attr("value", $("tr#"+dom.value + " td:nth-child(2)").text());
			}, error : function() {console.log("용서 실패");
			}
			
			
		});
	
	}
	jui.ready([ "ui.button" ], function(button) {
		
		
		
	    button_1 = button("#button_1", {
	        type: "radio",
	        index: ${updatePageinfo.projectinfo.projectOpen},
	        event: {
	            change: function(data) {
// 	                alert("index(" + data.index + "), value(" + data.value + ")");
	                
	                projectOpen = data.index;
	                var btns = document.getElementById("button_1");
	                var arr = btns.getElementsByTagName("a");
	                for(var i=0;i<arr.length;i++){
	                	if(data.index == i) {
	                		arr[i].classList.add("focus");
	                	} else {
	                		arr[i].classList.remove("focus");
	                	}
	                }
	                
	                

	                	
	            }
	        }
	    });
	    
	    
	    
	    
	   
	    var A = ("${updatePageinfo.projectinfo.status}"=="PENDING")?0:1;
	    
	    button_2 = button("#button_2", {
	        type: "radio",
	        index: A,
	        event: {
	            change: function(data) {
// 	                alert("index(" + data.index + "), value(" + data.value + ")");
	                 status = (data.index == 0)? "PENDING":"OPEN"
	                var btns = document.getElementById("button_2");
	                var arr = btns.getElementsByTagName("a");
	                for(var i=0;i<arr.length;i++){
	                	if(data.index == i) {
	                		arr[i].classList.add("focus");
	                	} else {
	                		arr[i].classList.remove("focus");
	                	}
	                }
	
	            }
	        }
	    });
	    
	   
	    
	});
	
	jui.ready([ "ui.window" ], function(win) {
	    win_2 = win("#win_2", {
	        width: 500,
	        height: 300,
	        modal: true
	    });
	    
	    win_3 = win("#win_3", {
	        width: 500,
	        height: 300,
	        modal: true
	    });
	    
	    win_4 = win("#win_4", {
	        width: 700,
	        height: 400,
	        modal: true
	    });
	    
	});

	
	

</script>

<script>
jui.ready([ "grid.table" ], function(table) {
		
		var arr =new Array();
	    	<c:forEach items="${updatePageinfo.issueCategory}" var="cat" varStatus="a">
	    		var obj = {};
	    		obj["id"] = "${cat.categoryAssetId}";
    			obj["code"] = "${cat.assetCode}";
    			obj["name"] = "${cat.assetName}";
    			obj["desc"] = "${cat.assetDescription}";
    			arr.push(obj);
	    	</c:forEach>
// 	   var val = JSON.stringify(arr);
	   
		table_20 = table("#table_20", {

	    	fields: ["id","code", "name", "desc" ],
	    	 data: arr,
	        moveRow: true,
	        event: {
	            move: function(row, e) {
	                return null;
//	                confirm("Do you want to change the row position?");
	            },
	            moveend: function(row, e) {
	                console.log("Completed.");
	            }
	        }
	    });
		
	
		$("tr.catItem").on('click', function(){
		
			var id = $(this).find("td.itemId").text();
			var code = $(this).find("td.itemCode").text();
			var name = $(this).find("td.itemName").text();
			var desc = $(this).find("span.itemDesc").text();
			
	
			var ret = false;
			//#table_20인 애들 의 자식 중에서  td 인 애들  하나씩 찾아서
													//i를 넣으면 몇번째 회차인지 알 수있음
			$("#table_20 tr td.catId").each(function(i) {
			// 조건문을 건다 찾은애들의 text가  '버그리포트인가'
				if( $(this).text() == id) {
// 					console.log(i);
					ret = true;
			    }
			});
			//존재한다면 콘솔로그 출력
			if( ret ) {
				alert("이미 존재하는 카테고리 입니다.");
				
			} else if(!ret) {
				
				table_20.append({"id" : id, "code": code, "name" : name, "desc": desc});
			}	
		});
		
		
		
// 		$("span.deleteCat").on('click', function(){
// 			console.log(this);
// 				table_20.remove(0);
// 		});

		//동적객체에 이벤트 걸기
		$(document).on("click","span.deleteCat",function(){ 
		
			var num=$(this).find("input.hiddenCate").val();
			$("#table_20 tr td.catId").each(function(i) {
			
				if( $(this).text() == num) {
					table_20.remove(i);
					
			    }
				
			});
// 				
		});
	});</script>
