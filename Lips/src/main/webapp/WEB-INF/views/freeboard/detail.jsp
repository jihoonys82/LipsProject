<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authentication property="principal.userId" var="userId"/>

<style>
.wrap {
	margin: 10px;
}
/* issue form */
.issue-form-row {
	width: 		100%;
	margin:		1em;
}
.issue-form-row .issue-form-label {
	display: inline-block;
	width: 		15%;
	margin-right: 5px;
}
.issue-form-row .issue-form-input {
	width: 		60%;
}
.issue-form-row button {
	width: 100px;
}
.alignCenter {
	display: block;
	text-align: center;
}
</style>
	<div style="margin: 5px;">
		<div class="panel">
			<div class="body">
				<div class="issue-form-row">
					<label for="title" class="issue-form-label">제목</label>
					<div class="input issue-form-input">
						${boardRetrieve.fboardTitle }
					</div>
				</div>
				<div class="issue-form-row">
					<label for="author" class="issue-form-label">작성자</label>
					<div class="input issue-form-input">
						${boardRetrieve.fboardWriter }
					</div>
				</div>
				<div class="issue-form-row">
					<label for="content" class="issue-form-label">내용</label>
					<div class="input issue-form-input" style="min-height:5em; height:auto;">
						${boardRetrieve.fboardContent }
					</div>
				</div>
				
				<!--하단 설정 바  -->
				<div class="alignCenter">
					<!--db 데이터와 로그인 정보를 대조하여 버튼 show  -->
					<c:if test="${userId eq boardRetrieve.fboardWriter }">
						<form action="/freeboard/boardUpdate" method="get">
							<input hidden="true" name="fboardId" value="${boardRetrieve.fboardId}">
							<button class="btn" style="float: left;">수정</button>
						</form>
						<button class="btn" onclick="modal_1.show()">삭제</button>
					
					</c:if>					
				</div>
				<!-- 하단 설정 바 끝 -->
			</div>
		</div>
	</div>	


	<div id="modal_1" class="msgbox" style="display:none;">
		<div class="head">
			게시글 삭제
		</div>
		<div class="body">
			<h2>정말 삭제하시겠습니까?</h2>
			<div style="text-align:center;margin=top:45px;">
				<form id="deleteform" action="/freeboard/boardDelete" method="Post" style="float: left;">
					<input hidden="true" name="fboardId" value="${boardRetrieve.fboardId}">
					<button class="btn small" >Delete</button>
				</form>
				
				<button class="btn small" onclick="modal_1.hide()" style="float: left;">Close</button>
			</div>	
		</div>
	</div>	
	
	<div class="comentdiv">
					<div>
						<form id="comentform" action="/freeboard/coment" method="post">
							<textarea class="input issue-form-input" style="none; width:85%; height: 100px; float: left;"  name="fcoment" placeholder="댓글을 입력하세요"></textarea>
							<input hidden="true" name = "fboardId" value="${boardRetrieve.fboardId}">
						</form>
					</div>
					<div>
						<button class="btn" style="width: 13%; height: 100px; margin-left: 10px;" onclick="comentsave()"><h1>댓글 저장</h1></button>
					</div>
		
		<table style="margin-top: 10px; width: 99%;" class="table classic" id="comenttable">
		<thead >
			<tr style="">
				<th style="width:10%; text-align: center;">작성자</th>
				<th style="width:70%; text-align: center;">댓글</th>
				<th style="width:19%; text-align: center;">작성 시간</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${comentList}" var="coment">
					<tr>
						<td style="text-align: center;">${coment.fcomentWriter}</td>
						<td>${coment.fcoment}</td>
						<td style="text-align: center;">${coment.fcomentday}</td>
					</tr>
					
			</c:forEach>
		</tbody>
	</table>
	</div>
								
<script>
$(document).ready(function(){ 
jui.ready([ "ui.modal" ], function(modal) {
	$("#modal_1").appendTo("body");
						
	modal_1 = modal("#modal_1", {
	color: "black"
	});
});

});
var comentsave = function(){
	$("#comentform").submit();
}

</script>