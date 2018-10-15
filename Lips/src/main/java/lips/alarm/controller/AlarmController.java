package lips.alarm.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/alarm")
public class AlarmController {
	
	@RequestMapping(value="/proc")
	public Map<String,String> proc(String lastRequest){
		
		return null;
	}
	@RequestMapping(value="/notice")
	public void notice() {
		
	}
	@RequestMapping(value="/send")
	public void send() {
		
	}
}
