<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authentication property="principal.nick" var="usernick" />
<style>
.mainContents {
border : 1px solid white;
margin: 10px auto;
height: 7em;
}
</style>
<script>
$(document).ready(function() {
	var usernick = '${usernick }';
	var notifyTitle="Lips 알림 서비스";
	var options = {
			body	: usernick+"님 환영합니다. \r\n현재 알림기능을 사용 중 입니다."
	}
	notify(notifyTitle,options);
});
</script>



<div class="row">
	<div class="col col-6 mainContents">
		<div class="col col-6 mainContents">내가 속한 프로젝트 수ㅇㅇㅇ ${mainInfo.ProjectCount}</div>
		<div class="col col-6 mainContents">나에게 할당된 이슈 ${mainInfo.IssueCount}    </div>
	</div>
	<div class="col col-6 mainContents">
		<div class="col col-12 mainContents">공지사항 ${mainInfo.Notice}  </div>
	</div>
</div>

<div class="row">
	<div class="col col-6 mainContents">
		<div class="col col-12 mainContents">공개된 리스트 중 팔로워가 많은 순서 ${mainInfo.OpenProjectList} </div>
	</div>
	
	<div class="col col-6 mainContents">
	<div class="col col-12 mainContents">게시판 ${mainInfo.board} </div>
	</div>
</div>


