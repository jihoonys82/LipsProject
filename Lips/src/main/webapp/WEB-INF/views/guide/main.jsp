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
			<div class="topguidebar">
			<br>
				<ul id="tab_1" class="tab top">
				    <li class="active" style="cursor:pointer"><a>GuideMain</a></li>
				    <li style="cursor:pointer"><a>MainView</a></li>
				    <li style="cursor:pointer"><a>Issue</a></li>
				    <li style="cursor:pointer"><a>Project</a></li>
				</ul>
    		</div>
    		
			<div id="tab_contents_1" class="guideList">
			
				<div id="GuideMain">
					<h1>가이드 페이지입니다!</h1>
					<p>프로젝트 관리도구 LIPS 를 사용해 주셔서 감사합니다.</p>
					<p>LIPS는 프로젝트 수행을 체계적으로 하기 위한 프로젝트 관리를 웹으로 제공하는 서비스입니다.</p>
					<p>각 기능의 설명을 보고 싶으시다면 상단의 버튼을 눌러주세요 !</p>
				</div>
				
				<div id="MainView" hidden="true">
					<h1>MainView</h1>
					LIPS의 첫 시작 화면입니다.
					<br>
					<p>중요한 내용과 최신 정보를 한 눈에 간편히 확인 할 수 있습니다.</p>
					<hr>
					<hr>
					<h3 class="h_sub">Lips info</h3>
					<div class="img_area">
						<img src="/resources/img/guide/lips_main_project1.png">
					</div>
					<p>Lips info는 Lips의 프로젝트와 이슈의 정보를 한 눈에 보여줍니다.</p>
					<P>오른쪽 상단의 issue와 project 를 클릭하여 이슈정보와 프로젝트 정보를 볼 수 있습니다</p>
					현재 LIPS에서 진행 중인 프로젝트와 이슈의 총 갯수와 공개된 프로젝트의 갯수 및 소속된 프로젝트에 등록된 이슈의 갯수를 보여주며,
					<br>
					내가 참가한 프로젝트와 나에게 할당 된 이슈의 갯수를 한 눈에 확인 할 수 있습니다.
					<hr>
					<hr>
					<h3 class="h_sub">Follower</h3>
					<div class="img_area">
						<img src="/resources/img/guide/main_follower_80.png">
					</div>
					<p>자신이 참여한 프로젝트 중 팔로워 수가 가장 많은 상위 5개의 프로젝트를 보여줍니다.</p>
					<p>이 를 활용한다면, 가장 바쁜 프로젝트, 가장 큰 프로젝트 등이 상위 5개 안에 올라오게 되므로 유용하게 사용 가능합니다!</p>  
					<hr>
					<hr>
					<h3 class="h_sub">ETC.</h3>
					<p>또한, Lips에선 프로젝트 관리 뿐만 아니라 최신 순으로 정렬된 공지사항과 자유게시판을 제공합니다.</p>
					<p>업무적인 프로젝트 외에도 개인 취미의 프로젝트 멤버를 Lips의 자유게시판에서 만나보세요!</p> 
				</div>
				
				<div id="Issue" hidden="true">
					<h1>Issue</h1>
					이슈 생성 및 이슈 확인 방법입니다.
					<br>
					<hr>
					<hr>
					<p>오른쪽 상단의<img src="/resources/img/guide/new_issue_button70.png">버튼을 누르면 자신이 참가 중인 프로젝트의 이슈를 생성할 수 있습니다.</p>
					<br>
					<h3 class="h_sub">New Issue Create</h3>
					<div class="img_area">
						<img src="/resources/img/guide/new_issue_create.png">
					</div>
					<p>새 이슈 생성 화면입니다</p>
					<p>현재 생성한 프로젝트나 참여중인 프로젝트 중에서 이슈를 만들 수 있습니다</p>
					<br>
					<h3 class="h_sub">Category</h3>
					<div class="img_area">
						<img src="/resources/img/guide/category.png">
					</div>
					<p>카테고리 지정 화면입니다</p>
					<p>현재 생성할 이슈의 카테고리를 지정해 줄 수 있습니다</p>
					<h3 class="h_sub">Assignee</h3>
					<div class="img_area">
						<img src="/resources/img/guide/Assignee.png">
					</div>
					<p>담당자 지정 화면입니다</p>
					<p>현재 이슈의 담당자를 지정해 줄 수 있으며 나에게 할당을 통해 현재 이슈를 자신에게 일임 할 수 있습니다</p>
					<h3 class="h_sub">Issue Level</h3>
					<div class="img_area">
						<img src="/resources/img/guide/issue_level.png">
					</div>
					<p>이슈 단계 설정 화면입니다</p>
					<p>현재 이슈의 단계를 지정해 줄 수 있습니다</p>
					<div class="img_area">
					<img src="/resources/img/guide/issue_level_priset.png">
					</div>
					<p>두개의 프리셋을 지원합니다</p>
					<hr>
					<hr>
					<h3 class="h_sub">Deadline issue</h3>
					<div class="img_area" style="display:block">
						<img src="/resources/img/guide/deadissue70.png">
					</div>
					<p>데드라인이 가까운 이슈는 현재 참여하고 있는 프로젝트중 가장 마감일이 가까운 프로젝트를 보여줍니다.</p>
					<p>남은 기간 뿐 아니라 내용 및 진행단계 댓글 수, 팔로워 수도 간단한 표 식으로 나타내어 알아보기 쉽습니다</p>
					<hr>
					<hr>
					<h3 class="h_sub">Following issue</h3>
					<div class="img_area">
						<img src="/resources/img/guide/following_issue70.png">
					</div>
					<p>가장 많이 팔로잉 한 이슈는 현재 참여중인 프로젝트 중 팔로잉을 제일 많이 받은 프로젝트를 보여줍니다.</p>
					<hr>
					<hr>
					<h3 class="h_sub">My Issue</h3>
					<div class="img_area">
						<img src="/resources/img/guide/myissue70.png">
					</div>
					<p>내게 할당된 이슈는 참여중인 프로젝트의 팀원이나 자신이 생성한 이슈를 보여주며 해당 이슈의 할 일이 끝난 후, 담당자 변경을 통해 다른 팀원에게 할 일을 넘겨주거나</p>
					진행 상황의 진척도를 변경해 해당 프로젝트의 팀원들이 할 일의 달성률이 얼마나 되었는지 확인 할 수 있게 도와줍니다.
					<p>또한 팔로잉을 하여 해당 이슈의 생성 및 담당자에게 해당 내용을 숙지하였다고 알려 줄 수 있으며, 댓글을 다는 것도 가능합니다.</p> 
					<hr>
					<hr>
					<h3 class="h_sub">My Following issue</h3>
					<div class="img_area">
						<img src="/resources/img/guide/my_following_issue.png">
					</div>
					<p>내가 팔로잉한 이슈는 참여중인 프로젝트의 팀원의 이슈를 팔로잉한 이슈입니다.</p>
					<p>마찬가지로, 해당 프로젝트 팀원이 할 일의 달성률과 현재 상황의 진척도를 알 수 있습니다.</p>
				</div>
				
				<div id="Project" hidden="true">
				<h1>Project</h1>
				LIPS의 꽃인 프로젝트 생성 및 참여 방법입니다.
				<br>
				<hr>
				<hr>
				<h3 class="h_sub">Project Main</h3>
				<div class="img_area">
					<img src="/resources/img/guide/project_main.png">
					<p>프로젝트 메인 화면입니다</p>
					<p>현재 참여중인 프로젝트들의 정보를 간략히 알 수 있습니다</p>
					<p>왼쪽 상단의<img src="/resources/img/guide/allproject.png">버튼을 클릭하여, LIPS 안의 전체 프로젝트를 확인 할 수 있습니다.</p>
					<p>프로젝트 메인 화면에서 Create 버튼을 누르면 프로젝트를 생성 가능하며, Join 버튼을 누르면 초대코드를 입력하여 프로젝트에 참여가 가능합니다</p>
					<p>자신이 생성한 프로젝트는 오른쪽 상단에 톱니바퀴 버튼이 뜨며, 이 버튼을 활용하여 프로젝트 관리를 할 수 있습니다</p>
				</div>
				<hr>
				<hr>
				<h3 class="h_sub">Project Create</h3>
				<div class="img_area">
					<img src="/resources/img/guide/project_create_main.png">
					<p>프로젝트 생성 화면입니다</p>
					<p>프로젝트 명과 프로젝트 키를 정할 수 있으며, 종료일(예정)일을 지정 할 수 있습니다</p>
					<p>프로젝트 내용에 대한 간단한 설명을 정할 수 있으며 프로젝트의 공개 여부를 결정할 수 있습니다</p>
					<br>
					<p>프로젝트 생성 후에는 초대코드를 받을 수 있으며, 이 코드로 다른 사람을 초대할 수 있습니다</p>
				</div>
				<hr>
				<hr>
				<h3 class="h_sub">Project Management</h3>
				<div class="img_area">
					<img src="/resources/img/guide/project_management70.png">
					<p>프로젝트 관리 화면입니다</p>
					<p>자신이 생성한 프로젝트를 수정 및 관리 할 수 있습니다</p>
					<p>자신이 생성자 일때 프로젝트 메인 화면에서 톱니바퀴 버튼을 통해 진입 할 수 있습니다.</p>
					<p>프로젝트 카테고리에서 현재 프로젝트의 유형을 변경 할 수 있습니다.</p>
					<p>프로젝트의 진행 상황과 공개 여부를 다시 설정할 수 있으며,project member 탭에서 리더를 위임하거나,해당 유저를 ban 시킬 수 있습니다.</p>
				</div>
				<hr>
				<hr>
				<h3 class="h_sub">Project Custom</h3>
				<div class="img_area">
					<img src="">
					<p>프로젝트 커스텀 화면입니다</p>
					<p>프로젝트 메인 화면에서 현재 자신이 참여중이거나 생성한 프로젝트 중에서 가능하며,</p> 
					<p>'프로젝트 바로가기'를 통해 입장이 가능합니다.</p>
					<br>
					<img src="">
					 
				</div>
				</div>
		</div>	
		</div><!-- end of panel -->
	</div><!-- end of row -->
	
<script>

$("a").click(function(){
	var text = $(this).text();
	$(this).parent().parent().children("li").removeClass();
	$(this).parent("li").addClass("active");
	console.log(text);
	$(".guideList").children("div").hide();
	$("#"+text).show();
});
</script>

