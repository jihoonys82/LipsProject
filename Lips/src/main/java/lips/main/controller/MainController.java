package lips.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lips.freeboard.service.FreeboardService;
import lips.main.service.MainService;
import lips.userinfo.dto.User;
import lips.userinfo.dto.UserByToken;
import lips.userinfo.dto.UserTracker;

@Controller
public class MainController {
	
	@Autowired
	MainService service;
	@Autowired FreeboardService fbsvc;
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	@Autowired UserTracker userTrack;
	
	//인트로
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String intro() {
		return "intro";
	}
	

	//메인페이지 
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView();
		User user = new UserByToken().getInstance();
		mav = fbsvc.mainView();
		
		mav.addObject("mainInfo",service.mainPage(user));
		mav.setViewName("main/main");
		return mav;
	}
	
	//도네이션 
	@RequestMapping(value = "/donation", method = RequestMethod.GET)
	public String donation() {
		return "donation";
	}

}
