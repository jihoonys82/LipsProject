<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
 
 <div class="ProjectBoxing row">
  
<!--   프로젝트 성공/실패에 따른 모달처리하기! -->
 
<!--  프로젝트 생성/참가 - 고정 -->
  <div class="col col-4">
  	<div class="ProjectBox">
		<div class="CreateProjectBox" name="CreateProject" id="CreateProject">프로젝트 생성</div>
		<div class="CreateProjectBox" name="JoinProject" id="JoinProject">프로젝트 참가</div>
   	</div>
  </div>
  
  
   
  <!--프로젝트 리스트 :  반복문 돌릴거임  -->
	<c:forEach items="${userProjectInfo}" var="projectinfo">
		<div class="col col-4">
			
			<a href="/dashview/dashview">
			<div class="ProjectBox">
				왜 안나오지
				${projectinfo.projectId}
			</div>
			</a>
		</div>
	</c:forEach>
	
					


  

  
 </div>
  
  
  </div>  