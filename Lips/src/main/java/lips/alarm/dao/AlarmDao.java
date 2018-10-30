package lips.alarm.dao;

import java.util.Date;
import java.util.List;

import lips.alarm.dto.Alarm;

public interface AlarmDao {
	public List<Alarm> selNewAlarm(Alarm alarm);
	public void upLastReq(Alarm alarm);
	public Date selLastReq(Alarm alarm);
	//public void inNotice(NoticeDto notice);
	//public Map<String,String> selAllAlarmUser(User user);

}
