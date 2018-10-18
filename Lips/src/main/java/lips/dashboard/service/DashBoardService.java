package lips.dashboard.service;

import java.util.List;
import java.util.Map;

import lips.dashboard.dto.DashBoardAssetDto;
import lips.dashboard.dto.DashBoardDto;

public interface DashBoardService {

	public DashBoardDto checkPreset(int projectId);
	
	public List<DashBoardAssetDto> presetData(DashBoardDto dto);
	
	public Map<String,String> maxLocation(DashBoardDto dto);
	
	public Map<Integer, Integer> lineLocation(int projectId, Map<String, String> maxLocation);
	
}
