<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

	<div class="panel">
		<div class="body">
			   	<div class="infomationWith col col-9">사용자</div>
			   	  	<div class=infomation col col-3"> 
   						<ul id="tab_1" class="tab top"> 
    						 <li><a href="/admin/user/chart">차트</a></li> 
  		       				<li><a href="/admin/user/text">텍스트</a></li> 
 						</ul>
   					</div> 
		</div>
		
		<div class="body">
			<div class="blackBox col col-1">기간</div>
     				<div class="whiteBox col col-1"> 
   						2018-10-12 
   					</div> 
<!-- '-' 넣기 --> 
  					<div class="whiteBox col col-1"> 
   						2018-10-24
   					</div> 
   					
   					<a class="btn mini focus">오늘</a>
  					<a class="btn mini focus">일주일</a>
  					<a class="btn mini focus">한 달</a>
  					
<!--   				 	<div class="dropdown" style="margin-left: -15px;"> -->
<!--             	       	  <ul style="width: 120px;"> -->
<!-- 			                <li value="1">Dropdown 1</li> -->
<!-- 			                <li value="2">Dropdown 2</li> -->
<!-- 			                <li value="3">Dropdown 3</li> -->
<!-- 			                <li value="4">Dropdown 4</li> -->
<!-- 			            </ul> -->
<!--   			      </div> -->
  					
		</div>
		
		<div class="body">
			<div class="row">
				<div class="col col-12">
					<div class="infoBox col col-3">
						<div class="boxWrapper">
							<div class="numBox">
								200
							</div>
						<div>
								총 사용자
						</div>
						</div>
					</div>
					
					<div class="infoBox col col-3">
						<div class="boxWrapper">
							<div class="numBox">
								20
							</div>
						<div>
								신규 사용자
						</div>
						</div>
					</div>
			
					<div class="infoBox col col-3">
						<div class="boxWrapper">
							<div class="numBox">
								12
							</div>
						<div>
								탈퇴한 사용자
						</div>
						</div>
					</div>
			
					<div class="infoBox col col-3">
						<div class="boxWrapper">
							<div class="numBox">
								35
							</div>
						<div>
								프로젝트 생성자
						</div>
						</div>
					</div>	
				</div>	
			</div> <!-- row 끝 -->
		</div>	<!-- body 끝 -->
		
		<div class="body">
			<div class="forSizing-uTable">

			<table class="table classic stripe">
				<thead>
					<tr>
						<th>회원 No.</th>
						<th>갱신 일자</th>
						<th>상태</th>
						<th>진행 상황</th>
						<th>프로젝트 리더</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${uList }" var="uList">
						<tr class="text-center">
							<td>${uList.userId }</td>
							<td>${uList.nick }</td>
							<td>${uList.email }</td>
							<td>${uList.phone }</td>
							<td>${uList.birth }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div class="forSizing-uPaging">
				<div style="display: block; text-align: center;">
					<div class="paging" style="width: 350px;">
						<a href="#" class="prev" style="display: block;">Previous</a>
						<div class="list">
							<a href="#">1</a> <a href="#" class="active">2</a> <a href="#">3</a>
							<a href="#">4</a> <a href="#">5</a>
						</div>
						<a href="#" class="next">Next</a>
					</div>
				</div>
			</div>

		</div>
	</div>
		
</div>	


<!--   <script type="text/javascript"> -->
<!-- //   	$(document).ready(function(){ -->
<!-- //   		$("#btnWrite").click(function(){ -->
<!-- //   			location.href="/board/write" -->
<!-- //   		}); -->
  		
<!-- //   		$("table").on("click", "tr", function() { -->
<!-- //   			var boardNo = $(this).children("td").eq(0).text(); -->
  			
<!-- //   			$(location).attr("href","/board/view?boardNo="+boardNo); -->
<!-- //   		}); -->
  		
<!-- //   	}); -->
<!--   </script> -->

</body>
</html>