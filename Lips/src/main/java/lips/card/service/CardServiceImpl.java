package lips.card.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import lips.card.dao.CardDao;
import lips.card.dto.CardDto;
import lips.issue.dao.IssueDao;
import lips.issue.dto.IssueDto;
import lips.userinfo.dto.User;

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
	public ModelAndView setIssueDeadLine(User user) {
		ModelAndView mav = new ModelAndView();
		
		IssueDto issueDeadline = issueDao.selIssueByDealine(user);
		
		mav.addObject("issueCloseDeadline", issueDeadline);
		mav.addObject("watcherCloseDeadline", issueDao.selIssueWatcherCount(issueDeadline));
		mav.addObject("commentCloseDeadline", issueDao.selIssueCommentCount(issueDeadline));
	
		mav.addObject("issueStage", issueDao.selStageAsset());
		mav.setViewName("card/card2");
		return mav;

	}
	
	@Override
	public ModelAndView setIssueMostFollowed(User user) {
		ModelAndView mav = new ModelAndView();
		
		IssueDto issueMostFollowed = issueDao.selIssueByFollower(user);
		mav.addObject("issueMostFollowed", issueMostFollowed);
		mav.addObject("watcherMostFollowed", issueDao.selIssueWatcherCount(issueMostFollowed));
		mav.addObject("commentMostFollowed", issueDao.selIssueWatcherCount(issueMostFollowed));
		
		mav.addObject("issueStage", issueDao.selStageAsset());
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

}
