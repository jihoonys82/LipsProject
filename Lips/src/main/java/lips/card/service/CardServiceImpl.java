package lips.card.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import lips.card.dao.CardDao;
import lips.card.dto.CardDto;
import lips.issue.dao.IssueDao;
import lips.issue.dto.IssueDto;
import lips.userinfo.dto.User;
import lips.userinfo.dto.UserByToken;

@Service
public class CardServiceImpl implements CardService {
	@Autowired CardDao dao;
	@Autowired IssueDao issueDao ;

	@Override
	public List<CardDto> YLocationList(CardDto dto) {
		
		return dao.selJoinYLocation(dto);
	}

	@Override
	public String CardValue(CardDto dto) {
		
		return dao.selCardValueDto(dto);
	}

	@Override
	public List<CardDto> AllCardList() {
	
		return dao.selAllCardList();
	}

	@Override
	public ModelAndView setIssueDeadLine(User user , int projectId) {
		ModelAndView mav = new ModelAndView();
		String userId = user.getUserId();
		CardDto dto = new CardDto();
		
		dto.setProjectId(projectId);
		dto.setUserId(userId);
		
		IssueDto issueDeadline = dao.selIssueByDealine(dto);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + issueDeadline);
		
		mav.addObject("issueCloseDeadline", issueDeadline);
		
		if(issueDeadline!=null) {
			mav.addObject("watcherCloseDeadline", issueDao.selIssueWatcherCount(issueDeadline));
			mav.addObject("commentCloseDeadline", issueDao.selIssueCommentCount(issueDeadline));
			mav.addObject("issueStage", issueDao.selStageAsset(projectId));
		}
		mav.setViewName("card/card2");
		return mav;

	}
	
	@Override
	public ModelAndView setIssueMostFollowed(User user  , int projectId) {
		ModelAndView mav = new ModelAndView();
		CardDto dto = new CardDto();
		String userId = user.getUserId();
		dto.setUserId(userId);
		dto.setProjectId(projectId);
		
		IssueDto issueMostFollowed = dao.selIssueByFollower(dto);
		
		System.out.println("####################################" + issueMostFollowed);
		
		mav.addObject("issueMostFollowed", issueMostFollowed);
		if(issueMostFollowed!=null) {
		mav.addObject("watcherMostFollowed", issueDao.selIssueWatcherCount(issueMostFollowed));
		mav.addObject("commentMostFollowed", issueDao.selIssueWatcherCount(issueMostFollowed));
		mav.addObject("issueStage", issueDao.selStageAsset(projectId));
		}		
		mav.setViewName("card/card3");
		return mav;
	}

	@Override
	public ModelAndView setCard5ProjectEnddate(CardDto dto) {
		ModelAndView mav = new ModelAndView();

		CardDto date = dao.selprojectDeadLinebyprojectId(dto);
		SimpleDateFormat parseDate = new SimpleDateFormat("yyyy/MM/dd");
		String deadLine = parseDate.format(date.getCloseDate());
		String createLine = parseDate.format(date.getCreateDate());
		
		mav.addObject("deadLine", deadLine);
		mav.addObject("createLine",createLine);
		mav.setViewName("card/card5");
		
//		"May 9, 2017 06:00:00"
		
		return mav;
	}

	@Override
	public ModelAndView setCard6PJissueList(int projectId) {
		ModelAndView mav = new ModelAndView();
		
		List<IssueDto> issues = new ArrayList<>();
		CardDto dto = new CardDto();
		
		dto.setProjectId(projectId);
		
		issues = dao.selIssueByProject(dto);	
		
		mav.addObject("listType", "ProjectIssue");
		mav.addObject("issues", issues);
		mav.addObject("projectId", projectId);
		
		mav.setViewName("card/card6");
		
		return mav;
	}

}
