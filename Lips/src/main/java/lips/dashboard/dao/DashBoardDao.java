package lips.dashboard.dao;

import java.util.List;
import java.util.Map;

import lips.dashboard.dto.DashBoardAssetDto;
import lips.dashboard.dto.DashBoardDto;

public interface DashBoardDao {
	/**
	 * 입력데이터가 저장되어있는지 확인한다
	 * @param DashBoardDto (userId, projectId)
	 * @return DashBoardDto (*)
	 */
	public DashBoardDto seldashboardDashDto(DashBoardDto dto);
	
	/**
	 * DashBoardID로 검색하고 Dashboard_user_asset 과 Dashboard_asset 테이블을 assetId 로 조인하여 모든 항목을 출력한다
	 * @param DashBoardAssetDto(DashBoardId)
	 * @return Join List
	 */
	public List<DashBoardAssetDto> selJoinAssetDto(DashBoardDto dto);
	
	/**
	 * Dashboard_user_asset 을 DashBoardDto 로 검색하여 position x 를 출력한다
	 * @param DashBoardAssetDto(DashBoardId)
	 * @return selectMaxXList
	 */
	public String selAssetMaxXDto(DashBoardDto dto);
	
	/**
	 * Dashboard_user_asset 을 DashBoardDto 로 검색하여 position y 를 출력한다
	 * @param DashBoardAssetDto(DashBoardId)
	 * @return selectMaxYList
	 */
	public String selAssetMaxYDto(DashBoardDto dto);
	
	public Integer selassetLineMaxYprojectId(Map<String, Integer> dataMap);

	
}
