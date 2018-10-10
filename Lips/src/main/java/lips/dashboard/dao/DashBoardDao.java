package lips.dashboard.dao;

import lips.dashboard.dto.DashBoardDto;

public interface DashBoardDao {
	public DashBoardDto viewDash(DashBoardDto dto);
	
	public DashBoardDto viewDashBasic();
}
