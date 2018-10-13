package lips.dashboard.service;

import java.util.List;

import lips.dashboard.dto.DashBoardAssetDto;
import lips.dashboard.dto.DashBoardDto;

public interface DashBoardService {

	public DashBoardDto checkPreset(DashBoardDto dto);
	
	public List<DashBoardAssetDto> presetData(DashBoardDto dto);
	
}
