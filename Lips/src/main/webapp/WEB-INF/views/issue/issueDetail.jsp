<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal.userId"  var="userId"/>
<sec:authentication property="principal.nick"  var="nick"/>
<script type="text/javascript" src="/resources/js/moment.min.js"></script>
<c:set var="startNo" value="1"/>
<c:set var="endNo" value="99"/>
<style>

.issueDetail{
	padding: 5px;
}
.issueBtnGroup {
	margin-top: 5px;
}
.issueHeadlineItem {

}
.issueItem-row-label{
	display: inline-block;
	min-width: 50px;
	max-width: 10%;
 	vertical-align: super; 
}
.issueItem-row{
	display: inline-block;
	min-width: 80px;
	max-width: 20%;
	margin-right: 20px;
	margin-bottom: 15px;
}
.issueItem-row.issueTitle {
	width: 40%;
	max-width:unset;
	overflow: hidden;
	text-overflow: ellipsis;
}
.issueItem-1 {
	width: 48%;
	padding-right: 10px;
	margin-bottom: 15px;
	float:left;
}
.issueItem-2{
	width: 99%;
	margin-bottom: 15px;
	
}
.issueItem-label {
	display: inline-block;
	width: 15%;
}
.issueItem-value {
	display:inline-block;
	width: 70%;
}
.issueItem-button {
	display:inline-block;
	width: 10%;
}
.issueItem-value.issueDiv {
	min-height: 50px;
	height: auto;
}
#replyText {
	width: 95%;
}
.upload-group {
	margin-top: 5px;
}
input[name=fileName] {
	width : 100%;
}
.upload-btn-wrapper {
	padding-left: 5px;
	position: relative;
	overflow: hidden;
	display: inline-block;
}
.upload-btn-wrapper input[type=file] {
	font-size: 100px;
	position: absolute;
	left: 0;
	top: 0;
	opacity: 0;
}
.follower {
 float:left;
 margin: 3px;
}
</style>
<!-- Issue control buttons -->
<div class="row issueDetail issueBtnGroup">
	<div class="panel ">
		<div class="body">
			<a href="/issue/main" class="btn focus">목록 보기</a>
			<c:if test="${userId ne issue.assignee }">			
				<button class="btn focus" id="removeFollower"><span class="icon icon-happy"></span>관심 해제</button>
				<button class="btn" id="addFollower"><span class="icon icon-happy"></span>관심 등록</button>
				<script>
					<c:if test="${amIFollowing eq true }">
						$("#addFollower").hide();
					</c:if>
					<c:if test="${amIFollowing ne true }">
						$("#removeFollower").hide();
					</c:if>
				</script>
			</c:if>
			<c:if test="${userId eq issue.assignee }">
				<button class="btn stageDown">이전단계</button>
				<button class="btn stageUp">다음단계</button>
			</c:if>	
			<c:if test="${userId eq issue.createUser }">
				<a href="/issue/issueUpdate?issueId=${issue.issueId }" class="btn" >수정</a>
				<a href="/issue/issueDelete?issueId=${issue.issueId }" class="btn">삭제</a>
			</c:if>
		</div>
	</div>
</div>
<!-- Issue content -->
<div class="row issueDetail">
	<div class="panel">
		<div class="head">
			<i class="icon-left"></i>
			<strong>
				[${projectDto.projectKey }] <span id="projectId">${projectDto.projectName }</span>
			</strong>
		</div>
		<div class="body">
			<div class="clearfix">
				<span class="issueItem-row-label">이슈 번호</span>
				<span class="input issueItem-row ">${issue.issueId }</span>
				<span class="issueItem-row-label">카테고리</span>
				<span class="input issueItem-row ">${catName }</span>
				<span class="issueItem-row-label">이슈 제목</span>
				<span class="input issueItem-row issueTitle">${issue.issueTitle }</span>
				<span class="issueItem-row-label">작성자</span>
				<span class="input issueItem-row ">${issue.createUser }</span>		
			</div>
		</div>
		<div class="body">
			<div class="clearfix">
				<div class="issueItem-1">
					<span class="issueItem-label">생성일</span>
					<span class="issueItem-value input">
						<fmt:formatDate value="${issue.createDate }" pattern="yyyy-MM-dd"/>
					</span>			
				</div>
				<div class="issueItem-1">
					<span class="issueItem-label">종료예정일</span>
					<span class="issueItem-value input">
						<fmt:formatDate value="${issue.expectedEndDate }" pattern="yyyy-MM-dd"/>
					</span>			
				</div>
				<div class="issueItem-1">
					<span class="issueItem-label">실제종료일</span>
					<span class="issueItem-value input acualEndDateInput">
						<c:if test="${issue.actualEndDate eq null }">
							아직 프로젝트가 종료되지 않았습니다.
						</c:if>
						<c:if test="${issue.actualEndDate ne null }">
							<fmt:formatDate value="${issue.actualEndDate }" pattern="yyyy-MM-dd"/>
						</c:if>
					</span>			
				</div>
				<div class="issueItem-1">
					<span class="issueItem-label">남은 기간</span>
					<span class="issueItem-value input countDate">
						<fmt:formatDate value="${issue.expectedEndDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
					</span>			
				</div>
			</div>
			<div class="issueItem-2">
				<span class="issueItem-label">담당자</span>
				<span class="input issueItem-value" id="assignTo">${issue.assignee }</span>
				<button class="issueItem-button btn focus" onclick="changeAssignee.show();">담당자 변경</button>
			</div>	
			<div class="issueItem-2">
				<span class="issueItem-label">진행 상황</span>
				<div class="issueItem-value input issueDiv">
					<div class="content">
						<c:forEach items="${issueStages }" var="asset">
							<c:if test="${asset.stageAssetId eq issue.issueStage }">
								<span class="label success" style="border:2px solid red;">${asset.stageName }</span>
							</c:if>
							<c:if test="${asset.stageAssetId ne issue.issueStage }">
								<span class="label success">${asset.stageName }</span>
							</c:if>
							<c:if test="${asset.stageAssetId ne endNo }">
								<span class="icon icon-arrow4" style="vertical-align:middle;"></span>							
							</c:if> 
						</c:forEach>
					</div>				
				</div>
			</div>
			<div class="issueItem-2">
				<span class="issueItem-label">첨부 파일</span>
				<div class="issueItem-value input issueDiv"></div>
			</div>
			<div class="issueItem-2">
				<span class="issueItem-label">내용</span>
				<div class="issueItem-value input issueDiv">${issue.issueContent }</div>
			</div>
			<div class="issueItem-2">
				<span class="issueItem-label">팔로워(<span class="followerCount">${followerCount }</span>)</span>
				<div class="issueItem-value input issueDiv followerList" style="overflow:auto;">
					<c:forEach items="${follower }" var="user">
						<c:if test="${user.userId eq userId }">
							<div class="label follower me">${user.nick }(${user.userId })</div>
						</c:if>
						<c:if test="${user.userId ne userId }">
							<div class="label follower">${user.nick }(${user.userId })</div>					
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="body" id="issueCustom">
			<c:if test="${issue.customValues ne null}">
				<script>
						
					var customList = ${issue.customValues};
					for(var i = 0; i<customList.length;i++){
						if(customList[i].type=="checkbox"){
							customList[i].type="text";					
						}
						$("#issueCustom").append(
							"<div class=issueItem-2>" +
								"<span class='issueItem-label'>"+customList[i].name+"</span>"+
								"<div class='issueItem-value issueDiv'>"+
									"<input disabled='true' style='width:100%'class='input large' type='"+customList[i].type+"' value='"+customList[i].value+"'/>" +
								"</div>" +
							"</div>");	
					}			
				</script>
			</c:if>
		</div>
	</div>
</div>

<!-- Reply comment -->
<div class="row issueDetail">
	<div class="panel">
		<div class="head">
			<i class="icon-left"></i> <strong>댓글</strong>
		</div>
		
		<c:if test="${comments eq null }">
			<div class="body">
				<div class="row">
					<div class="col col-1">	</div>
					<div class="col col-10">
						댓글이 없습니다.
					</div>
				</div>
			</div>
		</c:if>
		<c:forEach items="${comments }" var="comment">
			<div class="body">
				<div class="row">
					<div class="col col-1">
						${comment.userId }
					</div>
					<div class="col col-10">
						${comment.commentContent }
						<small> - <fmt:formatDate value="${comment.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/> </small>
					</div>
					<c:if test="${comment.userId eq userId }" >
						<button class="btn focus mini commentDelete"><span class="icon icon-close"></span></button>
						<input type="hidden" value="${comment.commentId }" />
					</c:if>
				</div>
				<c:if test="${comment.attachFile > 0 }"> 
					<div class="row">
						<div class="col col-1"></div>
						<div class="col col-10">
							<span>첨부파일</span>
							<span class="commentAttachFile"></span>
						</div>
					</div>
				</c:if>
			</div>
		</c:forEach>
		<div class="body" id="addComment">
			<div class="row">
				<div class="col col-1">
					${nick }(${userId})
				</div>
				<div class="col col-9">
					<div class="row">
						<textArea id="replyText" class="input"></textArea>
					</div>
<!-- 					<div class="row upload-group"> -->
<!-- 						<div class="col col-10"> -->
<!-- 							<input class="input disabled" type="text" name="fileName"/>		 -->
<!-- 						</div> -->
<!-- 						<div class="col col-2 upload-btn-wrapper"> -->
<!-- 							<button class="btn">파일 첨부</button> -->
<!-- 							<input type="file" name="myfile"/> -->
<!-- 						</div>			 -->
<!-- 					</div> -->
<!-- 				</div> -->
				<div class="col col-2">
					<button class="btn focus commentAdd">등록 </button>
				</div>			
			</div>
		</div>
	</div>
</div>
<!--?? my comment -->

<!-- modal -->
<!-- set Stage Modal -->
<div id="changeAssignee" class="msgbox" style="display: none; width:50%;">
	<div class="head">
		담당자 변경
	</div>
	<div class="body" style="min-height: 100px;">
		<div class="row">
			담당자를 ${nick }(${userId })님으로 변경 하시겠습니까?
<!-- 			<div id="assign" class="group" > -->
<!-- 				<label class="label"><i class="icon-search"></i></label> -->
<!-- 				<input type="text" name="assignee" id="assignee" class="input" /> -->
<!-- 				<input type="hidden" id="selectedAssignee" />  -->
<!-- 			</div> -->
<!-- 			<script data-jui="#assign" data-tpl="words" type="text/template"> -->
<!-- 				<div class="dropdown" style="z-index:9999;"> -->
<!-- 				 	<ul> -->
<!--        					<! for(var i = 0; i < words.length; i++) { !> -->
<!--       					<li><!= words[i] !></li> -->
<!--       					<! } !> -->
<!-- 	  				</ul> -->
<!-- 				</div> -->
<!-- 			</script> -->
		</div><!-- end of row -->
		<div style="text-align: center; margin-top: 30px;">
			<button type="button" id="submitAssign" class="btn focus">확인</button>
			<button type="button" id="cancelAssign" class="btn">취소</button>
		</div>
	</div>
</div><!-- end of modal -->


<script>
$(document).ready(function(){
	//stage Down
	$(".stageDown").on('click',function(){
		stageChange('down');
	});
	//stage Up
	$(".stageUp").on('click',function(){
		stageChange('up');
	});
	
	// comment file upload (not action)
	$("input:file").on('change',function(){
		var $fname= $("input:file").val();
		$("input[name='fileName']").val($fname);
	});
	
	// count date
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
	
	//Add Comment
	$(".commentAdd").on('click', function(){
		// TODO:file check and uplaod
		
		
		var commentContent = $("#replyText").val();
		//add comment
		$.ajax({
			type:"post"
			, url: "/issue/addComment"
			, data: { 
				"issueId" : ${issue.issueId}
				, "userId" : "${userId}"
				, "commentContent" : commentContent
				//, "attachFile" : attachFileId
			}
			, dataType: "html"
			, success: function(data){
				console.log($(data).find("div.body").get(0).outerHTML);
				$("#addComment").before($(data).find("div.body").get(0).outerHTML);
				$("#replyText").val("");
			}
			, error : function(e){
				console.log("----error----");
				console.log(e.responseText);
			}
		});
	});
	
	//Comment Delete
	$(".commentDelete").on("click", function(){
		var commentDOM = $(this).parent();
		var commentId = commentDOM.find("input[type='hidden']").val();
		var commenter = commentDOM.find("div.col-1").text().trim();
		if(commenter != "${userId}") {
			return false;
		}
		$.ajax({
			type:"post"
			, url: "/issue/deleteComment"
			, data: { "commentId" : commentId }
			, dataType: "json"
			, success: function(data){
				console.log(data.result);
				commentDOM.parent().remove();
			}
			, error : function(e){
				console.log("----error----");
				console.log(e.responseText);
			}
		});
	});
	
	
	//add Follower
	$("#addFollower").on('click', function(){
		// 1. ajax로 사용자 등록 
		$.ajax({
			type:"post"
			, url: "/issue/addWatcher"
			, data: { "issueId" : ${issue.issueId } , "userId" : "${userId}" }
			, dataType: "json"
			, success: function(data){
				//console.log(data.result);
				// 2. 버튼 바꿔주기 
				$(".followerCount").text(data.result);
				$("#addFollower").hide();
				$("#removeFollower").show();
				// 3. 팔로워 목록 업데이트 
				$(".followerList").append("<div class='label follower me'>${userId }(${nick})</div>");
			}
			, error : function(e){
				console.log("----error----");
				console.log(e.responseText);
			}
		});
	});
	//remove Follower
	$("#removeFollower").on('click', function(){
		// 1. ajax로 사용자 등록 
		$.ajax({
			type:"post"
			, url: "/issue/removeWatcher"
			, data: { "issueId" : ${issue.issueId } , "userId" : "${userId}" }
			, dataType: "json"
			, success: function(data){
				//console.log(data.result);
				// 2. 버튼 바꿔주기 
				$(".followerCount").text(data.result);
				$("#removeFollower").hide();
				$("#addFollower").show();
				// 3. 팔로워 목록 업데이트 
				$("div.follower.me").remove();
			}
			, error : function(e){
				console.log("----error----");
				console.log(e.responseText);
			}
		});
	});
	
	var stageChange = function(changes) {
		var change = changes ;
		var issueId = "${issue.issueId}";
		var allData = { "change": change, "issueId": issueId };

		console.log(change);
		$.ajax({
	        type : 'post',
	        url : '/issue/changeStage',
	        dataType : 'JSON',
	        data : allData,
	        success : function(data){
	            var stageId = data.stageId;
	            var stageName = data.stageName;
	            var stagechecker = $(".content").children("span").length;
	            
	            for(var i = 0; i<stagechecker; i++){
	            	var check = $(".content").children("span").eq(i).text();
	            	if(check==stageName){
	            		$(".content").children("span").eq(i).css("border","2px solid red");
	            	}else{
	            		$(".content").children("span").eq(i).css("border","");
	            	}
	            }
	            
	            if(stageId == 99){
	            	$(".acualEndDateInput").empty().text(data.actualenddate);
	            }else{
	            	$(".acualEndDateInput").empty().text("아직 프로젝트가 종료되지 않았습니다.");
	            }
	            
	            
	        }
	    });

	}
});

//assignee autocomplete
// jui.ready([ "ui.autocomplete" ], function(autocomplete) {
// 	assign = autocomplete("#assign", {
//       target: "input#assignee"
//       , words: ["2글자 이상 입력하세요."]
// // 	  , dx : 300
// // 	  , dy : 300
// 	});
	
// 	$("#assignee").keyup(function() {
// 		var name = document.getElementById("assignee").value;
// 		console.log(name);
// 		if(name.length>0) {
// 			//var projId = $("#projectId").val();
// 			var projId = ${issue.projectId};
			
// 			$.ajax({
// 				type:"post"
// 				, url: "/issue/getMembers"
// 				, data: { "name" : name ,"projectId" : projId }
// 				, dataType: "json"
// 				, success: function(data){
// 					console.log(data);
// 					//assign.update(data.name);
// 					$("#selectedAssignee").val(data.name);
// 				}
// 				, error : function(e){
// 					console.log("----error----");
// 					console.log(e.responseText);
// 				}
// 			});
// 		}
// 	});
// });

//Modal setup
jui.ready([ "ui.modal" ], function(modal) {
	$("#changeAssignee").appendTo("body");

    changeAssignee = modal("#changeAssignee", {
        color: "gray"
    });
    
    $("#submitAssign").click(function(){
    	var issueId = ${issue.issueId};
    	var userId = "${userId}";

    	if($("#assignTo").text() == userId) {
    		changeAssignee.hide();
    		return false;
    	}
    	
    	$.ajax({
    		type: "post"
			, url: "/issue/changeAssignee"
			, data: { "issueId" : issueId ,"userId" : userId }
			, success: function(){
				//console.log(data);
				$("#assignTo").text(userId);
				//$("#selectedAssignee").val("");
			}
			, error : function(e){
				console.log("----error----");
				console.log(e.responseText);
			}
    	});
    	//$("#assignTo").text($("#Assignee").val());
    	changeAssignee.hide();
    });
    //close button event
    $("#cancelAssign").click(function(){
    	changeAssignee.hide();
    	//$("#selectedAssignee").val("");
    	//$("#assignee").val("");
	});
});

</script>