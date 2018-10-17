package lips.issue.service;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import lips.issue.dao.IssueDao;
import lips.issue.dto.IssueDto;
import lips.userinfo.dto.User;

@Service
public class IssueService {

	private static final Logger logger = LoggerFactory.getLogger(IssueService.class);
	
	@Autowired IssueDao issueDao;
	
	public ModelAndView setIssueMain(User user) {
		
//		logger.info(user.toString());
		ModelAndView mav = new ModelAndView();
		
		IssueDto issueDeadline = issueDao.selIssueByDealine(user);
		IssueDto issueMostFollowed = issueDao.selIssueByFollower(user);
		
		mav.addObject("issueCloseDeadline", issueDeadline);
		mav.addObject("watcherCloseDeadline", issueDao.selIssueWatcherCount(issueDeadline));
		mav.addObject("commentCloseDeadline", issueDao.selIssueCommentCount(issueDeadline));
		
		mav.addObject("issueMostFollowed", issueMostFollowed);
		mav.addObject("watcherMostFollowed", issueDao.selIssueWatcherCount(issueMostFollowed));
		mav.addObject("commentMostFollowed", issueDao.selIssueWatcherCount(issueMostFollowed));
		
		mav.addObject("issueAssigned", issueDao.selIssueByAssignee(user));
		mav.addObject("issueFollowing", issueDao.selIssueByFollowing(user));
		
		mav.setViewName("issue/main");
		
		return mav;
	}
	
}
