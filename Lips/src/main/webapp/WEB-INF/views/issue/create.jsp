<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
//assignee autocomplete
jui.ready([ "ui.autocomplete" ], function(autocomplete) {
	assign = autocomplete("#assign", {
        target: "#assignee"
        , words: ["2글자 이상 입력하세요."]
    });
	
	$("#assignee").keyup(function() {
		var name = document.getElementById("assignee").value;
		if(name.length>0) {
			
			// Querystring null값인경우에 대한 예외처리
			var projId = "";
			if((${param.projectId} + "") != "" ) projId = ${param.projectId} + "";
			
			$.ajax({
				type:"post"
				, url: "/issue/getMembers"
				, data: { "name" : name ,"projectId" : projId }
				, dataType: "json"
				, success: function(data){
					console.log(data);
					assign.update(data.name);
				}
				, error : function(e){
					console.log("----error----");
					console.log(e.responseText);
				}
			});
		}
	});
});



$(document).ready(function() { 
	
	// set Category for change projectId
	$("#projectId").change(function() {
		var projectId = $("#projectId").val();
		$.ajax({
			type:"post"
			, url: "/issue/getCategory"
			, data: { "projectId" : projectId }
			, dataType: "json"
			, success: function(data){
				console.log(data);
				$("#issueCategory").empty();
				for(var i=0;i<data.category.length;i++) {
					$("#issueCategory").append("<option value='" 
						+ data.category[i].categoryAssetId +"'>" 
						+ "[" + data.category[i].assetCode +"] " 
						+ data.category[i].assetName 
						+ "</option>"
					);
				};
			}
			, error : function(e){
				console.log("----error----");
				console.log(e.responseText);
			}
		});
	});
	
	// assign to me buton action 
	$("#assignToMe").click(function(){
		$("#assignee").val('<sec:authentication property="principal.userId"/>');
	});		
});

// Modal setup
jui.ready([ "ui.modal" ], function(modal) {
	$("#setStageModal").appendTo("body");

    setStageModal = modal("#setStageModal", {
        color: "white"
    });
});
</script>
<style>
/* common */
.issueHeading {
	margin:		10px;
	padding: 	10px;
	border-bottom: 1px solid #999;
}

.alignCenter {
	display: 		block; 
	text-align: 	center;
}

.mt-1 {
	margin-top : 	1em;
}
.mb-1 {
	margin-bottom:	1em;
}

/* issue form */
.issue-form-row {
	width: 		100%;
	margin:		1em;
}
.issue-form-row .issue-form-label {
	display: inline-block;
	width: 		15%;
	margin-right: 5px;
}
.issue-form-row .issue-form-input {
	width: 		60%;
}
.issue-form-row button {
	width: 100px;
}

#setStageModal {
	width: 80%;
	height: 50em;
}

</style>

<div class="row">
	<div class="h3 issueHeading">
		이슈 생성
	</div>
	<div class="panel myIssue">
		<div class="head">
			<strong>새이슈</strong>
		</div>
		<div class="body">
			<form action="/issue/create" method="post" enctype="multipart/form-data">
				<div class="h4 mb-1">기본항목</div>
				<div class="issue-form-row">
					<label for="projectId" class="issue-form-label">프로젝트</label>
					<select name="projectId" id="projectId" class="input issue-form-input">
						<c:if test="${param.projectId eq null }">
							<option value="0">프로젝트를 선택해주세요</option>							
						</c:if>
						<c:forEach items="${projList }" var="proj">
							<c:if test="${proj.projectId eq param.projectId }">
								<option value="${proj.projectId}" selected="selected">[${proj.projectId} - ${proj.projectKey }] ${proj.projectName }</option>
							</c:if>
							<c:if test="${proj.projectId ne param.projectId }">
								<option value="${proj.projectId}">[${proj.projectId} - ${proj.projectKey }] ${proj.projectName }</option>							
							</c:if>
						</c:forEach>
					</select>
				</div>
				<div class="issue-form-row">
					<label for="issueTitle" class="issue-form-label">제목</label>
					<input type="text" name="issueTitle" id="issueTitle" class="input issue-form-input" />
				</div>
				<div class="issue-form-row">
					<label for="issueCategory" class="issue-form-label">카테고리</label>
					<select name="issueTitle" id="issueCategory" class="input issue-form-input">
						<c:forEach items="${category }" var="cat">
							<option value="${cat.categoryAssetId }">[${cat.assetCode }] ${cat.assetName }</option>
						</c:forEach>
					</select>
				</div>
				<div class="issue-form-row">
					<label for="issueEndDate" class="issue-form-label">종료(예정)일</label>
					<input type="date" name="issueEndDate" id="issueEndDate" class=" input issue-form-input" />
				</div>
				<div id="assign" class="issue-form-row">
					<label for="assignee" class="issue-form-label">담당자</label>
					<input type="text" name="assignee" id="assignee" class="input issue-form-input" />
					<button type="button" id="assignToMe" class="btn focus">나에게 할당</button>
					<script data-jui="#assign" data-tpl="words" type="text/template">
    					<div class="dropdown">
       		 				<ul>
            					<! for(var i = 0; i < words.length; i++) { !>
           						<li><!= words[i] !></li>
           						<! } !>
        					</ul>
   						</div>
					</script>
				</div>
				<div class="issue-form-row">
					<label for="issueTitle" class="issue-form-label">이슈 단계</label>
					<input type="text" name="issueTitle" id="issueTitle" class=" input issue-form-input" />
					<button type="button" class="btn" onclick="setStageModal.show();">단계 설정</button>
				</div>
				<div class="issue-form-row">
					<label for="issueContent" class="issue-form-label">내용</label>
					<textarea name="issueContent" id="issueContent" class="input issue-form-input" rows="10"></textarea>
				</div>
				<div class="issue-form-row">
					<label for="issueFile" class="issue-form-label">파일 업로드</label>
					추가예정

				</div>
				<div class="hr mt-1 mb-1"></div>
				<div class="h4 mt-1 mb-1">추가항목</div>
				<div class="issue-form-row">
					<label for="issueCustom1" class="issue-form-label">커스텀1</label>
					추가예정
				</div>
			</form>
		</div>
		<div class="foot alignCenter">
			<button type="button" id="issueFormSubmit" class="btn focus">Submit</button>
			<button type="button" id="issueFormCancel" class="btn">Cancel</button>
		</div>
	</div>
</div>

<!-- set Stage Modal -->
<div id="setStageModal" class="msgbox" style="display: none;">
	<div class="head">
		이슈 단계 설정하기
	</div>
	<div class="body">
		<div class="col col-1"></div>
		<div class="col col-10">
			<div class="panel">
				<div class="head">
					기본 Process
				</div>
				<div class="body">
					<span class="label success">시작</span>
					<span class="icon icon-arrow4" style="vertical-align:middle;"></span>
					<span class="label success">종료</span>
				</div>
			</div>
		</div>

		<div style="text-align: center; margin-top: 45px;">
			<button type="button" id="selectStage" class="btn focus">Use selected stage preset</button>
			<button type="button" id="cancelStage" class="btn ">Close</button>
		</div>
	</div>
</div>


