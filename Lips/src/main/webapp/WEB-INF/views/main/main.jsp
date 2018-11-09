<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authentication property="principal.nick" var="usernick" />
<style>

td {
line-height : 1.695em;

}

.mainContents {
/* border : 1px solid white; */
margin: 10px auto;

padding : 1em;
}

.innerContents {
/* border:1px solid white;  */
margin :0.5em;
border-radius: 5px;
text-align: center;
}



/*   버튼 css*/


.conta {
    perspective: 800px;
     --accent: #b694fe;
    --border-width: 3px;
    --border-radius: 55px;
    --font-size: 15px;
    
    
 
}

.toggle {
    position: relative;
    border: solid var(--border-width) var(--accent);
    border-radius: var(--border-radius);
    transition: transform cubic-bezier(0, 0, 0.30, 2) .4s;
    transform-style: preserve-3d;
    perspective: 800px;
}

.toggle>input[type="radio"] {
    display: none;
}

.toggle>#choice1:checked~#flap {
    transform: rotateY(-180deg);
}

.toggle>#choice1:checked~#flap>.content {
    transform: rotateY(-180deg);
}

.toggle>#choice2:checked~#flap {
    transform: rotateY(0deg);
}

.toggle>label {
    display: inline-block;
/*     min-width: 170px; */
    padding: 3px;
    font-size: var(--font-size);
    text-align: center;
    color: var(--accent);
    cursor: pointer;
}

.toggle>label,
.toggle>#flap {
    font-weight: bold;
    text-transform: capitalize;
}

.toggle>#flap {
    position: absolute;
    top: calc( 0px - var(--border-width));
    left: 50%;
    height: calc(100% + var(--border-width) * 2);
    width: 51%;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: var(--font-size);
    background-color: var(--accent);
    border-top-right-radius: var(--border-radius);
    border-bottom-right-radius: var(--border-radius);
    transform-style: preserve-3d;
    transform-origin: left;
    transition: transform cubic-bezier(0.4, 0, 0.2, 1) .5s;
}

.toggle>#flap>.content {
    color: #333;
    transition: transform 0s linear .25s;
    transform-style: preserve-3d;
}

/* 버튼 cssend */
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
			<div class="panel">
			<div class="head">
				<i class="icon-hierarchy"></i><strong> Lips info</strong>
<!-- 	버튼   -->	
	<div class="conta" style="
	height: 10px;
	width: 30%;
   float: right;
   position: relative;
   line-height: 15px;
   top:1.5px; ">
        <form class="toggle" >
            <input type="radio" id="choice1" name="choice" value="creative">
            <label for="choice1" style="padding-left: 1.5em;">Issue</label>
            <input type="radio" id="choice2" name="choice" value="productive">
            <label for="choice2" style="padding-left: 1.5em;">Project</label>
            <div id="flap"><span class="content">productive</span></div>
        </form>
    </div>
<!-- 버튼 끝   -->

			</div>
			<div class="body"  style="height :12.5em; overflow: hidden;">
			<div id="project">
				<div class="row">
					<div class="col col-4">
						<div class="innerContents" style="padding:1em; background-image: -webkit-linear-gradient(top,#df1959 0,#bc467d 100%);">
								<Strong>지금 Lips에서 </Strong>
								<h1>${mainInfo.AllProjectCnt}개</h1>
								<h5>프로젝트가 진행되고 있습니다.</h5>
						</div>
					
					</div>
					
					<div class="col col-4">
						<div class="innerContents" style="padding:1em;     background-image: -webkit-linear-gradient(top,#4cac4f 0,#205d36 100%);">
								<Strong>지금 Lips에서 </Strong>
								<h1>${mainInfo.OpenProjectCnt}개</h1>
								<h5>프로젝트가 공개되어 있습니다.</h5>
						</div>
					
					</div>
					
					
					<div class="col col-4">
						<div class="innerContents" style="padding:1em; background-image: -webkit-linear-gradient(top,#3583c6 0,#2825b8 100%);">
								<Strong>당신은 지금 Lips에서 </Strong>
								<h1>${mainInfo.MyProjectCount}개</h1>
								<h5>프로젝트에 참가하고 있습니다.</h5>
						</div>
					
					</div>
				
				</div>
			</div>
			
			<div id="issue" hidden="true">
				<div class="row">
					<div class="col col-4">
						<div class="innerContents" style="padding:1em; background-image: -webkit-linear-gradient(top,#df1959 0,#bc467d 100%);">
								<Strong>지금 Lips에는 </Strong>
								<h1>${mainInfo.AllIssueCnt}개</h1> 
								<h5>이슈가 등록되어 있습니다.</h5>
						</div>
					
					</div>
					
					<div class="col col-4">
						<div class="innerContents" style="padding:1em;     background-image: -webkit-linear-gradient(top,#4cac4f 0,#205d36 100%);">
								<Strong>당신이 소속된 프로젝트에 </Strong>
								<h1>${mainInfo.MyProjectIssueCnt}개</h1>
								<h5>이슈가 등록되어 있습니다.</h5>
						</div>
					
					</div>
					
					
					<div class="col col-4">
						<div class="innerContents" style="padding:1em; background-image: -webkit-linear-gradient(top,#3583c6 0,#2825b8 100%);">
								<Strong>당신에게는 </Strong>
								<h1>${mainInfo.AllcoateIssueCnt}개</h1>
								<h5>이슈가 할당되어 있습니다.</h5>
						</div>
					
					</div>
				
				</div>
			</div>
		</div>
		</div>
	

    </div>
	
		

	<div class="col col-6 mainContents">
			<div class="panel">
			<div class="head">
				<i class="icon-info"></i><strong> Notice</strong>
			</div>
		<table class="table classic stripeless" style="height :12.5em; overflow: hidden;">
			<thead>
				<tr >
					<th style="width:3em; text-align:center">#</th>
					<th style="width:7em; text-align:center">유형</th>
					<th style="text-align:center">내용</th>
				</tr>
			</thead>
		 	<tbody>
		 			<c:forEach items="${mainInfo.Notice}" var="noticeinfo" varStatus="a">
		 				
		 				<tr onclick="notice(this)" value="${noticeinfo.noticeId}">
							<td id="Nindex" style="text-align:center">${a.index +1 }</td>
							<td id="Ntitle" style="text-align:center">${noticeinfo.noticeTitle}</td>	
							<td id="NContent">${noticeinfo.noticeContent}</td>		
		 				</tr>
		 			</c:forEach>
		 		
		 	</tbody>
		</table>
		</div>
	

    </div>
</div>

<div class="row">
	<div class="col col-6 mainContents">
			<div class="panel">
			<div class="head">
				<i class="icon-preview"></i><strong> Follower Top5</strong>
			</div>
		<table class="table classic stripeless">
			<thead>
				<tr>
					<th style="width:3em; text-align:center">#</th>
					<th style="width:7em; text-align:center">프로젝트 명</th>
					<th style="text-align:center">프로젝트 설명</th>
					<th style="width:5em; text-align:center">팔로워</th>
				</tr>
			</thead>
			<tbody>
		 			<c:forEach items="${mainInfo.IssueTopPro}" var="Prolist" varStatus="b">
		 				<tr onclick="viewProject(${Prolist.projectId});">
							<td style="text-align:center"><a href="/dashboard/dashview?projectId=${Prolist.projectId}">${b.index +1 }</a></td>
							<td style="text-align:center"><a href="/dashboard/dashview?projectId=${Prolist.projectId}">${Prolist.projectId}</a></td>
							<td style="text-align:center"><a href="/dashboard/dashview?projectId=${Prolist.projectId}">${Prolist.projectDesc}</a></td>	
							<td style="text-align:center"><a href="/dashboard/dashview?projectId=${Prolist.projectId}">${Prolist.projectWatcher}</a></td>
		 				</tr>
		 			</c:forEach>
		 		
		 	</tbody>
		</table>
		</div>
	

    </div>
	
	
		<div class="col col-6 mainContents" style="border : 1px solid white">
		
		안희민씨를 위한 게시판 자리
		<img src="/resources/img/intro/donaplz.png"  >	
		 ${mainInfo.board}

		</div>
		
		
<div id="modal_1" class="msgbox" style="display: none;">
    <div class="head">
    	<div id="nnTitle"></div>
        
    </div>
    <div class="body">
        <div id="nnContents"></div>
   

        <div style="text-align: center; margin-top: 45px;">
            
            <a class="btn focus small" id="modalOk">확인</a>
        </div>
    </div>
</div>		
</div>



<script>

jui.ready([ "ui.modal" ], function(modal) {
    $("#modal_1").appendTo("body");

    modal_1 = modal("#modal_1", {
        color: "black"
    });
});

function notice(dom){
	 $("#nnTitle").html($(dom).find("#Ntitle").html());
	 $("#nnContents").html($(dom).find("#NContent").html());
	
	modal_1.show();
}

$("#modalOk").click(function(){
	modal_1.hide();
});




const st = {};

st.flap = document.querySelector('#flap');
st.toggle = document.querySelector('.toggle');

st.choice1 = document.querySelector('#choice1');
st.choice2 = document.querySelector('#choice2');

st.flap.addEventListener('transitionend', () => {

    if (st.choice1.checked) {
        st.toggle.style.transform = 'rotateY(-15deg)';
        setTimeout(() => st.toggle.style.transform = '', 400);
        $("#issue").show(300);
        $("#project").hide(300);
    } else {
        st.toggle.style.transform = 'rotateY(15deg)';
        setTimeout(() => st.toggle.style.transform = '', 400);
        $("#issue").hide(300);
        $("#project").show(300);
    }

})

st.clickHandler = (e) => {

    if (e.target.tagName === 'LABEL') {
        setTimeout(() => {
            st.flap.children[0].textContent = e.target.textContent;
        }, 250);
    }
}

document.addEventListener('DOMContentLoaded', () => {
    st.flap.children[0].textContent = st.choice2.nextElementSibling.textContent;
});

document.addEventListener('click', (e) => st.clickHandler(e));


</script>
