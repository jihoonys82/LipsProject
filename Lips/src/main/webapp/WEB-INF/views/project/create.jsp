<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
/* common */
.issueHeading {
	margin:		10px;
	padding: 	10px;
	border-bottom: 1px solid #999;
}

.issue-form-row {
	width: 		100%;
	margin:		5px;
}
.issue-form-row .issue-form-label {
	display: inline-block;
	width: 		15%;
	margin-right: 5px;
}
.issue-form-row .issue-form-input {
	width: 		60%;
}

</style>

<div class="row">
	<div class="h3 issueHeading">
		프로젝트 생성
	</div>
	<div class="panel myIssue">
		<div class="head">
			<strong>새로운프로젝트</strong>
		</div>
		<div class="body">
			<form action="/issue/create" method="post" enctype="multipart/form-data">
				<div class="issue-form-row">
					<label for="issueTitle" class="issue-form-label">프로젝트 명</label>
					<input type="text" name="issueTitle" id="issueTitle" class=" input issue-form-input" />
				</div>
				<div class="issue-form-row">
					<label for="issueAssignee" class="issue-form-label">프로젝트 key</label>
					<input type="text" name="issueAssignee" id="issueAssignee" class="input issue-form-input" />
				</div>
				<div class="issue-form-row">
					<label for="issueEndDate" class="issue-form-label">종료(예정)일</label>
					<input type="date" name="issueEndDate" id="issueEndDate" class=" input issue-form-input" />
				</div>
				
				<div class="issue-form-row">
					<label for="issueContent" class="issue-form-label">내용</label>
					<textarea name="issueContent" id="issueContent" class="input issue-form-input"></textarea>
				</div>
				
				<div class="issue-form-row">
					<label for="issueContent" class="issue-form-label">공개 여부</label>
					<textarea name="issueContent" id="issueContent" class="input issue-form-input"></textarea>
				</div>
				
				<div class="issue-form-row">
					<label for="issueContent" class="issue-form-label">프로젝트 생성자</label>
					<textarea name="issueContent" id="issueContent" class="input issue-form-input"></textarea>
				</div>
				
					<button class="btn focus">프로젝트 생성</button>
				
			</form>
			
		
		</div>
	</div>
	


</div>