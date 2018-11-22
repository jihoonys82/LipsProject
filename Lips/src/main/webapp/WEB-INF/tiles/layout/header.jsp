<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="navbar header"  >
	<div class="headerLogo" style="display:flex;">
		<img src="/resources/img/logo.png" alt="logo" width="100" height="50" onclick="goMain()">
		<div class="marquee" style="height:40px;">
  			<div>
    			<span class="glow" id="oneLine1" style="font-size: large;"></span>
    			<span class="glow" id="oneLine2" style="font-size: large;"></span>
  			</div>
		</div>
		<script>function goMain(){window.location.href= '/main';}</script>
	</div><!-- end of headerLogo -->
	<div class="inline">
		<ul class="nav">
			<li><a href="/project/main">프로젝트</a></li>
			<li><a href="/issue/main">이슈</a></li>
			<li><a href="/user/mypage">마이페이지</a></li>
			<li><a href="/guide/main">가이드</a></li>
		</ul>
	</div>
	<div class="inline right menu-right">
<!-- 		<div class="combo"> -->
<!-- 			<input type="text" class="input" /> -->
<!-- 			<a class="btn">Search</a> -->
<!-- 		</div> -->
		<sec:authorize access="hasAuthority('USER')">
			<a class="btn focus" href="/issue/create">새이슈</a>
			<a class="btn" href="<c:url value='/logout' />">logout</a>
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
			if(responseData.data.noticeCategory != 4){
				$('#oneLine1').html(responseData.data.noticeContent);
				$('#oneLine2').html(responseData.data.noticeContent);
			}
		}
	});
	
});
var alarmManager = new function(){
	var idle = true; // 중복실행 방지 플래그
	var interval = 10000; // 알람 체크 주기 (10초로 변경 예정)

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
	this.showNotify = function(data){//show windowNotify
		var notifyTitle=data.title;
		var options = { body	: data.content }
		if(data.type=="notice"){
			notify(notifyTitle,options,null);
		}else{
			notify(notifyTitle,options,function(){
				location.href='/issue/detail?issueId='+data.issueId;	
			});
		}		
	}
	setInterval(this.proc,interval);
}
</script>
</sec:authorize>