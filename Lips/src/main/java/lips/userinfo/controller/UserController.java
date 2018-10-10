package lips.userinfo.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lips.userinfo.dto.User;
import lips.userinfo.service.UserService;

@Controller
@RequestMapping(value="/user")
public class UserController {

	@Autowired UserService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);  
	
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void login() {}
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView loginProc(User user, String useCookie, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User loginUser = userService.login(user);
		if(loginUser != null) {
			logger.info(loginUser.toString());
			loginUser.setPw(null);
			session.setAttribute("user", loginUser);
			session.setAttribute("login", true);
			mav.setViewName("redirect:/");
		}else{
			mav.setViewName("user/login");
		}
		return mav;
	}
	@RequestMapping(value="logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
