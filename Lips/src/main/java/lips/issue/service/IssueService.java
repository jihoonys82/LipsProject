package lips.issue.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import lips.issue.dao.IssueDao;
import lips.issue.dto.IssueDto;
import lips.project.dao.ProjectDao;
import lips.project.dto.ProjectDto;
import lips.userinfo.dao.UserDao;
import lips.userinfo.dto.User;
import lips.userinfo.dto.UserByToken;

@Service
public class IssueService {

	private static final Logger logger = LoggerFactory.getLogger(IssueService.class);
	
	@Autowired IssueDao issueDao;
	@Autowired ProjectDao projectDao;
	@Autowired UserDao userDao;
	
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
		logger.info(projectDto.toString());
		if(projectDto.getProjectId()>0) {			
			mav.addObject("category", issueDao.selCatByProjId(projectDto));
		} 
		mav.addObject("projList", projectDao.selPro(user));
		
		mav.setViewName("issue/create");
		
		return mav;
	}

	public ModelAndView setIssueCreate() {
		ModelAndView mav = new ModelAndView();
		User user = new UserByToken().getInstance();
		mav.addObject("projList", projectDao.selPro(user));
		mav.setViewName("issue/create");
		return mav;
	}

	public ArrayList<User> getMemberList(String name, ProjectDto projectDto) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("projectId", ((Integer)projectDto.getProjectId()).toString());
		ArrayList<User> users = (ArrayList<User>)issueDao.selUserByName(map);
		
		return users;
	}
	
}
