package lips.dashboard.service;

import lips.dashboard.dto.DashBoardDto;

public interface DashBoardService {

	public DashBoardDto checkPreset(int projectId);
	
	public Integer maxXLocation(DashBoardDto dto);
	

}
