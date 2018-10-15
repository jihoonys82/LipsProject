package lips.alarm.dao;

import java.util.Map;

import lips.userinfo.dto.User;

public interface AlarmDao {
	public Map<String,String> selNewAlarmUser(User user,String lastRequest);
	public void inNewAlarm(String category);
	//public void inNotice(NoticeDto notice);
	//public Map<String,String> selAllAlarmUser(User user);
	
}
