<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sec:authentication property="principal.userId" var="userId"/>

<script src="http://malsup.github.com/min/jquery.form.min.js"></script> 
<script type="text/javascript" src="/resources/js/moment.min.js"></script>

<c:set var="startNo" value="1"/>
<c:set var="endNo" value="99"/>
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
					var ipId = $(this).parent().find("input").val();
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
							$("#stagePresetId").val(ipId);
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
// 	$("div.title button").on('click', function(){
// 		var issuePresetId = $(this).attr('id');
// 		$("#stagePresetId").val(issuePresetId);
// 		$.ajax({
// 			type:"post"
// 			, url: "/issue/getStageAssets"
// 			, async : false
// 			, data: { "issuePresetId" : issuePresetId }
// 			, dataType: "json"
// 			, beforeSend: function () {
// 				$("#selectedStage").empty();
// 			}
// 			, success: function(data){	
// 				var $content ="";
// 				for(var i=0;i<data.stageAssets.length;i++) {
// 					$content += "<span class='label mini success'>"+ data.stageAssets[i].stageName + "</span>";
// 					if(i<data.stageAssets.length-1) {
// 						$content += "<span class='icon icon-arrow4' style='vertical-align:middle;'></span>"
// 					}
// 				}
// 				$("#selectedStage").html($content);
// 				setStageModal.hide();
// 			}
// 			, error : function(e){
// 				console.log("----error----");
// 				console.log(e.responseText);
// 			}
// 		}); // end of ajax
// 	}); //end of selectPreset setting
	
	// submit button ckick
	$("#issueFormSubmit").on("click", function() {
		// 1. file upload
		var fileDOMs = $("#ufList").find("input[name=fileId]");
		var files = [];
		for(var i=0;i<fileDOMs.length;i++){
			files[i] = fileDOMs.eq(i).val();
		}
		console.log(files);
		var inputFiles = $("<input>")
			.attr("type","hidden")
			.attr("name","files").val(files);
		
		$("form[action='/issue/create']").append(inputFiles);
		
		// 2. form submit
		$("form[action='/issue/create']").submit();
	});
	
	// set Default value of expectedEndDate - tomorrow
	var tomorrow = moment().add(1,"days").format("YYYY-MM-DD")
	$("#expectedEndDate").val(tomorrow).attr("min", moment().format("YYYY-MM-DD"));
	
	$("#subDay").on('click', function(){
		var eDate = $("#expectedEndDate");
		eDate.val(moment(eDate.val()).subtract(1,"days").format("YYYY-MM-DD"));
		var diff = moment(eDate.val() + " 00:00:00").diff(moment());
		if(diff<0) {
			eDate.val(moment().format("YYYY-MM-DD"));
		}
	})
	$("#addDay").on('click', function(){
		var eDate = $("#expectedEndDate");
		eDate.val(moment(eDate.val()).add(1,"days").format("YYYY-MM-DD"));
	})
	$("#subWeek").on('click', function(){
		var eDate = $("#expectedEndDate");
		eDate.val(moment(eDate.val()).subtract(1,"weeks").format("YYYY-MM-DD"));
		var diff = moment(eDate.val() + " 00:00:00").diff(moment());
		if(diff<0) {
			eDate.val(moment().format("YYYY-MM-DD"));
		}
	})
	$("#addWeek").on('click', function(){
		var eDate = $("#expectedEndDate");
		eDate.val(moment(eDate.val()).add(1,"weeks").format("YYYY-MM-DD"));
	})
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
    
  //selectFileModal
    $("#selectFileModal").appendTo("body");

    selectFileModal = modal("#selectFileModal", {
        color: "gray"
    });
 
    //close button event
    $("#cancelFile").click(function(){
    	selectFileModal.hide();
	});
    
    //open selectFileModal 
    $(".openMyFile").on('click', function(){
    	$.ajax({
			type:"post"
			, url: "/file/myFile"
			, dataType: "json"
			, success: function(data){
				console.log("hi");
				console.log(data.files.length);
				var tbody="";
				for(var i=0;i<data.files.length;i++){
					var f = data.files[i];
					tbody += "<tr>"
						+ "<td>" + f.originName + "</td>"
						+ "<td>" + (f.fileSize/1024).toFixed(0) + "</td>"
						+ "<td>" + moment(f.uploadDate).format("YYYY-MM-DD HH:mm:ss") + "</td>"
						+ "<td>" 
							+ "<input type='hidden' name='fileId' value='" + f.fileId + "' />" 
							+ "<button class='btn mini focus addFile'>선택</button>"
						+ "</td>"
						+ "</tr>";
				}
				$("#mfList").html(tbody);
				
				// add file
				$("button.addFile").on('click', function(){
					console.log("??");
					var noticeRow = $("tbody#ufList").find("td[colspan='4']");
					if(noticeRow.length>0){
						noticeRow.parent().remove();
					}
					var targetRow = $(this).parent().parent();
					if(targetRow.parent().attr("id")=="mfList"){
						$("#ufList").append(targetRow);						
					} else{
						$("#mfList").append(targetRow);
					}
				});
				
				selectFileModal.show();
			}
			, error : function(e){
				console.log("----error----");
				console.log(e.responseText);
			}
		});// end of ajax
    }); //end of .openMyFile click event
    
    //fileUpload Ajax
	$("#fileUp").ajaxForm({
		data: {
		}
		, dataType: "json"
		, success: function( res ) {
			//console.log("성공");
			var targetRow = "<tr>"
				+ "<td>" + res.fileName + "</td>"
				+ "<td>" + (res.fileSize/1024).toFixed(0) + "</td>"
				+ "<td>" + moment().format("YYYY-MM-DD HH:mm:ss") + "</td>"
				+ "<td>" 
					+ "<input type='hidden' name='fileId' value='" + res.fileId + "' />"
					+ "<button class='btn mini focus addFile'>선택</button> "
				+ "</td>"
				+ "</tr>";
				
			//$("#mfList").append(targetRow);
			
			var noticeRow = $("tbody#ufList").find("td[colspan='4']");
			if(noticeRow.length>0){
				noticeRow.parent().remove();
			}
			$("#ufList").append(targetRow);
			
			// add file
			$("button.addFile").on('click', function(){
				var noticeRow = $("tbody#ufList").find("td[colspan='4']");
				if(noticeRow.length>0){
					noticeRow.parent().remove();
				}
				var targetRow = $(this).parent().parent();
				if(targetRow.parent().attr("id")=="mfList"){
					$("#ufList").append(targetRow);						
				} else{
					$("#mfList").append(targetRow);
				}
			});
			
			// empty input values
			$("#fileUp").find("input").val("");
			
		}
		, error: function() {
			console.log("실패");
		}
	});
    
	// comment file upload (not action)
	$("input:file").on('change',function(){
		var $fname= $("input:file").val();
		$("input[name='fileName']").val($fname);
	});
	
	// submit file
	$("#submitFile").on('click', function(){
		var rows = $("#ufList").find("tr");
		for(var i=0;i<rows.length;i++){
			var tds = rows.eq(i).find("td");
			var fileId = tds.eq(3).find("input").val();
			var fileLink = $("<a>").attr("href","/file/downloadFile?fileId="+ fileId ).text(tds.eq(0).text());
			$("#issueFile").append(fileLink);
			$("#issueFile").append($("<br>"));
		}
		selectFileModal.hide();
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
#selectFileModal {
	width: 80%;
/* 	height: 50em; */
}
.tableWrap {
	padding: 10px;
}
/*  css for file upload */
.upload-group {
	margin-top: 5px;
}
input[name=fileName] {
	width : 100%;
}
.upload-btn-wrapper {
	padding-left: 5px;
	position: relative;
	overflow: hidden;
	display: inline-block;
}
.upload-btn-wrapper input[type=file] {
	font-size: 100px;
	position: absolute;
	left: 0;
	top: 0;
	opacity: 0;
} /*  end of css for file upload */
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
					<button type="button" id="subDay" class="btn mini" style="width:40px;">D-1</button>
					<button type="button" id="addDay" class="btn mini" style="width:40px;">D+1</button>
					<button type="button" id="subWeek" class="btn mini" style="width:40px;">W-1</button>
					<button type="button" id="addWeek" class="btn mini" style="width:40px;">W+1</button>
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
				<div id="issueFile" class="input issue-form-input" style="height:5em; overflow:auto;">
				</div>
				<button type="button" class="btn openMyFile">파일선택</button>
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
							<td colspan="2">프로젝트를 먼저 선택해 주세요. </td>
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

<!-- set file Modal -->
<div id="selectFileModal" class="msgbox" style="display: none;">
	<div class="head">
		파일 등록
	</div>
	<div class="body" style="height:42em; overflow:auto;">
		<div class="row">
			<div class="col col-6">
				<div class="panel upFileList tableWrap">
					<div class="head">
						<strong>업로드할 파일 목록</strong>
					</div>
					<table class="table classic hover" >
						<thead>
							<tr>
								<th>파일명</th>
								<th style="width:15%;">용량(KB)</th>
								<th>업로드일시</th>
								<th style="width:15%;">빼기</th>
							</tr>
						</thead>
						<tbody id="ufList">
							<tr>
								<td colspan="4">업로드할 파일을 선택해 주세요.</td>
							</tr>
						</tbody>
					</table>
				</div><!-- end of upload file list panel -->
			</div><!-- end of 1st col-6 -->
			<div class="col col-6">
				<div class="panel myFileList tableWrap">
					<div class="head">
						<strong>내 파일 목록</strong>
					</div>
					<table class="table classic hover" >
						<thead>
							<tr>
								<th>파일명</th>
								<th style="width:15%;">용량(KB)</th>
								<th>업로드일시</th>
								<th style="width:15%;">선택</th>
							</tr>
						</thead>
						<tbody id="mfList"></tbody>
					</table>
				</div><!-- end of file list panel -->
			</div><!-- end of 2nd col-6 -->
		</div><!-- end of first row -->
		<div class="row mt-1">
			<div class="panel fileUpload tableWrap">
				<div class="head">
					<strong>새 파일 등록</strong>
				</div>
				<div class="body">
					<form id="fileUp" action="/file/uploadFile" method="post" enctype="multipart/form-data">
						<div class="row" style="text-align:center;width:80%;">
							<div class="col col-8">
								<input class="input disabled" type="text" name="fileName"/>		
							</div>
							<div class="col col-3 upload-btn-wrapper">
								<button class="btn">파일 찾기</button>
								<input type="file" name="uploadFile"/>
								<button id="btnFileUp" class="btn focus">업로드</button>
							</div>
						</div>
					</form>
				</div>
			</div><!-- end of file upload panel -->
		</div><!-- end of 2nd row -->
		<div style="text-align: center; padding: 5px;">
			<button type="button" id="submitFile" class="btn focus">선택 완료</button>
			<button type="button" id="cancelFile" class="btn">Close</button>
		</div>
	</div><!-- end of modal body -->
</div><!-- end of modal -->


