package lips.issue.service;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import lips.issue.dao.IssueDao;
import lips.userinfo.dto.User;

@Service
public class IssueService {

	private static final Logger logger = LoggerFactory.getLogger(IssueService.class);
	
	@Autowired IssueDao issueDao;
	
	public ModelAndView setIssueMain(HttpSession session) {
		
		User user = (User)session.getAttribute("user");
//		logger.info(user.toString());
		ModelAndView mav = new ModelAndView();
		mav.addObject("issueCloseDeadline", issueDao.selIssueByDealine(user));
		mav.addObject("issueMostFollowed", issueDao.selIssueByFollower(user));
		mav.addObject("issueAssigned", issueDao.selIssueByAssignee(user));
		mav.addObject("issueFollowing", issueDao.selIssueByFollowing(user));
		
		mav.setViewName("issue/main");
		
		return mav;
	}
	
}
