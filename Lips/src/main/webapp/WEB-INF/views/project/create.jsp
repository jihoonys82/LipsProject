<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="row">
	<div class="h3 issueHeading">프로젝트 생성</div>
	<div class="panel myIssue">
		<div class="head">
			<strong>프로젝트 정보를 입력하세요</strong>
		</div>
		<div class="body">
			<form method="post">
				<div class="issue-form-row">
					<label for="projectName" class="issue-form-label">프로젝트 명</label> <input
						type="text" name="projectName" id="projectName"
						class=" input issue-form-input" />
				</div>
				<div class="issue-form-row">
					<label for="projectKey" class="issue-form-label">프로젝트 key</label> <input
						type="text" name="projectKey" id="projectKey"
						class="input issue-form-input" />
				</div>
				<div class="issue-form-row">
					<label for="closeDate" class="issue-form-label">종료(예정)일</label> <input
						type="date" name="closeDate" id="closeDate"
						class=" input issue-form-input" />
				</div>

				<div class="issue-form-row">
					<label for="projectDesc" class="issue-form-label">프로젝트 설명</label>
					<textarea name="projectDesc" id="projectDesc"
						class="input issue-form-input"></textarea>
				</div>

				<div class="issue-form-row">

					<label for="issueContent" class="issue-form-label">프로젝트 공개
						여부</label> <input type="radio" name="projectOpen" id="projectOpen"
						class=" input issue" checked="" value="1"
						style="margin-right: 10px;" /><label for="issueContent"
						class="issue-form-label"> 공개 </label> <input type="radio"
						name="projectOpen" id="projectOpen" class=" input issue" value="0"
						style="margin-right: 10px;" /><label for="issueContent"
						class="issue-form-label"> 비공개 </label>

				</div>

				<div class="issue-form-row">
					<label for="projectCreater" class="issue-form-label">프로젝트
						생성자</label> <input type="text" name="projectCreater" id="projectCreater"
						class="input issue-form-input" value=
						<sec:authorize access="hasAuthority('USER')">
		<sec:authentication property="principal.userId"/></sec:authorize>
						
						
						readonly />
				</div>


			</form>


		</div>
	</div>
	<div class="foot alignCenter">
<!-- 		<button class="btn" onclick="modal_1.show()"><i class="icon-play"></i> Create</button> -->
		<button class="btn" id="createProject"><i class="icon-play"></i> Create</button>
		<button type="button" class="btn">Cancel</button>

	</div>
	
	<!--모달  -->
	<div id="modal_1" class="msgbox" style="display: none;">
		<div class="head">Title</div>
		<div class="body">
			Contents...<br />

			<div style="text-align: center; margin-top: 45px;">
				<a class="btn focus small">Save</a> <a class="btn small">Close</a>
			</div>
		</div>
	</div>
	<!-- 모달 끝 -->

	<!--  ajax-->
	<script type="text/javascript">
		$(document).ready(function() {

			

			$("#createProject").click(function() {

				var projectName = $("#projectName").val();
				var projectKey = $("#projectKey").val();
				var closeDate = $("#closeDate").val();
				var projectDesc = $("#projectDesc").val();
				var projectOpen = $("#projectOpen").val();
				var projectCreater = $("#projectCreater").val();

				var isValid=true;
				if(!projectName) {
					alert("프로젝트 명을 입력하세요");
					isvalid=false;
				}
				
				if(!projectKey) {
					alert("프로젝트 키를 입력하세요");
					isvalid=false;
				}
				
				if(!closeDate) {
					alert("예상 종료일을 입력하세요");
					isvalid=false;
				}
				
				if(!projectDesc) {
					alert("프로젝트 설명을 입력하세요");
					isvalid=false;
				}
				//04. 에이잭스
				if(isValid) {
				$.ajax({
					type : "post"
					, url : "/project/create"
					, beforesend: function(){
						
					}
					, data : {"projectName":projectName, "projectKey":projectKey, "closeDate":closeDate, "projectDesc":projectDesc, "projectOpen":projectOpen, "projectCreater":projectCreater }
// 					, dataType: ""
					, success : function(data) {
						console.log(data);
// 						$('#MODAL').append('')
					}
					, error : function() {
						alert("error");
					}
				})
				}
			});
		});
	</script>

	<!--모달  -->
	<script>
		jui.ready([ "ui.modal" ], function(modal) {
			$("#modal_1").appendTo("body");

			modal_1 = modal("#modal_1", {
				color : "black"
			});
		});
	</script>



</div>