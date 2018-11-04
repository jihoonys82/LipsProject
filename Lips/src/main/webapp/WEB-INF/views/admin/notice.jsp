<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
	
.item textarea{
	color		: black;
}

.item select,.item select option {
	color : black;
}	

.moreListTable {
	
	text-align: center;
	height : 200px;
	width : 80%;
	overflow : hidden;
	margin-left : 10%; 
}
::-webkit-scrollbar{width:10px;}

</style> 

	<div class="panel">
		<div class="body">
			<div class="infomationWith col col-12">공지사항</div>
		</div>
		
		<div class="body forSize-first">
			<div class="view-form-row">
				<label class="view-form-label">현재 등록 중인 한줄 공지 
					<a href="javascript:moreList();"><i class="icon-more"></i></a>
				</label>
				<div style="padding: 1em;">
					<c:if test="${oneLine.noticeCategory eq '1'}">
						<input type="text" name="notice" id="oneLine" class="input view-form-input" readonly="readonly"
							value="${oneLine.noticeTitle}">
					</c:if>
					<c:if test="${oneLine.noticeCategory eq '4' }">
						<input type="text" name="notice" id="oneLine" class="input view-form-input" readonly="readonly"
							value="삭제된 공지입니다">						
					</c:if>	
					<a class="btn mini focus" id="btnDelete">삭제</a>
				</div>
				<div style="padding: 1em;">
					<input type="text" name="notice" id="inputOneLine" class="input view-form-input" >
					<a class="btn mini focus" onclick="oneLineNotice()">등록</a>
				</div>
			</div>
		</div>
		
		<div class="body forSize-second">
			<div class="view-form-row">
				<label class="view-form-label">타임라인 공지사항</label>
			</div>
			
			<div class="div-scroll">
			<table class="table classic stripe">
				<thead>
					<tr>
						<th>No.</th>
						<th>유형</th>
						<th>내용</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody id="noticeTable">
					<c:forEach items="${nInfo }" var="nInfo">
					<c:if test="${nInfo.noticeCategory eq 0}">
						<tr class="text-center">
							<td name="noticeId">
								${nInfo.noticeId}
							</td>
							<td name="noticeTitle">
								${nInfo.noticeTitle}
							</td>
							<td name="noticeContent">
								${nInfo.noticeContent}
							</td>
							<td name="noticeDelete">
								<a class="btn mini">delete</a>
							</td>
						</tr>
					</c:if>							
					</c:forEach>
				</tbody>
			</table>
			</div>				
		</div>
		
		<div class="body noticeBtn">
			<a id="btnNotice" class="btn normal focus" onclick="modalNotice.show();">공지 등록</a>
		</div>
			
	</div>
	
<div class="window" style="width: 500px; display: none;" id="modalNotice">
	<div class="head">
		<div class="left">프로젝트 생성자에게 공지</div>
		<div class="right">
			<a href="#" class='close' id="iCancel_notice"><i class='icon-close'></i></a>
		</div>
	</div>
	<div class="body has-property" style="height:300px;">
		<div id="bodyNotice" class="property"></div>
	</div>
	<div class="foot">
		<a id="btnTimeLineNotice" href="#" class="btn focus">확인</a>
		<a href="#" class="btn" id="btnCancel_notice">취소</a>
	</div>
</div>

<div id="modalMore" class="window">
    <div class="head">
        <div class="left">한줄 공지 더보기</div>
        <div class="right">
            <a href="#" class="close"><i class="icon-exit"></i></a>
        </div>
    </div>
    <div id="bodyModal">
        <br/>
    </div>
    <div class="foot" align="center">
        <a class="btn btnClose" href="#">닫기</a>
    </div>
</div>
	
<script type="text/javascript">

jui.ready([ "ui.property" ], function(PropertyView) {

	window.complexSettings = new PropertyView('#bodyNotice', {
		items : [
			{ type : 'group', title : '공지사항', description : '공지 유형을 선택해주세요'},
			{ type : 'select', key : 'transition' , value : 'default', items : ['서비스 안내','서비스 공지', '기타'] },

			{ type : 'group', title : '메시지', description : '프로젝트 생성자에게 보낼 메시지를 작성해주세요'},
			{ type : 'textarea', key : 'parallaxBackgroundImage' , value : '', description : '' },
		],
		event : {
			change : function (item, newValue, oldValue) {
				console.log('item : ', item);
				console.log('all items', this.getValue());
			}
		}
	});

	window.modalNotice = jui.create('ui.modal', "#modalNotice");

});	

jui.ready([ "ui.window" ], function(win) {
    modalMore = win("#modalMore", {
        width: 500,
        height: 300,
        modal: true
    });
});

jui.ready([ "grid.table" ], function(table) {
    moreTable = table("#moreTable", {
        scroll: true
        
    });
});


$(document).ready(function() {
	
	$("#btnClose").click(function() {
		modalMore.hide();
	});
	
	$("#btnCancel_notice").click(function(){
		modalNotice.hide();
	});
	
	$("#iCancel_notice").click(function(){
		modalNotice.hide();
	});
	
	$("#btnTimeLineNotice").click(function(){
		$.ajax({
			type: "post"
			, url: "/admin/notice"
			, dataType: "json"
			, data: {"param": "0",  
					"noticeTitle" : $("div").children("select").val(),
					"noticeContent" : $("div").children("textarea").val()
			},success : function(responseData){
				console.log("test");
				
// 				$('#id').html($("div").children("select").val());
// 				$('#content').html($("div").children("textarea").val());				
				
				$("div").children("select").val('');
				$("div").children("textarea").val('');

// 				updateNoticeList();
				modalNotice.hide();
				
			} 
		})
	});
	
	
	$("#btnDelete").click(function(){
		$.ajax({
			type: "post"
			, url: "/admin/notice"
			, dataType: "json"
			, data: {"param":"delete"}
			, success : function(responseData) {
				
				console.log("test_delete");
				
				updateOneLineNotice();
				
			}
		})
	});
	
});

function updateOneLineNotice() {
	$.ajax({
		type: "post"
		, url: "/admin/notice"
		, dataType: "json"
		, data: {"param": "update"}
		, success: function(responseData) {
			console.log(responseData.notice);
			
			$("#oneLine").val(responseData.notice.noticeContent);
			
		}
	
	});
}


function oneLineNotice(){
	$.ajax({
		type:"post",
		url: "/admin/notice",
		dataType:"json",
		data:{"param":"1",
			 "content" : $('#inputOneLine').val()
		},success : function(responseData){

			$('#oneLine').val($('#inputOneLine').val());
			$('#inputOneLine').val('');
		}
	
	});
}

function moreList() {
	
	$.ajax({
		type: "post"
		, url: "/admin/notice"
		, dataType: "json"
		, data: {
			"param":"more"
		}, success : function(responseData) {
			console.log(responseData.more[0].createDate);

 			$("#bodyModal div:nth-child(2)").remove();
 	
			var content = "";
			content += 
				"<div class='moreListTable' style='overflow-y: scroll;'>"+			
					"<table id='moreTable' class='table simple normal'>" + 
						"<thead>" +
							"<tr>" + 
								"<th>" +
									"No." +
								"</th>" +
								"<th>" +
									"내용"  +
								"</th>" + 
								"<th>" +
									"상태" +
								"</th>" +
							"</tr>" +
						"</thead>" + 
						"<tbody>";
						if(responseData.more[0].noticeId == null){
							content += 	"<span>등록된 공지가 없습니다</span>";
						}else{
						
							 for(var i = 0 ; i<responseData.more.length;i++){
								 content += 
									"<tr>" +
										"<td>"+
											responseData.more[i].noticeId +
										"</td>" +
										"<td>" +
											responseData.more[i].noticeContent +
										"</td>"+
										"<td>"+
								
											   new Date('<fmt:formatDate value="${responseData.more[i].createDate }" pattern="yyyy/MM/dd" />') + 
										
										"</td>" + 
									"</tr>"
							 }
						}
						
				
					content += "</tbody></table></div>";
					
			$(content).appendTo("#bodyModal");			
		}	
		
	});


	modalMore.show();
}


function showDate() {
    var d = new Date();
    var n = d.getFullYear();
    document.getElementById("tdDate").text(n);

}

</script>	
	
