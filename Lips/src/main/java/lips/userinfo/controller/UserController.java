package lips.userinfo.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lips.userinfo.dto.User;
import lips.userinfo.service.CustomeUserDetailsService;

@Controller
@RequestMapping(value="/user")
public class UserController {
	@Autowired CustomeUserDetailsService service;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);  
	
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void login() {}
	
}
