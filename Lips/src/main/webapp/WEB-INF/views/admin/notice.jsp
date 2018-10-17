<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>Insert title here</title> -->

<%-- <%@ include file="/WEB-INF/views/admin/navbar.jsp" %> --%>

<!-- </head> -->
<!-- <body class="jui"> -->

<%-- <%@ include file="/WEB-INF/views/admin/navbar.jsp" %> --%>

<!-- <div class="col col-10"> -->
	<div class="panel">
		<div class="body">
			<div class="infomationWith col col-12">공지사항</div>
		</div>
		
		<div class="body forSize-first">
			<div class="view-form-row">
				<label class="view-form-label">현재 등록 중인 한줄 공지 <span class="icon icon-more"/></label>
				<div style="padding: 1em;">
					<input type="text" name="notice" id="notice" class="input view-form-input" readonly="readonly">
					<a class="btn mini focus">삭제</a>
				</div>
				<div style="padding: 1em;">
					<input type="text" name="notice" id="notice" class="input view-form-input">
					<a class="btn mini focus">등록</a>
				</div>
			</div>
		</div>
		
		<div class="body forSize-second">
			<div class="view-form-row">
				<label class="view-form-label">타임라인 공지사항</label>
			</div>
			
			<table class="table classic stripe">
				<thead>
					<tr>
						<th>No.</th><th>제목</th><th>타임라인</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>A</td><td>B</td>
						<td>
							<input type="checkbox">
						</td>
					</tr>
					<tr>
						<td>A</td><td>B</td>
						<td>
							<input type="checkbox">
						</td>
					</tr>
					<tr>
						<td>A</td><td>B</td>
						<td>
							<input type="checkbox">
						</td>
					</tr>
					<tr>
						<td>A</td><td>B</td>
						<td>
							<input type="checkbox">
						</td>
					</tr>
					<tr>
						<td>A</td><td>B</td>
						<td>
							<input type="checkbox">
						</td>
					</tr>
				</tbody>
			</table>
			
			<div class="noticeBtn">
				<a class="btn normal focus">공지 등록</a>
			</div>
				
		</div>
		
	</div>
<!-- </div> -->


<!-- </body> -->
<!-- </html> -->