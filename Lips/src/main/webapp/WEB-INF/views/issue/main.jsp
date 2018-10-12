<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style> 
.issueHeadline {
	padding: 10px;
}
.issueHeadline .twidth {
	width: 30%;
}
.issueList .issueListItem{
	float:left;
	
}
 
</style>
<div class="row">
	<div class="col col-6 issueHeadline">
		<h3>데드라인이 가까운 이슈</h3>
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
	<div class="col col-12">
		<h3>내게 할당된 이슈</h3>
		<div class="issueList clearfix">
			<div class="issueListItem">이슈번호</div>
			<div class="issueListItem">제목</div>
			<div class="issueListItem">이슈 생성자</div>
			<div class="issueListItem">남은 기간</div>
			<div class="issueListItem">
				<button class="btn btn-small"><span class="icon icon-chevron-left"></span></button>
				
				<button class="btn btn-small"><span class="icon icon-chevron-right"></span></button>
			</div>
		</div>
	 </div>

</div>