package lips.dashboard.service;

import java.util.List;

import lips.dashboard.dto.DashBoardAssetDto;
import lips.dashboard.dto.DashBoardDto;

public interface DashBoardService {

	public DashBoardDto checkPreset(int projectId);
	
	public List<DashBoardAssetDto> presetData(DashBoardDto dto);
	
	public Integer maxXLocation(DashBoardDto dto);
	
	public Integer maxYLocation(DashBoardDto dto);
	
	public List<String> viewnames(DashBoardDto dto);
	
	public List<List<Integer>> YLocation(DashBoardDto dto , int MaxX);
	
	public List<Integer> YmaxLocation(DashBoardDto dto , int MaxX);


	
}
