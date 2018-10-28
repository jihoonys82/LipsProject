package lips.alarm.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lips.alarm.dao.AlarmDao;
import lips.userinfo.dto.User;

@Service
public class AlarmServiceImpl implements AlarmService{
	@Autowired AlarmDao ad;
	
	@Override
	public List<Map<String, String>> getNewAlarm(User user, String lastRequest) {
		List<Map<String, String>> list = new ArrayList<>();
		
		
		return list;
	}

	@Override
	public Map<String, String> getAllAlarm(User user) {
		// TODO Auto-generated method stub
		return null;
	}

}
