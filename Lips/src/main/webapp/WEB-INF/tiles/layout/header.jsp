<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="navbar header"  >
	<div class="headerLogo" style="display:flex;">
		<img src="/resources/img/logo.png" alt="logo" width="100" height="50" onclick="goMain()">
		<div class="marquee">
  			<div>
    			<span id="oneLine1"></span>
    			<span id="oneLine2"></span>
  			</div>
		</div>
		<script>function goMain(){window.location.href= '/main';}</script>
	</div><!-- end of headerLogo -->
	<div class="inline">
		<ul class="nav">
			<li><a href="/project/main">프로젝트</a></li>
			<li><a href="/issue/main">이슈</a></li>
			<li><a href="/user/mypage">마이페이지</a></li>
			<li><a href="#">가이드</a></li>
		</ul>
	</div>
	<div class="inline right menu-right">
		<div class="combo">
			<input type="text" class="input" />
			<a class="btn">Search</a>
		</div>
		<sec:authorize access="hasAuthority('USER')">
			<a class="btn" href="<c:url value='/user/logout' />">logout</a>
		</sec:authorize>
		<sec:authorize access="!hasAuthority('USER')">
				<a class="btn" href="<c:url value='/user/login' />">login</a>
		</sec:authorize>
		<sec:authorize access="hasAuthority('ADMIN')">
				<a class="btn" href="<c:url value='/admin/main' />">admin</a>
		</sec:authorize>
	</div>
	
</div>
<sec:authorize access="hasAuthority('USER')">
<script>
$(document).ready( function() {
	$.ajax({
		url : "/alarm/notice/oneLine",
		type : "POST",
		success : function(responseData) {
			$('#oneLine1').html(responseData.data);
			$('#oneLine2').html(responseData.data);
		}
	});
	
});
var alarmManager = new function(){
	var idle = true; // 중복실행 방지 플래그
	var interval = 500000; // 알람 체크 주기 (10초로 변경 예정)

	this.proc = function(){
		if(!idle) return;
		idle = false;
		$.ajax({
			url : "/alarm/proc",
			type : "POST",
			data : {
				"userId"		: '<sec:authentication property="principal.userId" />',
			},
			success : function(responseData) {
				var res = responseData.data;
				
				for(var i =0; i<res.length;i++){
					alarmManager.showNotify(res[i]);
				}
				idle=true;
			}
		});
		
	}
	this.showTimeLine = function(){//show timeLine
		
	}
	this.showOneLineNotice = function(){//show oneLine
		
	}
	this.showNotify = function(data){//show windowNotify
		var notifyTitle="Lips 알림 서비스";
		var option = null;
		if(data.content=="new"){
			 options = {body	: "새롭게 할당된 이슈가 있습니다." }
		}else if(data.content=="update"){
			options = {body	: "진행중인 이슈에 대한 새로운 변경사항이 있습니다."}
		}else if(data.content=="comment"){
			options = {body	: "진행중인 이슈에 새로운 댓글이 달렸습니다."}
		}else{
			options = {body	: ""}
		}
		function callback(){
			location.href='/issue/detail?issueId='+data.issueId;
		}
		 notify(notifyTitle,options,callback);
	}
	setInterval(this.proc,interval);
}
</script>
</sec:authorize>