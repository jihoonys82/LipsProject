package lips.card.service;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import lips.card.dto.CardDto;
import lips.userinfo.dto.User;

public interface CardService {
	public List<CardDto> YLocationList(CardDto dto);
	
	public String CardValue(CardDto dto);
	
	public List<CardDto> AllCardList();
	
	public ModelAndView setIssueDeadLine(User user, int projectId);
	
	public ModelAndView setIssueMostFollowed(User user , int projectId);
	
	public ModelAndView setCard5ProjectEnddate(CardDto dto);

}
