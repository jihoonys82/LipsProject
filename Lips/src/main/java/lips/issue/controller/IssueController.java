package lips.issue.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lips.issue.service.IssueService;

@Controller
@RequestMapping(value="/issue")
public class IssueController {
	
	@Autowired IssueService issueService;
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public ModelAndView issueMain(HttpSession session) {
		
		ModelAndView mav = issueService.setIssueMain(session);
		
		return mav;
	}
	
	//테스트용 메서드
	@RequestMapping(value="/main2", method=RequestMethod.GET)
	public String main2() {
		
		return "issue/main";
	}
	
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public void issueCreateForm() {
		
	}
}
