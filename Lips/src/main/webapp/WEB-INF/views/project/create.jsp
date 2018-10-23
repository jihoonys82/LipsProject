<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<div class="row">
	<div class="h3 issueHeading">프로젝트 생성</div>
	<div class="panel myIssue">
		<div class="head">
			<strong>프로젝트 정보를 입력하세요</strong>
		</div>
		<div class="body">
			<form name="insertform" method="post">
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
						class="input issue-form-input" onkeyup="len_chk()"></textarea>
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
						class="input issue-form-input"
						value=<sec:authorize access="hasAuthority('USER')">
		<sec:authentication property="principal.userId"/></sec:authorize>
						readonly />
				</div>


			</form>


		</div>
	</div>
	<div class="foot alignCenter">
		<!-- 		<button class="btn" onclick="modal_1.show()"><i class="icon-play"></i> Create</button> -->
		<button class="btn focus" id="createProject">
			<i class="icon-play "></i> Create
		</button>
		<button type="button" class="btn">Cancel</button>

	</div>

	<!--모달  -->
	<div id="modal_1" class="msgbox" style="display: none; width: 30em">
		<div class="head">프로젝트 생성</div>
	
		<div class="body" style="text-align:center;">
		<div id="modalsr" style="text-align:center; margin : 1em auto"><p>프로젝트 생성에 성공하였습니다.</p><p>프로젝트 참가 코드 </p></div>
			
 				<button id="invitecopy"class="btn focus" style="float: right; bottom: 3.3em; right: 0.5em;"> Copy </button>
			<div style="text-align: center; margin-top: 45px;">
				<a class="btn focus small" href="/project/main">확인</a> 
			</div>
		</div>
	</div>
	
	<!-- 모달 끝 -->


	<!--  ajax-->
	<script type="text/javascript">
	
	
	function len_chk(){  
		  var frm = document.insertform.projectDesc; 
		     
		  if(frm.value.length > 150){  
		       alert("글자수는  150자로 제한됩니다.!");  
		       frm.value = frm.value.substring(0,150);  
		       frm.focus();  
		  } 
		 
		} 
	
		$(document).ready(function() {
		
		
			//글자수 제한 체크	
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
					return;
					
				} else if(!projectKey){
					alert("프로젝트 키를 입력하세요");
					isvalid=false;
					return;	
				} else if(!closeDate){
					alert("종료 예정일을 입력하세요.");
					isvalid=false;
					return;	
				} else if(!projectDesc){
					alert("프로젝트에 대한 설명을 입력하세요");
					isvalid=false;
					return;	
				} 
				
				
				
				
				//04. 에이잭스
				if(isValid) {
				$.ajax({
					type : "post"
					, url : "/project/create"
					, beforesend: function(){
						
					}
					, data : {"projectName":projectName, "projectKey":projectKey, "closeDate":closeDate, "projectDesc":projectDesc, "projectOpen":projectOpen, "projectCreater":projectCreater }
					, dataType: "json"
					, success : function(data) {
						console.log("프로젝트 생성"+data.invitecode);
						var $invitediv = $("<input/>", {id : "invitediv", type : "text", class : "input", value: data.invitecode, readonly : ""});
// 				
// 					  	$("#invitediv").val(data.invitecode)
// 						$("#invitediv").css({
// 							"text-align" : "center",
// 							"height" : "1.5em!important",
// 							"font-size" : "1.2em!important"

						
							
// 						});  //안먹음 왜 안먹는지모름..
						$("#modalsr").append($invitediv);
// 						$("#modalsr").modal({keyboard: false,backdrop: 'static'})
						modal_1.show();

					
					
// 						modal_1.hide();
					}
					, error : function() {
						$("#modalsr").html("<div>프로젝트 생성에 실패하였습니다. 잠시 후 다시 시도해주세요.</div>")
					
						modal_1.show();
						
					}
				})
				}
				
				$("#invitecopy").click(function(){
					$("#invitediv").select(); document.execCommand('copy'); 
						alert("초대코드가 복사되었습니다");	
				});

				
				
			});
		});
		
		jui.ready([ "ui.modal" ], function(modal) {
			$("#modal_1").appendTo("body");

			modal_1 = modal("#modal_1", {
				color : "black"
			

				
			});
		});
	</script>




</div>