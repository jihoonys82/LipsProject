package lips.alarm.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lips.alarm.service.AlarmService;
import lips.userinfo.dto.User;

@Controller
@RequestMapping(value="/alarm")
public class AlarmController {
	@Autowired AlarmService as;
	
	@RequestMapping(value="/load",method=RequestMethod.POST)
	public Map<String,String> load(User user){
		return null;
	}
	
	@RequestMapping(value="/proc",method=RequestMethod.POST)
	public List<Map<String,String>> proc(User user,String lastRequest){
		List<Map<String,String>> list = as.getNewAlarm(user, lastRequest);
		return null;
	}

}
