package lips.card.dao;


import java.util.List;
import java.util.Map;

import lips.card.dto.CardDto;
import lips.issue.dto.IssueDto;
import lips.userinfo.dto.User;

public interface CardDao {
	/**
	 * DashBoardID와 XLocation으로 검색하고 Dashboard_user_asset 과 Dashboard_asset 테이블을 assetId 로 조인하여 YLocation 과 그에따른 데이터를 출력한다
	 * @param CardDto
	 * @return List<CardDto>
	 */
	public List<CardDto> selJoinYLocation(CardDto dto);
	
	/**
	 * DashBoardID와 XLocation,YLocation 으로 검색하고 Dashboard_user_asset 테이블 의 CardValue를 출력한다
	 * @param CardDto
	 * @return String
	 */
	public String selCardValueDto(CardDto dto);
	
	/**
	 * Dashboard_asset 에서 모든 카드 리스트를 출력한다
	 * @return List<CardDto>
	 */
	public List<CardDto> selAllCardList();
	
	/**
	 * projectId 로 projectinfo 를 조회후 closedate를 출력
	 * @param Integer
	 * @return Date
	 * */
	public CardDto selprojectDeadLinebyprojectId(CardDto dto);
	
	public List<IssueDto> selIssueByProject(CardDto dto);
	
	public IssueDto selIssueByDealine(CardDto dto);
	
	public IssueDto selIssueByFollower(CardDto dto);
	
	
}
