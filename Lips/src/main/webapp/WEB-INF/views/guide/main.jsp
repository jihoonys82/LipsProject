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
			<div class="body">
				<div class="topguidebar">
				<br>
					<ul id="tab_1" class="tab top">
					    <li class="active" style="cursor:pointer"><a>GuideMain</a></li>
					    <li style="cursor:pointer"><a>MainView</a></li>
					    <li style="cursor:pointer"><a>Issue</a></li>
					    <li style="cursor:pointer"><a>Project</a></li>
					    <li style="cursor:pointer"><a>Alram</a></li>
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
						<h3 class="h_sub">Freeboard & Notice</h3>
						<p>Lips에선 프로젝트 관리 뿐만 아니라 최신 순으로 정렬된 공지사항과 자유게시판을 제공합니다.</p>
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
							<img src="/resources/img/guide/final_issue_create.png">
						</div>
						<p>새 이슈 생성 화면입니다</p>
						<p>현재 생성한 프로젝트나 참여중인 프로젝트 중에서 이슈를 만들 수 있습니다</p>
						<p>종료 및 예정일을 지정할 수 있으며 D-1,D+1 은 하루 씩 올리고 내릴 수 있으며 w-1,W+1은 일주일 단위로 조정할 수 있습니다.</p>
						<br>
						<h3 class="h_sub">Category</h3>
						<div class="img_area">
							<img src="/resources/img/guide/category.png">
						</div>
						<p>카테고리 지정 화면입니다</p>
						<p>현재 생성할 이슈의 카테고리를 지정해 줄 수 있습니다</p>
						<p>처음 생성시엔 기본 카테고리는 issue탭으로 설정되어 있습니다,이후 프로젝트 관리탭에서 원하는 이슈의 카테고리를 지정해 줄 수 있습니다.</p>
						<br>
						<h3 class="h_sub">Assignee</h3>
						<div class="img_area">
							<img src="/resources/img/guide/Assignee.png">
						</div>
						<p>담당자 지정 화면입니다</p>
						<p>두 글자 이상 입력하면 자동으로 참여중인 해당 프로젝트의 참여 인원들이 뜨며,</p>
						<p>현재 생성할 이슈의 담당자를 지정해 줄 수 있으며 나에게 할당을 통해 현재 이슈를 자신에게 일임 할 수 있습니다</p>
						<br>
						<h3 class="h_sub">Issue Level</h3>
						<div class="img_area">
							<img src="/resources/img/guide/final_issue_level.png">
						</div>
						<p>이슈 단계 설정 화면입니다</p>
						<p>현재 이슈의 단계를 지정해 줄 수 있습니다</p>
						<p>두개의 프리셋을 지원합니다</p>
						<p>이후 자신이 프로젝트 리더일때 프로젝트 관리탭에서 이슈 단계를 상세히 설정 할 수 있습니다.</p>
						<br>
						<h3 class="h_sub">File upload</h3>
						<div class="img_area">
							<img src="/resources/img/guide/final_issue_fileupload.png">
						<p>이슈 생성시 파일 업로드가 가능합니다</p>
						<p>새 파일 등록에서 파일 찾기로 원하는 파일을 불러올 수 있으며 이후 업로드를 통해 내 파일 목록에 해당 파일이 들어갑니다.</p>
						<p>이후 내 파일 목록에서 원하는 파일을 선택하고 선택 버튼을 누르면 업로드할 파일 목록으로 올라가고 이후 선택 완료를 누르면 파일 업로드가 완료됩니다</p>	
						</div>
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
						<p>자신이 생성한 이슈일 시 단계 버튼을 통해 이슈 단계를 조정할 수 있습니다.</p> 
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
						<img src="/resources/img/guide/final_projectmain_myproject.png">
						<p>프로젝트 메인 화면입니다</p>
						<p>현재 참여중인 프로젝트들의 정보를 간략히 알 수 있습니다</p>
						<p>왼쪽 상단의<img src="/resources/img/guide/allproject.png">탭을 클릭하여, LIPS 안의 전체 프로젝트를 확인 할 수 있습니다.</p>
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
						<p>프로젝트 초대 코드의 유효기간은 하루입니다. 유효기간이 지난 후에는 프로젝트 관리 탭에서 초대코드를 재 발급 받을수 있습니다.</p>
					</div>
					<hr>
					<hr>
					<h3 class="h_sub">Project Management</h3>
					<div class="img_area">
						<img src="/resources/img/guide/project_management70.png">
						<p>프로젝트 관리 화면입니다</p>
						<p>자신이 생성한 프로젝트를 수정 및 관리 할 수 있습니다</p>
						<p>자신이 생성자 일때 프로젝트 메인 화면에서 톱니바퀴 버튼을 통해 진입 할 수 있습니다.</p>
						<p>프로젝트 카테고리에서 현재 프로젝트의 원하는 카테고리 유형을 지정 할 수 있습니다.</p>
						<img src="/resources/img/guide/project_issue_sujung.png">
						<p>프로젝트 카테고리 변경 화면입니다.</p>
						<p>프로젝트 카테고리에서 톱니바퀴 버튼을 누르면 카테고리 유형 모음집이 뜨며, 이를 통해 원하는 카테고리 유형을 지정할 수 있습니다.</p>
						<br>
						<p>프로젝트의 진행 상황 일시정지를 선택하면 신규 이슈등록이 제한되며, 다시 진행중으로 바꾸어 프로젝트를 진행 할 수 있습니다.</p>
						<p>프로젝트 공개 여부에서 공개 여부를 다시 설정할 수 있으며, 프로젝트 비공개시에는 프로젝트 메인 화면에서 아예 보이지 않게 됩니다.</p>
						<p>project member 탭에서 리더를 위임하거나,해당 유저를 ban 시킬 수 있습니다.</p>
						<p>프로젝트의 초대 코드의 유효기간은 하루이며, 코드의 유효기간이 지나고 다른 사람을 초대할 필요성이 있을 시에는 초대코드 재발급을 통해 새로운 초대코드를 발급받아 다른 사람을 프로젝트에 초대 할 수 있습니다.</p>
						<p>프로젝트 종료처리를 하면 다시 활성화 시킬 수 없고 이슈등록이 제한되니 신중하게 사용해 주세요</p>
					<h3 class="h_sub">Issue Custom</h3>
						<img src="/resources/img/guide/issue_preset70.png">
						<p>이슈 진행단계 커스텀입니다.</p>
						<p>이슈 생성 단계에서 기본적으로 지원하는 두개의 프리셋 외에도 이곳에서 원하는 내용의 이슈 진행단계 프리셋을 설정할 수 있습니다</p>
						<p>새 프리셋 추가에서 프리셋 이름을 정하고, 신규 에셋 추가에서 원하는 에셋의 이름과 내용을 설정할 수 있습니다</p>
						<img src="/resources/img/guide/issue_preset_ex.png">
						<p>신규 에셋을 추가하여 새 프리셋을 추가한 예제입니다.</p>
						<p>이후 저장을 누르면 현 프로젝트에서 새 이슈를 만들 때 마다 새로 지정한 프리셋을 활용할 수 있습니다</p>
						<img src="/resources/img/guide/issue_preset_add.png">
						<p>저장 후 새 프리셋이 추가된 모습입니다.</p>
						<img src="/resources/img/guide/issue_preset_complete.png">
						<p>새 이슈를 생성할 시 추가한 프리셋이 뜨는 화면입니다.</p>
					</div>
					<hr>
					<hr>
					<h3 class="h_sub">Project Custom</h3>
					<div class="img_area">
						<img src="/resources/img/guide/project_custom.png">
						<p>프로젝트 커스텀 화면입니다</p>
						<p>프로젝트 메인 화면에서 현재 자신이 참여중이거나 생성한 프로젝트 중에서 가능하며,</p> 
						<p>'프로젝트 바로가기'를 통해 입장이 가능합니다.</p>
						<br>
						<img src="/resources/img/guide/project_custom_guide.png">
						<p>이후 오른쪽 상단의 Custom 버튼을 누르면 뜨는 사용법 페이지입니다.</p>
						<br>
						<img src="/resources/img/guide/project_custom_lineselect.png">
						<p>라인갯수를 x=2, y=1로 했을 때의 모습입니다.
						<br>
						<img src="/resources/img/guide/project_custom_select.png">
						<p>커스텀 화면의 오른쪽에서 원하는 카드를 등록한 후 저장을 누르면 대시보드의 이름을 정할 수 있습니다.</p>
						
						
						 
					</div>
					</div>
					<div id="Alram" hidden="true">
						<h1>Alram</h1>
						Lips의 알람 기능입니다.
						<p>프로젝트와 이슈에 관련된 사항이 생길 때면 크롬 브라우저에서 알람을 보내는 기능을 제공합니다.</p>
						<br>
						<hr>
						<hr>
						<br>
						<img src="/resources/img/guide/alram_70.png">
						<p>해당 이미지는 로그인 하였을 때 뜨는 알람이며,우측 하단에 다음과 같은 알람이 나타납니다.</p>
						<br>
						<h3>알람이 뜨는 상황</h3>
						<p>1.로그인 하였을 때
						<p>2.이슈가 등록되었을때
						<p>3.나에게 할당 된 이슈가 있을때
						<p>4.할당된 이슈에 댓글이 달렸을 때
						<p>5.할당된 이슈에 변경점이 생겼을 때
						<p>6.내가 팔로잉한 이슈에 댓글이 달렸을 때
						<p>7.내가 팔로우한 이슈가 변경 되었을 때
						<p>8.프로젝트 리더일 시 프로젝트의 변경점이 생겼을 때
						<p>9.프로젝트 관리자가 프로젝트를 변경하였을 때 유저에게 알람으로 변경점을 전달합니다.</p>
						<br>
						<hr>
						<hr>
						<h3 class="h_sub">알람 기능이 작동하지 않는다면 다음과 같은 절차를 따라주세요</h3>
						<div class="img_area">
							<img src="">
							<p>해당 기능은 구글 크롬에서 작동합니다</p>
							<p>1.구글 설정탭으로 이동합니다</p>
							<p>2.맨 밑 고급 탭으로 이동합니다</p>
							<p>3.개인정보 및 보안 탭의 콘텐츠 설정으로 이동합니다.</p>
								<img src="/resources/img/guide/google_content.png">
							<p>4.콘텐츠 설정의 알림 탭으로 이동합니다.</p>
								<img src="/resources/img/guide/google_alram.png">
							<p>5.알림 탭에서 차단목록에 올라와 있는 Lips 홈페이지 주소를 허용해 줍니다.</p>
								<img src="/resources/img/guide/google_chadan.png">		
						</div>

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

