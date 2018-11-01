<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<style>
.item textarea{
	color		: black;
}

.item select,.item select option {
	color : black;
}

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



</style>
<script type="text/javascript" src="/resources/js/moment.min.js"></script>
    
	<div class="panel">
		<div class="body">
			<div class="viewProBox">
			<div class="row">
			
				<div class="col col-12">	
					
					<div class="viewTwinBox col col-5">
						<div class="infomation">프로젝트 정보</div>
							<div class="view-form-row">
							<label for="proName" class="view-form-label">프로젝트 명</label>
							<input type="text" name="proName" id="proName" class="input view-form-input" readonly="readonly"
								value="${proInfo.projectName }"/>
							</div>
							
							<div class="view-form-row">
							<label for="proNum" class="view-form-label">참여인원</label>
							<input type="text" name="proNum" id="proNum" class="input view-form-input" readonly="readonly"
								value="${pList[0] } 명" /> 
							</div>
									
							<div class="view-form-row">
							<label for="proProgress" class="view-form-label">진행 상황</label>
								<c:if test="${proInfo.status eq 'OPEN'}">
									<input type="text" name="proProgress" id="proProgress" class="input view-form-input" readonly="readonly"
										value="진행중"/> 
								</c:if>
								<c:if test="${proInfo.status eq 'PENDING'}">
									<input type="text" name="proProgress" id="proProgress" class="input view-form-input" readonly="readonly"
										value="중단"/> 
								</c:if>
								<c:if test="${proInfo.status eq 'CLOSE'}">
									<input type="text" name="proProgress" id="proProgress" class="input view-form-input" readonly="readonly"
										value="종료"/> 
								</c:if>
							</div>

							<div class="view-form-row">
							<label for="proType" class="view-form-label">프로젝트 공개 여부</label>
								<c:if test="${proInfo.projectOpen eq 1}">
									<input type="text" name="proType" id="proType" class="input view-form-input" readonly="readonly"
										value="공개"/> 
								</c:if>
								<c:if test="${proInfo.projectOpen eq 0}">
									<input type="text" name="proType" id="proType" class="input view-form-input" readonly="readonly"
										value="비공개"/> 								
								</c:if>
							</div>				
													
							<div class="view-form-row">
							<label for="proIssue" class="view-form-label">등록된 이슈</label>
							<input type="text" name="proIssue" id="proIssue" class="input view-form-input" readonly="readonly"
								value="${pList[1] } 개"/> 
							</div>
							
							<div class="view-form-row">
							<label for="proOpenDate" class="view-form-label">프로젝트 개설일</label>
							<input type="text" name="proOpenDate" id="proOpenDate" class="input view-form-input" readonly="readonly"
								value="<fmt:formatDate value="${proInfo.createDate }" pattern="yyyy-MM-dd" />"/> 
							</div>
							
							<div class="view-form-row">
								<label for="proProDate" class="view-form-label">프로젝트 경과 시간</label>
									<span id="proProDate"><fmt:formatDate value="${proInfo.createDate}" pattern="yyyy/MM/dd HH:mm:ss" /></span>
<!-- 								<input type="text" name="proProDate" id="proProDate" class="input view-form-input" readonly="readonly"  -->
<%-- 									value="<fmt:formatDate value="${proInfo.createDate}" pattern="yyyy/MM/dd HH:mm:ss" />" />  --%>
							</div>
					</div>		
									
					<div class="viewTwinBox col col-5">
						<div class="infomation">참여인원 정보</div>
					
							<div class="view-form-row">
								<label for="userLeader" class="view-form-label">프로젝트 리더</label>
								<input type="text" name="userLeader" id="userLeader" class="input view-form-input" readonly="readonly"
									value="${proInfo.projectLeader }"/> 
							</div>

							<div class="view-form-row">
 								<label for="userMember" class="row view-form-label">
 								
 								<h4>프로젝트 멤버</h4></label>
								
								<table class='scrolltbody table classic'>
									<thead>
										<tr>
											<th style="width:100%">#</th>
											<th style="width:100%"> 아이디 </th>
										</tr>
									</thead>
	
									<tbody>
										<c:if test="${uPInfo[0].userId ne null}">	
											<%! int i = 0; %>
											<c:forEach items="${uPInfo}" var="uPInfo">
												<% i++; %>
												<tr id="${uPInfo.userId}">
													<td><%=i%></td>
													<td style="text-align: center">${uPInfo.userId}</td>
												</tr>
											</c:forEach>
										</c:if>
		
										<c:if test="${uPInfo[0].userId eq null}">
											<tr>
												<td> </td>
												<td>참여멤버 없음</td>
												<td> </td>
											</tr>
										</c:if>
	
									</tbody>
								</table>	

							</div>
							
					</div> <!-- col col-5_ end  -->
										
				
				</div> <!-- col col-12_end -->
			</div>	<!-- row_end -->
			</div>
		</div>	<!-- body_end -->
		
		<div class="body">

			<div class="viewProBtn">
				<c:choose>
					<c:when test="${proInfo.status eq 'OPEN'}">
						<a class="btn normal focus" onclick="modalNotice.show();">리더에게 공지</a>
						<a class="btn normal focus" onclick="modalStop.show();">프로젝트 정지</a>
						<a class="btn normal" onclick="goBack()">뒤로 가기</a>					
					</c:when>
					<c:when test="${proInfo.status eq 'PENDING'}">
						<a class="btn normal focus" onclick="modalNotice.show();">리더에게 공지</a>
						<a class="btn normal focus" onclick="modalRestartPro.show()">프로젝트 재개</a>						
						<a class="btn normal focus" onclick="modalFinishPro.show()">프로젝트 종료</a>
						<a class="btn normal" onclick="goBack()">뒤로 가기</a>	
					</c:when>
					<c:when test="${proInfo.status eq 'CLOSE'}">
						<a class="btn normal focus" onclick="modalNotice.show();">리더에게 공지</a>
						<a class="btn normal" onclick="goBack()">뒤로 가기</a>	
					</c:when>
					<c:otherwise>
						<td>알 수 없음</td>
					</c:otherwise>
				</c:choose>
	
			</div>
		</div>
		
		
	</div>

<!-- 프로젝트 종료 모달 -->

<div id="modalFinishPro" class="window">
    <div class="head">
        <div class="left">프로젝트 종료</div>
        <div class="right">
            <a href="#" class="close"><i class="icon-exit"></i></a>
        </div>
    </div>
    <div class="body">
        <p>${proInfo.projectName } 을(를) 종료하시겠습니까?</p> <br/>
    </div>
    <div class="foot" align="center">
        <a href="#" class="btn focus" id="btnFinish">확인</a> <a href="#" class="btn">Close</a>
    </div>
</div>


<!-- 프로젝트 재개 모달 --> 
	
<div id="modalRestartPro" class="window">
    <div class="head">
        <div class="left">프로젝트 재개</div>
        <div class="right">
            <a href="#" class="close"><i class="icon-exit"></i></a>
        </div>
    </div>
    <div class="body">
        <p>${proInfo.projectName } 을(를) 재개하시겠습니까?</p> <br/>
    </div>
    <div class="foot" align="center">
        <a href="#" class="btn focus" id="btnRestart">확인</a> <a href="#" class="btn">Close</a>
    </div>
</div>

	
<!-- 프로젝트 중지 사유 공지 & 중지 모달-->	

<div class="window" style="width: 500px; display: none;" id="modalStop">
	<div class="head">
		<div class="left">프로젝트 중지</div>
		<div class="right">
			<a href="#" class='close' id="iCancel_stop"><i class='icon-close'></i></a>
		</div>
	</div>
	<div class="body has-property" style="height:300px;">
		<div id="bodyStop" class="property"></div>
	</div>
	<div class="foot">
		<a href="#" class="btn focus" id="btnNToStop">확인</a>
		<a href="#" class="btn" id="btnCancel_stop">취소</a>
	</div>
</div>

<!-- 프로젝트 리더에게 공지 모달 -->

<div class="window" style="width: 500px; display: none;" id="modalNotice">
	<div class="head">
		<div class="left">프로젝트 리더에게 공지</div>
		<div class="right">
			<a href="#" class='close' id="iCancel_notice"><i class='icon-close'></i></a>
		</div>
	</div>
	<div class="body has-property" style="height:300px;">
		<div id="bodyNotice" class="property"></div>
	</div>
	<div class="foot">
		<a href="#" class="btn focus" id="btnNToLeader">확인</a>
		<a href="#" class="btn" id="btnCancel_notice">취소</a>
	</div>
</div>



<script>

jui.ready([ "ui.property" ], function(PropertyView) {

	window.complexSettings = new PropertyView('#bodyStop', {
		items : [
			{ type : 'group', title : '중지 사유', description : '중지 사유를 선택해주세요'},
			{ type : 'select', key : 'transition' , value : 'default', items : ['적절하지 못한 프로젝트(도박,음란,불법)','적절하지 못한  프로젝트 명', '기타'] },

			{ type : 'group', title : '메시지', description : '사용자에게 보낼 메시지를 작성해주세요'},
			{ type : 'textarea', key : 'parallaxBackgroundImage' , value : '', description : '' },
		],
		event : {
			change : function (item, newValue, oldValue) {
				console.log('item : ', item);
				console.log('all items', this.getValue());
			}
		}
	});

	window.modalStop = jui.create('ui.modal', "#modalStop");

});

jui.ready([ "ui.property" ], function(PropertyView) {

	window.complexSettings = new PropertyView('#bodyNotice', {
		items : [
			{ type : 'group', title : '공지사항', description : '공지 유형을 선택해주세요'},
			{ type : 'select', key : 'transition' , value : 'default', items : ['경고','서비스 공지', '서비스 안내'] },

			{ type : 'group', title : '메시지', description : '프로젝트 리더에게 보낼 메시지를 작성해주세요'},
			{ type : 'textarea', key : 'parallaxBackgroundText' , value : '', description : '' },
		],
		event : {
			change : function (item, newValue, oldValue) {
				console.log('item : ', item);
				console.log('all items', this.getValue());
			}
		}
	});

	window.modalNotice = jui.create('ui.modal', "#modalNotice");

});

jui.ready([ "ui.window" ], function(win) {
	modalFinishPro = win("#modalFinishPro", {
        width: 500,
        height: 200,
        modal: true
    });
});

jui.ready([ "ui.window" ], function(win) {
    modalRestartPro = win("#modalRestartPro", {
        width: 500,
        height: 200,
        modal: true
    });
});

	
function goBack() {
   	window.history.back(-1);
}


$(document).ready(function() {
	
	$("#btnCancel_stop").click(function() {
		modalStop.hide();
	});
	
	$("#btnCancel_notice").click(function() {
		modalNotice.hide();
	});
	
	$("#iCancel_stop").click(function() {
		modalStop.hide();
	});
	
	$("#iCancel_notice").click(function() {
		modalNotice.hide();
	});
	
	$("#btnNToLeader").click(function() {
		$.ajax({
			type: "post"
			, url: "/admin/project/view"
			, dataType: "json"
			, data: {"param": "leader",
				"noticeTitle" : $("#bodyNotice").find("select").val(),
				"noticeContent" : $("#bodyNotice").find("textarea").val()

			},success : function(responseData){
				
// 				var title = $("div").children("select").val();
// 				var content = $("div").children("textarea").val();

// 				$("div").children("select").val('');
// 				$("div").children("textarea").val('');
				
				modalNotice.hide();
	
			} 
			
		
		})
	});
	
	$("#btnNToStop").click(function() {
		$.ajax({
			type: "post"
			, url: "/admin/project/view"
			, dataType: "json"
			, data: {"param": "stop", 
				"projectId": "${proInfo.projectId}",
				"noticeTitle": $("#bodyStop").find("select").val(),
				"noticeContent": $("#bodyStop").find("textarea").val()
		
			}, success: function(responseData) {
				console.log("test");
				
				modalStop.hide();
			}
			
		})
		
	});
	
	$("#btnFinish").click(function() {
		$.ajax({
			type: "post"
			, url: "/admin/project/view"
			, dataType: "json"
			, data: {"projectId": "${proInfo.projectId}", "param":"finish" }
			, success: function(data) {
				
				$("#proProgress").removeAttr("readonly");
				$("#proProgress").empty();
				$("#proProgress").val("종료");
// 				$("#proProgress").attr("readonly");
			    	
				modalFinishPro.hide();
				
			}, error: function() {
				
				alert("error");
			}
		})
		
	});
	
	$("#btnRestart").click(function() {
		$.ajax({
			type: "post"
			, url: "/admin/project/view"
			, dataType: "json"
			, data: {"projectId": "${proInfo.projectId}", "param":"restart" }
			, success: function(data) {
				
				$("#proProgress").removeAttr("readonly");
				$("#proProgress").empty();
				$("#proProgress").val("진행 중");
// 				$("#proProgress").attr("readonly");
			    	
				modalRestartPro.hide();
				
			}, error: function() {
				
				alert("error");
			}
		})
		
	});	

	var cd = document.getElementById("proProDate");
		var cDate = new Date(cd.innerText);
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
			remainTime +="경과"; 
		}
		else remainTime +="남음";
		cd.innerText = remainTime;

	
});

</script>
	
</body>
</html>