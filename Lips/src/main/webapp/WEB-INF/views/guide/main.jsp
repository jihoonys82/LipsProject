<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	.wrap{
		padding: 10px;
		
	}
	
</style>
<div class="row mb-1">
		<div class="h2">${listType }</div>
	</div>
	<div class="hr"></div>
	<div class="row mt-1 mb-1 wrap" >
		<div class="panel col col-12" id="freeboardList">
			<div class="head">
				<strong>User guide</strong>
			</div>
			<div>
			<br>
				<a class="btn" onclick="">GuideMain</a>
				<a class="btn" onclick="">MainView</a>
				<a class="btn">Issue</a>
				<a class="btn">Project</a>
    		</div>
			
			
			
			<div class="guideList">
			
				<div class="GuideMain">
					<h1>환영합니다!</h1>
					프로젝트 관리도구 LIPS 를 사용해 주셔서 감사합니다.
					<br>
					LIPS는 프로젝트 수행을 체계적으로 하기 위한 프로젝트 관리를 웹으로 제공하는 서비스입니다.
					<br>
					<img src="/resources/img/guide/lips_main_project1.png">
					<br>
					<br>
					각 기능의 설명을 보고 싶으시다면 상단의 버튼을 눌러주세요 !
					<br>
				</div>
				
				<div class="MainView" hidden="true">
				<h1>MainView</h1>
				LIPS의 첫 시작 화면입니다.
				<br>
				중요한 내용과 최신 정보를 한 눈에 간편히 확인 할 수 있습니다.
				<br>
				<img src="lips_main_project1">
				<br>
				Lips info는 Lips의 프로젝트와 이슈의 정보를 한 눈에 보여줍니다.
				<br>
				현재 LIPS에서 진행 중인 프로젝트와 이슈의 총 갯수와 공개된 프로젝트의 갯수 및 소속된 프로젝트에 등록된 이슈의 갯수를 보여주며,
				<br>
				내가 참가한 프로젝트와 나에게 할당 된 이슈의 갯수를 한 눈에 확인 할 수 있습니다.
				<br>
				또한, 최신 순으로 정렬된 공지사항과 자유게시판, 팔로워 수가 가장 많은 상위 5개의 프로젝트를 보여줍니다
				</div>
				
				<div class="Issue" hidden="true">
				<h1>Issue</h1>
				이슈 생성 및 이슈 확인 방법입니다.
				<br>
				오른쪽 상단의 새 이슈 버튼을 누르면 자신이 참가 중인 프로젝트의 이슈를 생성할 수 있습니다.
				<br>
				데드라인이 가까운 이슈는 현재 참여하고 있는 프로젝트중 가장 마감일이 가까운 프로젝트를 보여줍니다.
				<br>
				가장 많이 팔로잉 한 이슈는 현재 참여중인 프로젝트 중 팔로잉을 제일 많이 받은 프로젝트를 보여줍니다.
				<br>
				내게 할당된 이슈는 참여중인 프로젝트의 팀원이나 자신이 생성한 이슈를 보여주며 해당 이슈의 할 일이 끝난 후, 담당자 변경을 통해 다른 팀원에게 할 일을 넘겨주거나
				<br>
				진행 상황의 진척도를 변경해 해당 프로젝트의 팀원들이 할 일의 달성률이 얼마나 되었는지 확인 할 수 있게 도와줍니다.
				<br>
				또한 팔로잉을 하여 해당 이슈의 생성 및 담당자에게 해당 내용을 숙지하였다고 알려 줄 수 있으며, 댓글을 다는 것도 가능합니다. 
				</div>
				
				<div class="Project" hidden="true">
				<h1>Project</h1>
				LIPS의 꽃인 프로젝트 생성 및 참여 방법입니다.
				<br>
				왼쪽 상단의  버튼을 클릭하면, 현재 참여중인 프로젝트와 LIPS 전체 프로젝트를 확인 할 수 있습니다.
				<br>
				Create 버튼을 누르면 프로젝트를 생성 할 수 있으며, 초대 코드를 부여 받아 조원을 초대 할 수 있습니다.
				<br>
				Join 버튼을 누르면 초대 코드를 입력하여 프로젝트에 참여 할 수 있습니다!
				</div>
			</div>
			
		</div><!-- end of panel -->
	</div><!-- end of row -->
	
<script>
$(document).ready(function(){
	var clickfunc = function(){
		
	}
	
	$("li").on(click , function (){
		var getLiId = $(this).attr("Id");
		$(".guideList").children("div").hide();
		$(".guideList").children("."+getLiId).show();
	})
});
</script>

