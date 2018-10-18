package lips.issue.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import lips.issue.dao.IssueDao;
import lips.issue.dto.IssueDto;
import lips.project.dao.ProjectDao;
import lips.project.dto.ProjectDto;
import lips.userinfo.dto.User;
import lips.userinfo.dto.UserByToken;

@Service
public class IssueService {

	private static final Logger logger = LoggerFactory.getLogger(IssueService.class);
	
	@Autowired IssueDao issueDao;
	@Autowired ProjectDao projectDao;
	
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

	public ModelAndView setIssueCreate(ProjectDto projectDto) {
		ModelAndView mav = new ModelAndView();
		User user = new UserByToken().getInstance();
		
		if(projectDto.getProjectId()>0) {			
			mav.addObject("category", issueDao.selCatByProjId(projectDto));
		} else {
			mav.addObject("projList", projectDao.selPro(user));
		}
		
		mav.setViewName("issue/create");
		
		return mav;
	}
	
}
