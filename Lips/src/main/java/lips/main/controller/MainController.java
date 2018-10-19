package lips.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lips.userinfo.dto.User;
import lips.userinfo.dto.UserByToken;
import lips.userinfo.dto.UserTracker;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	@Autowired UserTracker userTrack;
	
	//인트로
	@RequestMapping(value = "/intro", method = RequestMethod.GET)
	public String intro() {
		logger.info("intro 활성화");
		return "intro";
	}
	

	//메인페이지 
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		User user = new UserByToken().getInstance();
		logger.info(user.getNick()+ "   로그인" );
		return "main/main";
	}

}
