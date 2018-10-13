package lips.dashboard.dao;

import java.util.List;

import lips.dashboard.dto.DashBoardAssetDto;
import lips.dashboard.dto.DashBoardDto;

public interface DashBoardDao {
	/**
	 * @param DashBoardDto (userId, projectId)
	 * @return DashBoardDto (*)
	 * 입력데이터가 저장되어있는지 확인한다
	 */
	public DashBoardDto seldashboardDashDto(DashBoardDto dto);
	
	/**
	 * @param DashBoardAssetDto(DashBoardId)
	 * @return Join List
	 * DashBoardID로 검색하고 Dashboard_user_asset 과 Dashboard_asset 테이블을 assetId 로 조인하여 모든 항목을 출력한다
	 */
	public List<DashBoardAssetDto> selJoinAssetDto(DashBoardDto dto);

	
}
