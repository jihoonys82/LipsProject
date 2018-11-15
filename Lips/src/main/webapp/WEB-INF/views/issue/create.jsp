<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sec:authentication property="principal.userId" var="userId"/>
<script>
//assignee autocomplete
jui.ready([ "ui.autocomplete" ], function(autocomplete) {
	assign = autocomplete("#assign", {
        target: "#assignee"
        , words: ["2글자 이상 입력하세요."]
		, dx : 175
		, dy : 470
    });
	
	$("#assignee").keyup(function() {
		var name = document.getElementById("assignee").value;
		if(name.length>0) {
			
			// Querystring null값인경우에 대한 예외처리
			var projId = $("select#projectId").val();
			
			if(projId == 0 ){
				return false;
			}
			
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
// 					console.log(e.responseText);
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
			, beforeSend: function () {
   				$("#stage_accordion div.content").empty();
   			}
			, success: function(data){
				// set category
				$("#categoryId").empty();
				for(var i=0;i<data.category.length;i++) {
					$("#categoryId").append("<option value='" 
						+ data.category[i].categoryAssetId +"'>" 
						+ "[" + data.category[i].assetCode +"] " 
						+ data.category[i].assetName 
						+ "</option>"
					);
				};
				// set preset
				$("tbody#presetList").empty();
				var $preset = "";
				for(var i=0;i<data.ispDtos.length;i++){
					$preset += "<tr>"
							+ "<td>"
								+ "<button class='btn focus selectTo'>선택</button> "
								+ "<strong>"
								+ data.ispDtos[i].presetName
								+ "</strong>"
								+ "<input type='hidden' value='" 
								+ data.ispDtos[i].issuePresetId 
								+ "'/>"
							+ "</td>"
							+ "<td>"
								+ "<button class='btn selectedPreset'>상세보기<span class='icon icon-left'></span></button>"
							+ "</td>"
							+ "</tr>";
				}
				$("tbody#presetList").append($preset);
				
				// button click event for select the preset 
				$("button.selectTo").on('click', function(){
					var ipId = $(this).siblings("input[type=hidden]").val();
					//console.log(ipId);
					$.ajax({
						type:"post"
						, url: "/issue/getStageAssets"
						, async : false
						, data: { "issuePresetId" : ipId }
						, dataType: "json"
						, beforeSend: function () {
							$("#selectedStage").empty();
						}
						, success: function(data){	
							var $content ="";
							for(var i=0;i<data.stageAssets.length;i++) {
								$content += "<span class='label mini success'>"+ data.stageAssets[i].stageName + "</span>";
								if(i<data.stageAssets.length-1) {
									$content += "<span class='icon icon-arrow4' style='vertical-align:middle;'></span>"
								}
							}
							$("#selectedStage").html($content);
							setStageModal.hide();
						}
						, error : function(e){
							console.log("----error----");
							console.log(e.responseText);
						}
					}); // end of ajax
				});
				
				// button click event for newly added button. 
				$("button.selectedPreset").on('click', function(){
					var ipId = $(this).parent().parent().find("input[type=hidden]").val();
					var target = $(this).parent();
					$.ajax({
						type:"post"
						, url: "/issue/getStageAssets"
						, data: { "issuePresetId" : ipId }
						, dataType: "json"
						, beforeSend: function () {
							target.empty();
						}
						, success: function(data){	
							var $content ="";
							for(var i=0;i<data.stageAssets.length;i++) {
								$content += "<span class='label mini success'>"+ data.stageAssets[i].stageName + "</span>";
								if(i<data.stageAssets.length-1) {
									$content += "<span class='icon icon-arrow4' style='vertical-align:middle;'></span>"
								}
							}
							target.html($content);
						}
						, error : function(e){
							console.log("----error----");
							console.log(e.responseText);
						}
					}); // end of ajax
				});
				
			}
			, error : function(e){
				console.log("----error----");
				console.log(e.responseText);
			}
		});
	});
	
	// assign to me buton action 
	$("#assignToMe").click(function(){
		$("#assignee").val('${userId}');
	});

	//selectPreset setting 
	$("div.title button").on('click', function(){
		var issuePresetId = $(this).attr('id');
		$("#stagePresetId").val(issuePresetId);
		$.ajax({
			type:"post"
			, url: "/issue/getStageAssets"
			, async : false
			, data: { "issuePresetId" : issuePresetId }
			, dataType: "json"
			, beforeSend: function () {
				$("#selectedStage").empty();
			}
			, success: function(data){	
				var $content ="";
				for(var i=0;i<data.stageAssets.length;i++) {
					$content += "<span class='label mini success'>"+ data.stageAssets[i].stageName + "</span>";
					if(i<data.stageAssets.length-1) {
						$content += "<span class='icon icon-arrow4' style='vertical-align:middle;'></span>"
					}
				}
				$("#selectedStage").html($content);
				setStageModal.hide();
			}
			, error : function(e){
				console.log("----error----");
				console.log(e.responseText);
			}
		}); // end of ajax
	}); //end of selectPreset setting
	
	// submit button ckick
	$("#issueFormSubmit").on("click", function() {
		// 1. file upload via ajax. TODO!!
		
		// 2. custom field data to json. TODO!!  
		
		// 3. form submit
		$("form[action='/issue/create']").submit();
	});
});

// Modal setup
jui.ready([ "ui.modal" ], function(modal) {
	$("#setStageModal").appendTo("body");

    setStageModal = modal("#setStageModal", {
        color: "gray"
    });
    
    //close button event
    $("#cancelStage").click(function(){
		setStageModal.hide();
	});
    
});

//Stage List Accordion
jui.ready([ "ui.accordion" ], function(accordion) {
    stage_accordion = accordion("#stage_accordion", {
        event: {
            open: function(index, e) {
                $(this.root).find("i").attr("class", "icon-arrow1");
                $(e.target).find("i").attr("class", "icon-arrow3");
                var issuePresetId = $(e.target).children("button").attr('id');
                $.ajax({
        			type:"post"
        			, url: "/issue/getStageAssets"
        			, data: { "issuePresetId" : issuePresetId }
        			, dataType: "json"
        			, beforeSend: function () {
        				$("#stage_accordion div.content").empty();
        			}
        			, success: function(data){	
        				var $content ="";
        				for(var i=0;i<data.stageAssets.length;i++) {
        					$content += "<span class='label success'>"+ data.stageAssets[i].stageName + "</span>";
        					if(i<data.stageAssets.length-1) {
        						$content += "<span class='icon icon-arrow4' style='vertical-align:middle;'></span>"
        					}
        				}
        				$("#stage_accordion div.content").html($content);
        			}
        			, error : function(e){
        				console.log("----error----");
        				console.log(e.responseText);
        			}
        		}); // end of ajax
            }// end of open:function
        } // end of event
    	, index: 0
    });// end of accordion
});//end of jui.ready for accordion

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
			<form action="/issue/create" method="post" enctype="multipart/form-data" onsubmit="customValue();">
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
					<label for="categoryId" class="issue-form-label">카테고리</label>
					<select name="categoryId" id="categoryId" class="input issue-form-input">
						<c:forEach items="${category }" var="cat">
							<option value="${cat.categoryAssetId }">[${cat.assetCode }] ${cat.assetName }</option>
						</c:forEach>
					</select>
				</div>
				<div class="issue-form-row">
					<label for="expectedEndDate" class="issue-form-label">종료(예정)일</label>
					<input type="date" name="expectedEndDate" id="expectedEndDate" class=" input issue-form-input" />
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
					<label for="stagePresetId" class="issue-form-label">이슈 단계</label>
					<input type="hidden" name="stagePresetId" id="stagePresetId" class=" input issue-form-input" />
					<div id="selectedStage" class="input issue-form-input" style="min-height:2.5em;"></div>
					<button type="button" class="btn" onclick="setStageModal.show();">단계 설정</button>
				</div>
				<div class="issue-form-row">
					<label for="issueContent" class="issue-form-label">내용</label>
					<textarea name="issueContent" id="issueContent" class="input issue-form-input" rows="10"></textarea>
				</div>
				<div class="issue-form-row">
					<input type="hidden" name="customValues" id="customValues" class="input issue-form-input" value="" />
				</div>
			</form>
			
			<div class="issue-form-row">
				<label for="issueFile" class="issue-form-label">파일 업로드</label>
				추가예정

			</div>
			<div class="hr mt-1 mb-1"></div>
			<div class="h4 mt-1 mb-1" >추가항목</div>
			<div class="issue-form-row" id="customDiv">
				<div id="issueCustom1">
					<p style="text-align:center">컬럼타입, 컬럼명을 지정하지 않을 경우 해당컬럼의 데이터가 저장되지 않습니다.<p>
					<button id="addCustomBtn" class="btn focus" style="width : 20%; text-align: center;"  onclick="addCustom()">커스텀 컬럼 추가하기</button>
				 </div>
				 <script>
				 var i = 0;
				 function addCustom(){
					$("<div style='display: none;'>"+
						"<div style='display:flex'>"+
							"<select name='customSelect' id='custom"+i+"' class='input issue-form-input customSelect' style='width: 15%; margin-bottom: 10px;' onchange='selectType(this)'>"+
								"<option value='0' >컬럼 타입</option>"+
								"<option value='text'>text</option>"+
								"<option value='checkbox'>checkbox</option>"+
								"<option value='color'>color</option>"+
								"<option value='date'>date</option>"+
								"<option value='range'>range</option>"+
								"<option value='time'>time</option>"+
							"</select>"+
						"</div>"+
					"</div>"					 
					 ).prependTo($('#issueCustom1')).slideDown("slow");
					i++;
				 }
				 function selectType(select){ 
					var idx = select.options.selectedIndex;
					$("#"+select.id+"Input").remove();
					$("#"+select.id+"Name").remove();
					if(idx==0) return;
					createColumnBox(select.options[idx].value, select.id);
				 }
				 
				 function createColumnBox(type,id){
					$("#"+id+"Name").remove();
					$("#"+id).after($("<input type='text' id='"+id+"Name' class='input customName' style='margin-left:10px;'"+ 
							"placeholder='컬럼명을 입력해 주세요' onfocusout=createInputBox('"+type+"','"+id+"') />"));
				 }
				 
				 function createInputBox(type,id){
					 
					 $("#"+id+"Input").remove();
					 
					 if(type=="checkbox"){
						 $("#"+id+"Name").after($("<input type='"+type+"' id='"+id+"Input' class='input customInput' style='width:3%; margin-left:5px;' />"));                           
 					 }else if(type=="range"){
						 $("#"+id+"Name").after($("<input type='"+type+"' id='"+id+"Input' class='input customInput' style='width:40%; margin-left:5px;' oninput=$('#"+id+"InputVal').text($('#"+id+"Input').val()) /><b id='"+id+"InputVal'>50</b>"));
					 }
					 else{
						 $("#"+id+"Name").after($("<input type='"+type+"' id='"+id+"Input' class='input customInput' style='width:50%; margin-left:5px;' />"));	 
					 }
				
				 }
				 function customValue(){
					 var arr = new Array();
					 var $name = $('.customName');
					 var $input = $('.customInput');
					 for(var i=0;i<$input.length;i++){
						 var obj = {};
						 if($name[i].value ==""){
							 continue;
						 }
						 if($input[i].type =="checkbox"){
							if($input[i].checked==true){
								obj["value"]=true;
							}
							else{
								obj["value"]=false;
							}
						 }else{
							 obj["value"]=$input[i].value;
						 }
						 obj["name"]=$name[i].value;
						 obj["type"]=$input[i].type;
						 arr.push(obj);
					 }
					 $('#customValues').val(JSON.stringify(arr));
				 }
				 </script>
			</div>
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
		<div class="row mt-1">
			<div class="col col-1"></div> <!-- column spacing -->
			<div class="col col-10">
				<c:set var="startNo" value="1"/>
				<c:set var="endNo" value="99"/>
				<table class="table hover classic" >
					<thead>
						<tr>
							<th style="width:20%; text-align:center;">프리셋명</th>
							<th style="text-align:center;">단계</th>
						</tr>
					</thead>
					<tbody id="presetList">
						<tr>
							<td colspan="2">프로젝트를 먼전 선택해 주세요. </td>
						</tr>
					</tbody>
				</table>
			</div><!-- end of col-10 -->
		</div><!-- end of row -->
		<div style="text-align: center; margin-top: 30px;">
			<button type="button" id="cancelStage" class="btn">Close</button>
		</div>
	</div>
</div>


