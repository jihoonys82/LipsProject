<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
/* Project */
.ProjectBoxing {

	background-color: #6e6f737d;
	margin: 0.65em;
	margin-left: 0.05em;
	height: auto;
}

.boxbox {
 
	margin: 2.5em;
	height: 15em;
}

.crb {
	font-size: 50px;
	top: 0.5em; 
	position: relative;     
	margin-bottom: 10px;"
}

.CreateProjectBox {
	margin : 0.9em;
    color: #fff;
/*     border: 1px solid #9663f4; */
    background-color: #9c75ec;
    background-image: -moz-linear-gradient(top,#9c75ec 0,#885ED5 100%);
    background-image: linear-gradient(top,#9c75ec 0,#885ED5 100%);
    background-image: -webkit-linear-gradient(top,#4b3d69 0,#885ED5 100%);
    background-image: -o-linear-gradient(top,#9c75ec 0,#885ED5 100%);
    background-image: -ms-linear-gradient(top,#9c75ec 0,#885ED5 100%);
	padding: 0 15px;
    height: 50%;
    text-align: center;
 
    top:50%
    -webkit-border-radius: 6px;
    -moz-border-radius: 6px;
    border-radius: 6px;
    font-weight: bold;
}


.CreateProjectBox2 {
	margin : 0.9em;
    color: #fff;
/*     border: 1px solid #9663f4; */
    background-color: #ddd2f4;
    background-image: -moz-linear-gradient(top,#9c75ec 0,#885ED5 100%);
    background-image: linear-gradient(top,#9c75ec 0,#885ED5 100%);
    background-image: -webkit-linear-gradient(top,#e2233e 0,#d66b92ba 100%);
    background-image: -o-linear-gradient(top,#9c75ec 0,#885ED5 100%);
    background-image: -ms-linear-gradient(top,#9c75ec 0,#885ED5 100%);
	padding: 0 15px;
    height: 50%;
    text-align: center;
 
    top:50%
    -webkit-border-radius: 6px;
    -moz-border-radius: 6px;
    border-radius: 6px;
    font-weight: bold;
}
}

.ProjectNav {
	background-image: -webkit-linear-gradient(top, #272727 0, #111 100%);
	border: 1px solid #404040;
	border-radius: 5px;
	margin: 0.65em;
	margin-left: 0.05em;
	height: auto;
}

.ProjectCreateWindow {
	background-color: green;
	border: 1px solid gray;
}

#ProjectNavName {
	margin: 0.5em auto;
	margin-left: 1em;
}

#ProjectCreateForm .tr {
	color: red !important;
}

.PBh {
	height: 11.5em;

    white-space: nowrap; 
    overflow: hidden;
    text-overflow: ellipsis;

}

.ab {
	margin-top: 5px;
    float: right;
}

.pTitle {
text-align:center;
color : white;
font-size:2em;
}


	

/* Project */
</style>
<div>

	<div class="ProjectBoxing row">

		<!--   프로젝트 성공/실패에 따른 모달처리하기! -->

		<!--  프로젝트 생성/참가 - 고정 -->
		<div class="col col-4">
			<div class="boxbox">
				<div class="CreateProjectBox" name="CreateProject"
					id="CreateProject">
					<i class="icon-more crb"></i>
					<p>Create</p>
				</div>
				<div class="CreateProjectBox" name="JoinProject" id="JoinProject">
					<i class="icon-export crb"></i>
					<p>Join</p>
				</div>
			</div>
		</div>




		<!--프로젝트 리스트 :  반복문 돌릴거임  -->
		<c:forEach items="${userProjectInfo}" var="projectinfo">
			<div class="col col-4">

								
				<div class="boxbox">

					<div class="panel">
						<div class="head">
							<i class="icon-left"></i> <strong>${projectinfo.projectKey}</strong>
							
							<c:set var="open" value="OPEN"/>
							<c:set var="pending" value="PENDING"/>
							<c:set var="close" value="CLOSE"/>
							<c:set var="id" value="${user.userId }" />
							<c:choose>
								<c:when test="${projectinfo.projectLeader eq id}"> 
								<a href="/project/update?projectId=${projectinfo.projectId}"><i class="icon-gear ab" style="    margin: 1em;
    margin-right: 0.5em;"></i></a>
								</c:when>
							</c:choose>
							
							<c:choose>
							
								<c:when test="${projectinfo.status eq open}">
									<span class="label mini success ab">${projectinfo.status }</span>
								</c:when>
								<c:when test="${projectinfo.status eq pending}">
									<span class="label mini info ab">${projectinfo.status}</span>
								</c:when>
								<c:when test="${projectinfo.status eq close}">
									<span class="label mini danger ab">${projectinfo.status}</span>
								</c:when>
							</c:choose>  
							
						
							<!-- 프로젝트 관리버튼 추가 -->




						</div>
						<table class="table classic stripeless" style="font-size:1em;">
			<thead>
				<tr>
					<th class="twidth">프로젝트 제목</th>
					<th>${projectinfo.projectName }</th>
				</tr>
			</thead>
		 	<tbody>
		 		<tr>
					<td>프로젝트 생성자</td>
					<td>${projectinfo.projectCreater }</td>		
		 		</tr>
		 		<tr>
					<td>프로젝트 리더</td>
					<td>${projectinfo.projectLeader }</td>		
		 		</tr>
		 		<tr>
					<td>프로젝트 공개 여부</td>
					<td> <c:choose>
							
								<c:when test="${projectinfo.projectOpen eq 1}">
									<span>공개</span>
								</c:when>
								<c:when test="${projectinfo.projectOpen eq 0}">
									<span>비공개</span>
								</c:when>
								</c:choose>
					</td>		
		 		</tr>
		 		<tr>
		 			<td>프로젝트 생성일</td>
		 			<td><span class="countDate"><fmt:formatDate value="${projectinfo.createDate}" pattern="yyyy/MM/dd"/></span></td>
		 		</tr>
		 		<tr>
		 			<td>프로젝트 예상 종료일</td>
		 			<td><span class="countDate"><fmt:formatDate value="${projectinfo.closeDate}" pattern="yyyy/MM/dd"/></span></td>
		 		</tr>
		 		<tr>
					<td>프로젝트 설명</td>
					<td class="PBh">${projectinfo.projectDesc }</td>		
		 		</tr>
		 	</tbody>
		</table>
			
						
						<div class="foot" style="text-align:center;"><a href="/dashboard/dashview?projectId=${projectinfo.projectId}">프로젝트 바로가기</a></div>
					</div>



					<%-- 						<div class="col-col style="background-color:green">${projectinfo.projectName}</div> --%>
					<%-- 						<div style="background-color:yellow">${projectinfo.status}</div> --%>
					<!-- 						<div style="background-color:red">View</div> -->
					<!-- 						<div style="background-color:gray">Project Info</div> -->



				</div>
				<!-- 				</a> -->
			</div>
		</c:forEach>







	</div>


</div>
