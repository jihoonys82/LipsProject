package lips.alarm.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lips.alarm.dao.AlarmDao;
import lips.alarm.dto.Alarm;
import lips.userinfo.dto.User;

@Service
public class AlarmServiceImpl implements AlarmService{
	@Autowired AlarmDao ad;
	@Override
	public List<Alarm> getNewAlarm(Alarm alarm) {
		Date lastReq = ad.selLastReq(alarm);
		alarm.setLastRequest(lastReq);
		List<Alarm> list = ad.selNewAlarm(alarm);
		if(list.size() != 0) {
			Alarm lastAlarm = list.get(0);
			lastAlarm.setUserId(alarm.getUserId());
			ad.upLastReq(lastAlarm);
		}

		return list;
		
	}
	

	@Override
	public Map<String, String> getAllAlarm(User user) {
		// TODO Auto-generated method stub
		return null;
	}

}
