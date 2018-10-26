<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <div class="navbar flat" style="overflow: hidden;">
	<div class="inline right">
		<span>admin 님 어서오세요</span>
		<a class="btn">logout</a>	
	</div>
</div>
    
<nav class="col col-2">
	<div class="panel">
		<div class="body">
			<a href="/admin/main"><span class="nav-label">대시보드</span></a>		
		</div>
		<div class="body">	      
			<a href="/admin/notice"><span class="nav-label">공지사항</span></a>
		</div>
		<div class="body">
	    	<a href="/admin/project/chart"><span class="nav-label">프로젝트</span></a>
		</div>
		<div class="body">
		     <a href="/admin/user/chart"><span class="nav-label">사용자</span></a>
		</div>
		<div class="body">
		    <a href="#"><span class="nav-label">서비스</span></a>
		</div>
		<div class="body" style="min-height:30em;"></div>
	</div>
</nav>