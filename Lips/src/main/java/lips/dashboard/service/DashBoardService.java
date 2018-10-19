package lips.dashboard.service;

import java.util.List;
import java.util.Map;

import lips.dashboard.dto.DashBoardAssetDto;
import lips.dashboard.dto.DashBoardDto;
import net.sf.json.JSONObject;

public interface DashBoardService {

	public DashBoardDto checkPreset(int projectId);
	
	public List<DashBoardAssetDto> presetData(DashBoardDto dto);
	
	public Integer maxLocation(DashBoardDto dto);
	
//	public Map<Integer, List<Integer>> lineLocation(DashBoardDto dto, int MaxX);
	
	public JSONObject lineLocation(DashBoardDto dto, int MaxX);
	
//	public Map<Integer, Integer> lineMaxLocation(DashBoardDto dto, int MaxX);
	
	public JSONObject lineMaxLocation(DashBoardDto dto, int MaxX);
	
}
