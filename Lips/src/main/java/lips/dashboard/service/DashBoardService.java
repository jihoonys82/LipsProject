package lips.dashboard.service;

import java.util.List;

import lips.card.dto.CardDto;
import lips.dashboard.dto.DashBoardDto;

public interface DashBoardService {

	public DashBoardDto checkPreset(int projectId);
	
	public Integer maxXLocation(DashBoardDto dto);
	
	public List<CardDto> AllCardList();

}
