<%@page import="lips.userinfo.dto.UserByToken"%>
<%@page import="lips.userinfo.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" href="/resources/css/userinfo/mypage.css?ver=2" />
<jsp:include page="./joinposhy.jsp" />

<script src="http://malsup.github.com/min/jquery.form.min.js"></script> 
<script type="text/javascript" src="/resources/js/moment.min.js"></script>
<script type="text/javascript"	src="/resources/js/userinfo/inputValid.js?ver=1"></script>
<script type="text/javascript">
function checkUpdateForm(){
	validNick($('#inputNick').val());
	validPhone($('#inputPhone').val());
	validBirth($('#inputBirth').val());
	if(!completePw||!completeNick||!completePhone||!completeBirth){
	
		console.log(completePw);
		console.log(completeNick);
		console.log(completePhone);
		console.log(completeBirth);
		alert('입력값을 확인해 주세요');
		return;
	}
	else{
		$('#mypageform').submit();
	}
}

jui.ready([ "ui.modal" ], function(modal) {
	// modal 1 - deactivate modal setting 회원탈퇴 모달 
    $("#deactivate_modal").appendTo("body");

    deactivate_modal = modal("#deactivate_modal", {
        color: "gray"
    });
    
    // modal 2 - myFile modal setting 내 파일 목록
    $("#myFile_modal").appendTo("body");

    myFile_modal = modal("#myFile_modal", {
        color: "gray"
    });
    
    $(".openMyFile").on('click', function(){
    	$.ajax({
			type:"post"
			, url: "/file/myFile"
			, dataType: "json"
			, success: function(data){
				var tbody="";
				for(var i=0;i<data.files.length;i++){
					var f = data.files[i];
					tbody += "<tr>"
						+ "<td>" + f.originName + "</td>"
						+ "<td>" + (f.fileSize/1024).toFixed(0) + "</td>"
						+ "<td>" + moment(f.uploadDate).format("YYYY-MM-DD HH:mm:ss") + "</td>"
						+ "<td>" 
							+ "<input type='hidden' name='fileId' value='" + f.fileId + "' />" 
							+ "<a href='/file/downloadFile?fileId="+f.fileId+"' class='btn mini focus downFile'>다운</a> "
							+ "<button class='btn mini delFile'>삭제</button>"
						+ "</td>"
						+ "</tr>";
				}
				$("#fList").html(tbody);
				
				$("button.delFile").on("click", function(){
					if(!confirm("파일을 정말로 삭제하시겠습니까?")){
						return false;
					}
					var fileId = $(this).parent().find("input[name=fileId]").val();
					var delTarget = $(this).parent().parent()
					$.ajax({
						type:"post"
						, url: "/file/deleteFile"
						, data: { "fileId" : fileId }
						, dataType: "json"
						, success: function(data){
							console.log(data.result);
							delTarget.remove();
						}
						, error : function(e){
							console.log("----error----");
							console.log(e.responseText);
						}
					}); // end of ajax
				});
				
		    	myFile_modal.show();
			}
			, error : function(e){
				console.log("----error----");
				console.log(e.responseText);
			}
		});// end of ajax
    }); //end of .openMyFile click event
    
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
					+ "<a href='/file/downloadFile?fileId="+res.fileId+"' class='btn mini focus downFile'>다운</a> "
					+ "<button class='btn mini delFile'>삭제</button>"
				+ "</td>"
				+ "</tr>";
			$("#fList").append(targetRow);
			$("#fileUp").find("input").val("");
		}
		, error: function() {
			console.log("실패");
		}
		
		
	});
}); // end of jui ready

$(document).ready(function(){
	// comment file upload (not action)
	$("input:file").on('change',function(){
		var $fname= $("input:file").val();
		$("input[name='fileName']").val($fname);
	});
});
</script>

<style>
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

<div class="myPageBox">
	<div class="head clearfix">
		<div class="h1" style="display:block; width: 50%;">마이페이지</div>
		<div style="display:block; float:right;">
			<button class="btn large focus openMyFile" >내 파일 보관함</button>
		</div>
	</div>
	<br> <br>
	<form action="/user/mypage/update" method="POST" id="mypageform">
		<div class="formItem">
			<label for="inputId">아이디 (ID)</label> <input class="input large"
				type="text" id="inputId" name="userId"
				value="<sec:authentication property='principal.userId' />"
				readonly="readonly" />
		</div>
		<div class="formItem">
			<label for="inputPw">비밀번호 (PASSWORD)</label> <input
				class="input large" type="password" id="inputPw" name="pw"
				onfocus="$('#inputPw').poshytip('show');"
				onfocusout="$('#inputPw').poshytip('hide');" />
		</div>
		<div class="formItem">
			<label for="inputPwCheck">비밀번호 확인 (CONFIRM)</label> <input
				class="input large" type="password" id="inputPwCheck" name="pwCheck"
				onfocusout="validPw(this.value)" />
		</div>

		<div class="formItem">
			<label for="inputEmail">이메일 (EMAIL)</label> <input
				class="input large" type="email" id="inputEmail" name="email"
				value="<sec:authentication property='principal.email' />"
				readonly="readonly" />
		</div>

		<div class="formItem">
			<label for="inputNick">닉네임 (NICK)</label> <input class="input large"
				type="text" id="inputNick" name="nick"
				onfocus="$('#inputNick').poshytip('show');"
				onfocusout="isValidNick(this.value)"
				value="<sec:authentication property='principal.nick' />" />
		</div>

		<div class="formItem">
			<label for="inputPhone">연락처 (PHONE)</label> <input
				class="input large" type="text" id="inputPhone" name="phone"
				onfocus="$('#inputPhone').poshytip('show');"
				onfocusout="validPhone(this.value)"
				value="<sec:authentication property='principal.phone' />" />
		</div>

		<div class="formItem">
			<fmt:formatDate pattern="yyyy-MM-dd"
				value="<%=new UserByToken().getInstance().getBirth()%>" var='birth' />
			<label for="inputBirth">생년월일 (BIRTH)</label> <input
				class="input large" type="date" id="inputBirth" name="birth"
				style="width: 48%;" onfocusout="validBirth(this.value)"
				value='${birth }' />

		</div>


		<div class="formItem">
			<input type="button" class="btn large focus"
				onclick="checkUpdateForm()" value="submit" />
		</div>
	</form>
	<div class="deactive">
		<button class="btn mini" onclick="deactivate_modal.show()">회원탈퇴</button>
	</div>
</div>

<div id="deactivate_modal" class="msgbox" style="display: none;">
    <div class="head">
		<span class="label small danger">주의</span> <strong>회원탈퇴</strong>
    </div>
    <div class="body">
		정말로 회원 탈퇴를 원하시면 패스워드를 한번 더 입력하고 탈퇴버튼을 클릭해 주세요.<br/>
		탈퇴 후에는 같은 이메일로 재가입이 불가합니다. <br/>
		<form action="/mypage/deactivate" method="post">
			<div style="text-align:center; margin:5px;">
				<label for="confirmPw">패스워드 입력</label>
				<input type="password" id="confirmPw" name="confirmPw" class="input mini" placeholder="한번더 신중히 .."/>
			</div>
        </form>
        <div style="text-align: center; margin-top: 45px;">
            <button type="button" class="btn focus mini">회원탈퇴</button>
            <button class="btn small close" onclick="deactivate_modal.hide();">닫기</button>
        </div>
    </div>
</div>

<div id="myFile_modal" class="msgbox" style="width:80%; display: none;">
    <div class="head">
		<strong>내 파일 보관함 </strong>
    </div>
    <div class="body" style="min-height:200px;">
		<div class="panel myFileList">
			<div class="head">
				<strong>파일 목록</strong>
			</div>
			<table class="table classic hover">
				<thead>
					<tr>
						<th>파일명</th>
						<th>용량(KB)</th>
						<th>업로드일시</th>
						<th style="width:15%;">다운로드</th>
					</tr>
				</thead>
				<tbody id="fList"></tbody>
			</table>
		</div>
		<div class="panel fileUpload">
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
		</div>
    </div>
    <div class="foot" style="text-align: center; padding: 5px;">
		<button class="btn small close" onclick="myFile_modal.hide();">닫기</button>
    </div>
</div>