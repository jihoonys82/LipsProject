package lips.alarm.service;

import java.util.List;
import java.util.Map;

import lips.userinfo.dto.User;

public interface AlarmService {
	public List<Map<String,String>> getNewAlarm(User user, String lastRequest);
	public Map<String,String> getAllAlarm(User user);
	//public void notice(NoticeDto notice);
}
