package lips.alarm.service;

import java.util.Map;

import lips.userinfo.dto.User;

public interface AlarmService {
	public Map<String,String> getNewAlarm(User user, String lastRequest);
	public Map<String,String> getAllAlarm(User user);
	//public void notice(NoticeDto notice);
}
