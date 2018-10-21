<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="panel">
	<div class="body">
		<div class="infomationWith col col-9">사용자</div>
		<div class=infomation colcol-3">
			<ul id="tab_1" class="tab top">
				<li><a href="/admin/user/chart">차트</a></li>
				<li><a href="/admin/user/text">텍스트</a></li>
			</ul>
		</div>
	</div>
		
	<div class="body forDisplay-body-first">
			<div class="forDisplay-body-second">
				<div class="blackBox col col-1">기간</div>
					<input type="date" class="col col-2 color-date input"/>
					<input type="date" class="col col-2 color-date input"/>
					
				<a class="btn mini focus margin-a">오늘</a> <a class="btn mini focus">일주일</a> <a
					class="btn mini focus">한 달</a>

				<div id="combo_1" class="combo">
					
					<a class="btn small forSizing-btn-first">Select...</a>
					<a class="btn small toggle"><i class="icon-arrow2"></i></a>
					<ul>
						<li value="1">유저 아이디</li>
						<li value="2">유저 닉네임</li>
						<li value="3">강등된 유저</li>
					</ul>
				
				</div>
			
				<input type="text" class="forSizing-input input"/>
		
				<button class="btn small focus forSizing-btn-second"
					onclick="alert(combo_1.getText())">검색</button>
			</div>
		
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
								52
							</div>
						<div>
								접속 중인 사용자
						</div>
						</div>
					</div>	
				</div>	
			</div> <!-- row 끝 -->
		</div>	<!-- body 끝 -->
		
		<div class="body forSizing-chart">
			<div class="row">
			<div class="test col col-12">
			<div class="chartBox col col-5" id="result">
				
			</div>
			<div class="chartBox col col-5">
				chart
			</div>
			</div>
			</div>
		</div>
		
		
	</div>	

<script>
	jui.ready([ "ui.combo" ], function(combo) {
		combo_1 = combo("#combo_1",
				{
					index : 2,
					event : {
						change : function(data) {
							alert("text(" + data.text + "), value("
									+ data.value + ")");
						}
					}
				});
	});
</script>


</body>
</html>