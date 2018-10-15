<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row">
	<div class="col col-6 issueHeadline">
		<h3>데드라인이 가까운 이슈</h3>
		<table class="table classic stripeless">
			<thead>
				<tr>
					<th class="twidth">이슈 제목</th>
					<th>${issueCloseDeadline.issueTitle }</th>
				</tr>
			</thead>
		 	<tbody>
		 		<tr>
					<td>남은 기간</td>
					<td><span id="remainTime"></span></td>		
		 		</tr>
		 		<tr>
					<td>이슈 내용</td>
					<td>${issueCloseDeadline.issueContent }</td>		
		 		</tr>
		 		<tr>
					<td>이슈진행단계</td>
					<td>${issueCloseDeadline.issueStage }</td>		
		 		</tr>
		 		<tr>
					<td>이슈댓글 수</td>
					<td></td>		
		 		</tr>
		 		<tr>
					<td>팔로워 수</td>
					<td></td>		
		 		</tr>
		 	</tbody>
		</table>
	</div>
	<div class="col col-6 issueHeadline">
		<h3>가장 많이 팔로잉 한 이슈</h3>
		<table class="table classic stripeless">
			<thead>
				<tr>
					<th class="twidth">이슈 제목</th>
					<th></th>
				</tr>
			</thead>
		 	<tbody>
		 		<tr>
					<td>남은 기간</td>
					<td></td>		
		 		</tr>
		 		<tr>
					<td>이슈 내용</td>
					<td></td>		
		 		</tr>
		 		<tr>
					<td>이슈진행단계</td>
					<td></td>		
		 		</tr>
		 		<tr>
					<td>이슈댓글 수</td>
					<td></td>		
		 		</tr>
		 		<tr>
					<td>팔로워 수</td>
					<td></td>		
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
				<button class="btn focus small btnMore">더보기</button>
			</div>
			<table class="table classic hover">
				<thead>
					<tr>
						<th class="myCols-1">이슈번호</th>
						<th>제목</th>
						<th class="myCols-1">이슈 생성자</th>
						<th class="myCols-2">남은 기간</th>
						<th class="myCols-2">단계</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>A</td>
						<td>B</td>
						<td>C</td>
						<td>D</td>
						<td>
							<div class="myIssueStage">
								<button class="btn btn-small myIssueStageBtn"><span class="icon icon-chevron-left"></span></button>
								E
								<button class="btn btn-small myIssueStageBtn"><span class="icon icon-chevron-right"></span></button>							
							</div>
						</td>
					</tr>
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
				<button class="btn focus small btnMore">더보기</button>
			</div>
			<table class="table classic hover">
				<thead>
					<tr>
						<th class="myCols-1">이슈번호</th>
						<th>제목</th>
						<th class="myCols-1">이슈 생성자</th>
						<th class="myCols-1">이슈 담당자</th>
						<th class="myCols-2">남은 기간</th>
						<th class="myCols-1">단계</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>A</td>
						<td>B</td>
						<td>C</td>
						<td>D</td>
						<td>E</td>
						<td>F</td>
					</tr>
				</tbody>
			</table>
		</div>
	 </div>
</div>