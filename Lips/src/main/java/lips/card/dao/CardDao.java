package lips.card.dao;

import java.util.List;

import lips.card.dto.CardDto;

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
	
}
