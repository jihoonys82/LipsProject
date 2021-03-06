$(document).ready( function() {

	
	/**
	 * countDate Function 현재 시간에서 해당 시간까지 얼마나 남았는지 알려주는 함수 사용할
	 * 날짜에 <span class=""> 를적용하고 class명을 파라미터로 넣으면 된다. 페이지에서 한번만
	 * 실행하면 같은 모든 클래스명에대해 한번에 적용됨.
	 * 
	 * @param date :
	 *            남은 시간에 대한 클래스 명
	 * @Author : 정지훈
	 */
	var countDate = function(date) {
		var cdList = document.getElementsByClassName(date);

		for (i = 0; i < cdList.length; i++) {

			var cDate = new Date(cdList[i].innerText);
			var diff = moment(cDate).diff(moment());
			var diffDay = Math.floor(diff
					/ (60 * 60 * 1000 * 24) * 1)
			var diffHour = Math
					.floor((diff % (60 * 60 * 1000 * 24))
							/ (60 * 60 * 1000) * 1)
			var diffMin = Math
					.floor(((diff % (60 * 60 * 1000 * 24)) % (60 * 60 * 1000))
							/ (60 * 1000) * 1)
			var remainTime = "";
			if (diffDay != 0)
				remainTime += diffDay + "일 ";
			if (diffHour != 0)
				remainTime += diffHour + "시간 ";
			remainTime += diffMin + "분 ";
			if (Math.sign(diff) < 0) {
				remainTime += "지남";
				cdList[i].style.color = "#FF0000";
			} else
				remainTime += "남음";

			cdList[i].innerText = remainTime;
		}
	};

});
/**
 * 알람기능 사용하기
 * @param title : 알람 제목 지정
 * @param options : github 참조
 * @returns void
 */
function notify(title, options,callback) {
	var defaultOption = {
		icon : "/resources/img/logo_ntf.png"
	}
	for ( var prop in options) {
		if (options.hasOwnProperty(prop)) {
			defaultOption[prop] = options[prop];
		}
	}
	console.log(jsonCount(defaultOption));
	if (!("Notification" in window)) {
		alert("알람 기능을 수행할 수 없는 브라우저 입니다.");
	} else if (Notification.permission === "granted") {
		var notification = new Notification(title, defaultOption);
		notification.onclick = function(event){
			callback();
		};
	} else if (Notification.permission !== 'denied') {
		Notification.requestPermission(function(permission) {
			if (permission === "granted") {
				var notification = new Notification(title, defaultOption);
				notification.onclick = function(event){
					callback();
				};
			}
		});
	}
}






//-----------------------------
function jsonCount(obj) {
	var count = 0;
	for ( var prop in obj) {
		if (obj.hasOwnProperty(prop)) {
			++count;
		}
	}
	return count;
}