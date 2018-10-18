package lips.userinfo.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lips.userinfo.dto.User;
import lips.userinfo.service.CustomeUserDetailsService;

@Controller
@RequestMapping(value="/user")
public class UserController {
	@Autowired CustomeUserDetailsService service;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);  
	
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void login() {}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public void join() {}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinProc(User user) {
		logger.info(user.toString());
		service.join(user);
		return "redirect:login";
	}
	
}
