package lips.alarm.service;

import java.util.List;
import java.util.Map;

import lips.alarm.dto.Alarm;
import lips.userinfo.dto.User;

public interface AlarmService {
	public List<Alarm> getNewAlarm(Alarm alarm);
	public Map<String,String> getAllAlarm(User user);
	//public void notice(NoticeDto notice);
}
