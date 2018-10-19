package lips.userinfo.controller;

import java.util.Collection;
import java.util.List;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lips.userinfo.dto.User;
import lips.userinfo.dto.UserTracker;
import lips.userinfo.service.CustomeUserDetailsService;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	@Autowired	CustomeUserDetailsService service;
	@Autowired	ServletContext servletContext;
	@Autowired UserTracker userTrack;

	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void login(@RequestParam(defaultValue = "false", required = false) String param, Model model){
		model.addAttribute("isRetry", param);
	}
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void join(){}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinProc(User user){
		service.join(user);
		return "redirect:login";
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout() {
		Collection<? extends GrantedAuthority> list = SecurityContextHolder.getContext().getAuthentication().getAuthorities();
		userTrack.setUserTrack((List)list, false);
		return "redirect:/logout";
	}

}
