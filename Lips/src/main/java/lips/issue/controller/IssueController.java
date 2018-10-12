package lips.issue.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/issue")
public class IssueController {

	@RequestMapping(value="/main", method=RequestMethod.GET)
	public void issueMain() {
		
	}
	
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public void issueCreateForm() {
		
	}
}
