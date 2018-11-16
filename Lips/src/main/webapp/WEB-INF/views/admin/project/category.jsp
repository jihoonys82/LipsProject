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
		<label class="view-form-label">카테고리 추가</label>
		
		<div class="col col-12" style="margin-top: 1em;">
				<div class="view-form-row">
					<label for="caName" class="view-form-label-ca">이름</label>
					<input type="text" name="caName" id="caName" class="input view-form-input"/> 
				</div>
				<div class="view-form-row">
					<label for="caCode" class="view-form-label-ca">코드</label>
					<input type="text" name="caCode" id="caCode" class="input view-form-input" /> 
				</div>  
				<div class="view-form-row">
					<label for="caDes" class="view-form-label-ca">약어</label>
					<input type="text" name="caDes" id="caDes" class="input view-form-input" /> 
				</div> 
		</div>
		<div>
			<a class="btn mini focus" onclick="createNewCate()" style="margin-top : 1em; float: right;">등록</a>
		</div>
		
	</div>
	
	<div class="body">
		<label class="view-form-label">카테고리 리스트</label>
		
		<div class="div-scroll" style="margin-top : 1em; height: 23.3em;">
			<table class="table classic stripe" style="margin-top : 3em;">
				<thead>
					<tr>
						<th>No.</th>
						<th>이름</th>
						<th>코드</th>
						<th>des.</th>
						<th>state</th>
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
								<c:if test="${cateList.categoryAssetId < 999 }">
								<td name="cateDel" style="color: rebeccapurple;">
									Default
								</td >
								</c:if>
								<c:if test="${cateList.categoryAssetId > 999 }">
								<td name="cateDel">
									Added
								</td>
								</c:if>
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
				, data: {"param" : "newCategory"
					, "assetName" : $("#caName").val()
					, "assetCode" : $("#caCode").val()
					, "assetDescription" : $("#caDes").val()}
				, success: function(responseData) {
					
					alert("카테고리가 추가되었습니다");
					window.location.reload();
				}
			});
	}

</script>
