<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<label for="issueTitle" class="issue-form-label">제목</label>
					<input type="text" name="issueTitle" id="issueTitle" class=" input issue-form-input" />
				</div>
				<div class="issue-form-row">
					<label for="issueTitle" class="issue-form-label">카테고리</label>
					<select name="issueTitle" id="issueTitle" class="input issue-form-input">
						<option value="1">이슈</option>
						<option value="2">버그</option>
						<option value="3">테스팅</option>
					</select>
				</div>
				<div class="issue-form-row">
					<label for="issueEndDate" class="issue-form-label">종료(예정)일</label>
					<input type="date" name="issueEndDate" id="issueEndDate" class=" input issue-form-input" />
				</div>
				<div class="issue-form-row">
					<label for="issueAssignee" class="issue-form-label">담당자</label>
					<input type="text" name="issueAssignee" id="issueAssignee" class="input issue-form-input" />
				</div>
				<div class="issue-form-row">
					<label for="issueTitle" class="issue-form-label">이슈 단계</label>
					<input type="text" name="issueTitle" id="issueTitle" class=" input issue-form-input" />
					<button type="button" class="btn focus">단계 설정</button>
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