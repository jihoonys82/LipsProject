<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="/resources/css/tip-darkgray/tip-darkgray.css" />
<script type="text/javascript" src="/resources/js/userinfo/jquery.poshytip.min.js?ver=1" ></script>
<style>
::-webkit-scrollbar{
	width:0px;
}
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
<div class="panel-wrapper" style="overflow-y: scroll; max-height: 250px;">
	<div class="panel">
		<div class="head">
			<strong>프리셋 목록</strong>
			<button type="button" class="btn focus right-item" onclick="addPreset()">새 프리셋 추가</button>
		</div>
		<table class="table classic hover" id="proPresetList" >
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
			<c:forEach items="${presetList }" var="preset"  varStatus="presetStatus">
				<c:if test="${preset.projectId eq 0 }" >
				<tr style="background-color:#8f7ff266">
				</c:if>
				<c:if test="${preset.projectId ne 0 }" >
				<tr>
				</c:if>
				<td>${preset.issuePresetId }</td>
				<td>${preset.presetName }</td>
				<td>${preset.userId }</td>
				<td id="assetListTr${presetStatus.index}">
					<c:forEach items="${presetAssetList[presetStatus.index]}" var="presetAsset" varStatus="assetStatus">
						<span value="${presetAsset.stageAssetId}"class="label success assetBlock">${presetAsset.stageName }</span>
						<c:if test="${assetStatus.index ne fn:length(presetAssetList[presetStatus.index])-1}">
							<span class="icon icon-arrow4" style="vertical-align:middle;"></span>							
						</c:if> 
					</c:forEach>
				</td>
				<td>
					<div class="alignCenter">
						<button type="button" class="btn mini focus" onclick="modifyPreset(${preset.issuePresetId},'${preset.presetName }',$('#assetListTr'+${presetStatus.index }),${preset.projectId })">편집</button>
					</div>
				</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<!-- 신규 / 수정 스테이지  (show/hide)-->
<div class="panel-wrapper" id="addAndModify">
	<div class="panel">
		<div class="head" >
			<strong>새 프리셋 추가</strong>
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
					<span class="label success">시작대기</span>
					<span class="icon icon-arrow4" style="vertical-align:middle;"></span>
				</div>
				<div class="col col-8">
					<div class="stageCustomArea">
						<!-- 스테이지 커스텀 영역 -->
						<button id="presetAddBtn" class="btn assetBlock" onclick="addPresetFocus()"><span class="icon icon-more bounce" ></span></button>
						<script>
							var modifyPresetId = null;
							var modifyStatus = false;
							var modifyFlag = false;
							function presetDelete(){
								if(modifyFlag)return;
								modifyFlag = true;
								$.ajax({
									url : "/issue/presetDelete",
									type : "POST",
									data : { 	
										issuePresetId 	: modifyPresetId,
										projectId		: ${projectId}
									},
									success : function(responseData) {
										window.location.reload();
									}
								});
							}
							function presetModify(){
								console.log(modifyPresetId);// 수정할 프리셋 id
								
								 var assetList = [];
								 jQuery.ajaxSettings.traditional = true;
									assetList.push(1);
								 $('.customAssetBlock').each(function(){
									assetList.push($(this).attr('value')); 
								 });
								 	assetList.push(99);
								 	if(modifyFlag) return;
								 	modifyFlag = true;
								$.ajax({
									url : "/issue/presetModify",
									type : "POST",
									data : { 	
										presetName 		: $('#presetName').val(),
										issuePresetId 	: modifyPresetId,
										projectId		: ${projectId},
										assetIdList 	: assetList 
									},
									success : function(responseData) {
										window.location.reload();
									}
								});
							}
							function addPreset(){
								modifyStats = false;
								$('#addAndModify').hide().show(400);
								$('#addAndModify strong').html('새 프리셋 추가');
								$('#presetSaveBtn').show();
								$('#presetModifyBtn').hide();
								$('#presetDeleteBtn').hide();
								$('#presetName').val('');
								$('.customAsset').remove();
							}
							function modifyPreset(presetId,presetName,assetList,projectId){
								if(projectId == 0){
									alert('기본 프리셋은 수정할 수 없습니다.');
									return;
								}
								
								modifyPresetId = presetId;
								modifyStatus = true;
								
								customAssetIndex = 2;
								$('#addAndModify').hide().show(400);
								$('#presetSaveBtn').hide();
								$('#presetModifyBtn').show();
								$('#presetDeleteBtn').show();
								$('#addAndModify strong').html("["+presetName+'] 프리셋 수정');
								$('.customAsset').remove();
								$('#presetName').val(presetName);
								var assetList = assetList.children('.assetBlock').clone();
								for (var i = 1 ; i<assetList.length-1;i++){
									var value = assetList[i].value;
									$('#presetAddBtn').before($(assetList[i]).addClass("customAssetBlock").addClass("customAsset").attr('id','modifyAsset'+customAssetIndex).attr('value',value));
									$('#modifyAsset'+customAssetIndex).after('<span class="icon icon-arrow4 customAsset" style="vertical-align:middle;"></span>');
									customAssetIndex++;
								}
							}
							var isFocus = false;
							function addPresetFocus(){
								if(isFocus){
									$("#presetAddBtn").removeClass('focus');
									isFocus=false;
								}else{
									$("#presetAddBtn").addClass('focus');
									isFocus=true;
								}
							}
							var customAssetIndex = 2;
							var arrPoshy = [];
							function addAsset(stageAssetId,stageName,assetDescription,index){
								if(!isFocus) return;
								$("<span value='"+stageAssetId+"' id='customAssetIndex"+customAssetIndex+"' class='label success assetBlock customAsset customAssetBlock' onmouseover=$('#customAssetIndex"+customAssetIndex+"').poshytip('show') onmouseout=$('#customAssetIndex"+customAssetIndex+"').poshytip('hide')>" +
									stageName +
								"</span><span class='icon icon-arrow4 customAsset' style='vertical-align:middle;'></span>").insertBefore('#presetAddBtn').hide().show(400);
								createPoshy(assetDescription,customAssetIndex);
								customAssetIndex++;
							}
							function createPoshy(assetDescription,index){
								$('#customAssetIndex'+index).poshytip({
									content: assetDescription,
									className: 'tip-darkgray',
									bgImageFrameSize: 11,
									showOn: 'none',
									alignTo: 'target',
									alignX: 'inner-left',
									offsetX: 0,
									offsetY: 5
									})
							}
							function resetAsset(){
								customAssetIndex = 2;
								$('.customAsset').hide(400,function(){$('.customAsset').remove()});
							}
						</script>					
					</div>
				</div>
				<div class="col col-2 stageEdge">
					<span class="icon icon-arrow4" style="vertical-align:middle;"></span>
					<span class="label success">업무 종료</span>
				</div>				
			</div>
		</div>
		<div class="foot alignCenter">
			<button type="button" class="btn focus" id="presetSaveBtn" onclick="presetSave()">저장</button>
			<button type="button" class="btn focus" id="presetModifyBtn" onclick="presetModify()" style="display:none">수정</button>
			<button type="button" class="btn focus" id="presetDeleteBtn" onclick="presetDelete()" style="display:none">삭제</button>
			<script>
			 function presetSave(){
				 var assetList = [];
				 jQuery.ajaxSettings.traditional = true;
					assetList.push(1);
				 $('.customAssetBlock').each(function(){
					assetList.push($(this).attr('value')); 
				 });
				 	assetList.push(99);
					$.ajax({
						url : "/issue/presetSave",
						type : "POST",
						data : { 	
							presetName 		: $('#presetName').val(),
							projectId 		: ${projectId},
							assetIdList 	: assetList 
						},
						success : function(responseData) {
							window.location.reload();
						}
					});
			 }
			</script>
			<button type="button" class="btn" onclick="resetAsset()">초기화</button>
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
						<button type="button" class="btn focus" onclick="assetSave()">에셋 저장</button>
						<script>
						 function assetSave(){
								$.ajax({
									url : "/issue/assetSave",
									type : "POST",
									data : {
										stageName : $("#stageName").val(),
										assetDescription : $("#assetDescription").val(),
										projectId : ${projectId}
									},
									success : function(responseData) {
										window.location.reload();
									}
								});
						 }
						 var delFlag = false;
						 function delAsset(stageAssetId,projectId){
							 if(delFlag) return;
								 if(projectId == 0){
								 alert("기본 애셋은 삭제할 수 없습니다.")
								 return;
							 }
							 delFlag = true;
							 $.ajax({
								 url : "/issue/delAsset",
								 type : "POST",
								 data : {
									 stageAssetId : stageAssetId,
									 projectId : projectId
								 },
								success : function(responseData){
									window.location.reload();
								} 
							 });
						 }
						 function assetReset(){
							 $('#stageName').val('');
							 $('#assetDescription').val('');
						 }
						</script>
						<button type="button" class="btn" onclick="assetReset();">초기화</button>		
					</div>
				</div>
			</div>
		</div>
	</div><!-- end of 신규 에셋 추가 -->

	<!-- 기존 에셋 목록 -->
	<div class="col col-8">
		<div class="panel-wrapper" style="overflow-y: scroll; max-height: 200px;">
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
							<th class="w-10"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${assetList }" var="asset" varStatus="status">

							<c:if test="${asset.projectId eq 0 }">
								<tr id="assetList${status.index }" style="background-color: #8f7ff266">
							</c:if>
							<c:if test="${asset.projectId ne 0 }">
								<tr id="assetList${status.index }">
							</c:if>
							<td>${asset.stageAssetId }</td>
								<td>${asset.stageName }</td>
								<td>${asset.assetDescription }</td>
								<td>
									<div class="alignCenter">
										<button id="addAssetBtn${status.index }" type="button" class="btn mini focus" onclick="addAsset('${asset.stageAssetId }','${asset.stageName }','${asset.assetDescription }','${status.index }')">등록</button>
									</div>
								</td>
								<td>
									<div class="alignCenter">
										<button id="delAssetBtn${status.index }" type="button" class="btn mini focus" onclick="delAsset('${asset.stageAssetId }','${asset.projectId }')">삭제</button>
									</div>
								</td>
								
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div><!-- end of 기존 에셋 목록 -->
</div> <!-- end of row -->
<br><br><br><br><br><br><br>