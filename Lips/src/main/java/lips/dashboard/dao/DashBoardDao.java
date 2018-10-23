package lips.dashboard.dao;

import lips.dashboard.dto.DashBoardDto;

public interface DashBoardDao {
	/**
	 * 입력데이터가 저장되어있는지 확인한다
	 * @param DashBoardDto (userId, projectId)
	 * @return DashBoardDto (*)
	 */
	public DashBoardDto seldashboardDashDto(DashBoardDto dto);
	
	
	/**
	 * Dashboard_user_asset 을 DashBoardDto 로 검색하여 position x Max를 출력한다
	 * @param DashBoardAssetDto(DashBoardId)
	 * @return Integer
	 */
	public Integer selAssetMaxXDto(DashBoardDto dto);
	
	
}
