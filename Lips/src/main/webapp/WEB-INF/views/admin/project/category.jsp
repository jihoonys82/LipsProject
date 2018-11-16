<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        

<style>

::-webkit-scrollbar{width:10px;}

</style>

<div class="panel">
	<div class="body">
		<div class="infomationWith col col-12">카테고리 설정</div>
	</div>
	
	<div class="body">
		<!-- 이름, 코드, 설명 input CategoryAssetDto-->
		<label class="view-form-label">카테고리 추가</label>
		
		<div class="col col-12" style="margin-top: 1em;">
				<div class="view-form-row">
					<label for="caName" class="view-form-label">이름</label>
					<input type="text" name="caName" id="caName" class="input view-form-input"/> 
				</div>
				<div class="view-form-row">
					<label for="caCode" class="view-form-label">코드</label>
					<input type="text" name="caCode" id="caCode" class="input view-form-input" /> 
				</div>  
				<div class="view-form-row">
					<label for="caDes" class="view-form-label">약어</label>
					<input type="text" name="caDes" id="caDes" class="input view-form-input" /> 
				</div> 
		</div>
		<div class="noticeBtn">
			<a class="btn mini focus" onclick="createNewCate()" style="margin-top : 1em;">등록</a>
		</div>
		
	</div>
	
	<div class="body">
		<!-- 리스트 -->
		<label class="view-form-label">카테고리 리스트</label>
		
		<div class="div-scroll" style="margin-top : 1em;">
			<table class="table classic stripe">
				<thead>
					<tr>
						<th>No.</th>
						<th>이름</th>
						<th>코드</th>
						<th>des.</th>
					</tr>
				</thead>
				<tbody id="noticeTable">
					<c:forEach items="${cateList }" var="cateList">
						<tr class="text-center">
							<td name="cateId">
								${cateList.categoryAssetId}
							</td>
							<td name="cateName">
								${cateList.assetName}
							</td>
							<td name="cateCode">
								${cateList.assetCode}
							</td>
							<td name="cateDes">
								${cateList.assetDescription}
							</td>
						</tr>						
					</c:forEach>
				</tbody>
			</table>
			</div>	
		
	</div>
	
</div>

<script type="text/javascript">

	function createNewCate() {
		$.ajax({
			type: "post"
				, url: "/admin/project/category"
				, dataType: "json"
				, data: {"categoryAssetId" : categoryAssetId }
				, success: function(responseData) {
					window.location.reload();
				}
			});
	}

</script>
