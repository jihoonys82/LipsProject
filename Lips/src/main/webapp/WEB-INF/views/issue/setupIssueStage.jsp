<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.panel-wrapper {
	padding:	 	10px;
}
.w-5 {
	width: 			5%;
}
.w-10 {
	width: 			10%;
}
.w-15 {
	width: 			15%;
}
.w-20 {
	width: 			20%;
}
.w-30 {
	width: 			30%;
}
.w-40 {
	width: 			39%;
}
.alignCenter {
	display: 		block; 
	text-align: 	center;
}
.input-row-wrap {
	padding:		3px;
}
.stageCustomArea {
	border:			1px solid gray;
	padding:		5px;
}
.stageEdge {
	padding-top: 	10px;
}
.right-item {
	float:			right;
}
.assetBlock {
	display:		block;
	margin:			3px;
}
</style>

<!-- 기존 스테이지 목록  -->
<div class="panel-wrapper">
	<div class="panel">
		<div class="head">
			<strong>프리셋 목록</strong>
			<button type="button" class="btn focus right-item">새 프리셋 추가</button>
		</div>
		<table class="table classic hover">
			<thead>
				<tr>
					<th class="w-5">#</th>
					<th class="w-15">프리셋명</th>
					<th class="w-10">작성자</th>
					<th>Stage Set</th>
					<th class="w-5"></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>9999</td>
					<td>사장님결재</td>
					<td>김사장</td>
					<td>
						<div>
							<span class="label success assetBlock">시작단계</span>
							<span class="icon icon-arrow4" style="vertical-align:middle;"></span>
							<span class="label success assetBlock">중간단계</span>
							<span class="icon icon-arrow4 " style="vertical-align:middle;"></span>
							<span class="label success assetBlock">작업완료</span>
							<span class="icon icon-arrow4" style="vertical-align:middle;"></span>
							<span class="label success assetBlock">끝났니?</span>
							<span class="icon icon-arrow4" style="vertical-align:middle;"></span>
							<span class="label success assetBlock">아니오.</span>
							<span class="icon icon-arrow4" style="vertical-align:middle;"></span>
							<span class="label success assetBlock">프론트가</span>
							<span class="icon icon-arrow4 " style="vertical-align:middle;"></span>
							<span class="label success assetBlock">시러시러</span>
						</div>
					</td>
					<td>
						<div class="alignCenter">
							<button type="button" class="btn mini focus">편집</button>
						</div>
					</td>
				</tr>
				<tr>
					<td>A</td><td>B</td><td>C</td><td>D</td><td>E</td>
				</tr>
				<tr>
					<td>A</td><td>B</td><td>C</td><td>D</td><td>E</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<!-- 신규 / 수정 스테이지  (show/hide)-->
<div class="panel-wrapper">
	<div class="panel">
		<div class="head">
			<strong>새 프리셋 추가/수정</strong>
		</div>
		<div class="body">
			<div class="input-row-wrap">
				<label for="presetName">프리셋이름</label>
				<input type="text" class="input" id="presetName" name="presetName" /> 			
			</div>
			<!-- 수정시 프리셋 아이디 저장용 -->
			<input type="hidden" name="issuePresetId" />
		</div>
		<div class="body">
			<div class="row">
				<div class="col col-2 stageEdge" style="text-align:right;">
					<span class="label success">시작단계</span>
					<span class="icon icon-arrow4" style="vertical-align:middle;"></span>
				</div>
				<div class="col col-8">
					<div class="stageCustomArea">
						<!-- 스테이지 커스텀 영역 -->
						<span class="label success assetBlock">업무시작</span>
						<span class="icon icon-arrow4" style="vertical-align:middle;"></span>
						
						<button class="btn assetBlock"><span class="icon icon-more bounce"></span></button>					
					</div>
				</div>
				<div class="col col-2 stageEdge">
					<span class="icon icon-arrow4" style="vertical-align:middle;"></span>
					<span class="label success">업무 종료</span>
				</div>				
			</div>
		</div>
		<div class="foot alignCenter">
			<button type="button" class="btn focus">저장</button>
			<button type="button" class="btn">초기화</button>
		</div>
	</div>
</div><!-- end of 신규/수정 스테이지 -->

<!-- 신규/기존 에셋 -->
<div class="row"> 
	<!-- 신규 에셋 추가  -->
	<div class="col col-4">
		<div class="panel-wrapper">
			<div class="panel">
				<div class="head">
					<strong>신규 에셋 추가</strong>
				</div>
				<div class="body">
					<div class="input-row-wrap">
						<label>에셋 이름</label>
						<input type="text" class="input" id="stageName" name="stageName" />
					</div>
					<div class="input-row-wrap">
						<label>에셋 설명</label>
						<input type="text" class="input" id="assetDescription" name="assetDescription" />
					</div>
					<div class="input-row-wrap alignCenter">
						<button type="button" class="btn focus">에셋 저장</button>
						<button type="button" class="btn">초기화</button>			
					</div>
				</div>
			</div>
		</div>
	</div><!-- end of 신규 에셋 추가 -->

	<!-- 기존 에셋 목록 -->
	<div class="col col-8">
		<div class="panel-wrapper">
			<div class="panel">
				<div class="head">
					<strong>에셋 목록</strong>
				</div>
				<table class="table classic hover">
					<thead>
						<tr>
							<th class="w-10">#</th>
							<th class="w-20">에셋 이름</th>
							<th>에셋 설명</th>
							<th class="w-10"></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>9999</td>
							<td>
								<div class="alignCenter">
									<span class="label mini success">업무시작</span>								
								</div>
							</td>
							<td>업무 시작 단계입니다. 기본중의 기본!</td>
							<td>
								<div class="alignCenter">
									<button type="button" class="btn mini focus">사용</button>								
								</div>
							</td>
						</tr>
						<tr>
							<td>A</td><td>B</td><td>C</td><td>D</td>
						</tr>
						<tr>
							<td>A</td><td>B</td><td>C</td><td>D</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div><!-- end of 기존 에셋 목록 -->
</div> <!-- end of row -->