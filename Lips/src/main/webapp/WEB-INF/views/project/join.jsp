<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<style>

.joinintro {

    top: 5em;
    position: relative;
    font-weight: bold;
    font-size: 1.2em;
}

.joinform {

 	top: 17em;
    position: relative;
}

.joininput {

    height: 2.5em!important;
    width: 50%;
}

.joinbtn{
	display: block!important;
    top: 5em;
    margin: 0 auto!important;

}
</style>

<div class="alignCenter joinintro">

  <div style="margin :3em;"> 초대코드를 입력하세요 </div>

	
	
<!-- 	<form method="POST" class="joinfrom"> -->
	<input type="text" name="invitecode" id="invitecode" class="input joininput">

	
<!-- 	</form> -->
	<button id="ProjectJoin" name="ProjectJoin" class="btn focus joinbtn">Join</button>

</div>

<script type="text/javascript">
$(document).ready(function() { 

	$("#ProjectJoin").click(function() {
	var ivCode = $("#invitecode").val();
	$.ajax({
		type : "post"
			, url : "/project/join"
			, beforesend: function(){}
			, data : {"invitecode": ivCode}
			, dataType: "json"
			, success : function(data) {
				console.log("조인 성공"+data.result);
				if(data.result==1) {
					alert("존재하지 않는 초대 코드입니다.");
					} else if(data.result==2) {
					alert("유효하지 않은 프로젝트 코드 입니다(24시간 경과).");
					} else if(data.result==3) {
					alert("가입되었습니다.");	
					$(location).attr('href', '/project/main');
					} else if(data.result==4) {
					alert("가입 되었습니다(재가입).")	
					$(location).attr('href', '/project/main');
// 					$(location).attr('href', '/project/main?projectId=' + ivCode )
					} else if(data.result==5) {
						alert("해당 프로젝트에 접근할 수 없습니다.")	
					} else if(data.result==6) {
						alert("이미 가입한 프로젝트 입니다.")	
					} 
			}
			, error : function() {console.log("조인 실패");}
		  })
});
});

</script>