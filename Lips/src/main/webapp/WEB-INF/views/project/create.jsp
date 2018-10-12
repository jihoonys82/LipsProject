<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div class="row">
	<div class="h3 issueHeading">
		프로젝트 생성
	</div>
	<div class="panel myIssue">
		<div class="head">
			<strong>프로젝트 정보를 입력하세요</strong>
		</div>
		<div class="body">
			<form action="/project/create" method="post">
				<div class="issue-form-row">
					<label for="projectName" class="issue-form-label">프로젝트 명</label>
					<input type="text" name="projectName" id="projectName" class=" input issue-form-input" />
				</div>
				<div class="issue-form-row">
					<label for="projectKey" class="issue-form-label">프로젝트 key</label>
					<input type="text" name="projectKey" id="projectKey" class="input issue-form-input" />
				</div>
				<div class="issue-form-row">
					<label for="closeDate" class="issue-form-label">종료(예정)일</label>
					<input type="date" name="closeDate" id="closeDate" class=" input issue-form-input" />
				</div>
				
				<div class="issue-form-row">
					<label for="projectDesc" class="issue-form-label">프로젝트 설명</label>
					<textarea name="projectDesc" id="projectDesc" class="input issue-form-input"></textarea>
				</div>
				
				<div class="issue-form-row">
					
					<label for="issueContent" class="issue-form-label">프로젝트 공개 여부</label>
					<input type="radio" name="projectOpen" id="projectOpen" class=" input issue" checked=""  value="1" style="margin-right: 10px;"/><label for="issueContent" class="issue-form-label"> 공개 </label>
					<input type="radio" name="projectOpen" id="projectOpen" class=" input issue" value="0"style="margin-right: 10px;"/><label for="issueContent" class="issue-form-label"> 비공개 </label>
					
				</div>
				
				<div class="issue-form-row">
					<label for="projectCreater" class="issue-form-label">프로젝트 생성자</label>
					<input type="text" name="projectCreater" id="projectCreater" class="input issue-form-input" value="${user.userId}" readonly/>
				</div>
				
					<div class="foot alignCenter">
			<input type="submit"  class="btn focus" value="Submit"/>
			<button type="button" class="btn">Cancel</button>
		</div>
			</form>
			
		
		</div>
	</div>
	


</div>