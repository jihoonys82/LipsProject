package lips.alarm.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lips.alarm.dto.Alarm;
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
	public ModelAndView proc(Alarm alarm){
		ModelAndView mav = new ModelAndView();
		
		List<Alarm> list = as.getNewAlarm(alarm);
		
		mav.addObject("data", list);
		mav.setViewName("jsonView");
		return mav;
	}

}
