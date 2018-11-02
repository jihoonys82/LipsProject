package lips.userinfo.controller;

import java.util.Collection;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	@RequestMapping(value="/join/checkid", method = RequestMethod.POST)
	public ModelAndView joinIdCheck(User user) {
		ModelAndView mav = new ModelAndView();
		boolean check = service.checkId(user); // true : 가입가능
		mav.addObject("check", check);
		mav.setViewName("jsonView");
		return mav;
	}
	@RequestMapping(value="/join/mailOverlap", method=RequestMethod.POST)
	public ModelAndView mailOverlap(User user) {
		ModelAndView mav = new ModelAndView();
		boolean check = service.checkEmail(user);
		mav.addObject("check",check);
		mav.setViewName("jsonView");
		return mav;
	}
	@RequestMapping(value="/join/mailSend", method = RequestMethod.POST)
	public ModelAndView sendMail(User user,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String uid = service.sendMail(user,request);
		mav.addObject("code",uid);
		mav.setViewName("jsonView");
		return mav;
	}
	@RequestMapping(value="/search", method = RequestMethod.GET)
	public void search() {}	
	
	@RequestMapping(value="/search/id",method=RequestMethod.POST)
	public ModelAndView searchId(User user,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", service.searchId(user,request));
		mav.setViewName("jsonView");
		return mav;
	}
	@RequestMapping(value="/search/pw",method=RequestMethod.POST)
	public ModelAndView searchPw(User user,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", service.searchPw(user, request));
		mav.setViewName("jsonView");
		return mav;
	}
	@RequestMapping(value="/mypage",method=RequestMethod.GET)
	public void mypage() {}
	@RequestMapping(value="/mypage/update",method=RequestMethod.POST)
	public String updateInfo(User user) {
		service.updateInfo(user);
		return "redirect:/logout";
	}

	@RequestMapping(value="/access_denied",method=RequestMethod.GET)
	public void denied() {}
	

}
