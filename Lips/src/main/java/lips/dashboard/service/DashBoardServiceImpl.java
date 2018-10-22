package lips.dashboard.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.GsonBuilderUtils;
import org.springframework.stereotype.Service;

import lips.dashboard.dao.DashBoardDao;
import lips.dashboard.dto.DashBoardAssetDto;
import lips.dashboard.dto.DashBoardDto;
import lips.userinfo.dto.User;
import lips.userinfo.dto.UserByToken;
import net.sf.json.JSON;
import net.sf.json.JSONObject;



@Service
public class DashBoardServiceImpl implements DashBoardService{
	@Autowired DashBoardDao dao ;
	
	@Override
	public DashBoardDto checkPreset(int projectId) {
		DashBoardDto dto = new DashBoardDto();
		User user = new UserByToken().getInstance();
		String userId = user.getUserId();
		dto.setUserid(userId);
		dto.setProjectId(projectId);
		
		dto = dao.seldashboardDashDto(dto);
		//		
//		if (checkdto == null) {
//			
//			return checkdto;
//		}
	
		return dto ;
	}

	@Override
	public List<DashBoardAssetDto> presetData(DashBoardDto dto) {
	
		return dao.selJoinAssetDto(dto) ;
	}

	@Override
	public Integer maxXLocation(DashBoardDto dto) {
		
		return dao.selAssetMaxXDto(dto);
	}
	
	@Override
	public Integer maxYLocation(DashBoardDto dto) {
		
		return dao.selAssetMaxYDto(dto);
	}

	@Override
	public List<String> viewnames(DashBoardDto dto) {
	
		return dao.selViewNamebyDBdto(dto);
	}

	@Override
	public List<List<Integer>> YLocation(DashBoardDto dto, int MaxX) {
		int dashBoardId = dto.getDashboardId();
		Map<String,Integer> datamap = new HashMap<String, Integer>();
		datamap.put("dashBoardId", dashBoardId);
		
		List<List<Integer>> list = new ArrayList<List<Integer>>();
		
		for(int i = 1 ; i <= MaxX ; i++) {
			datamap.put("xLocation", i);
			list.add(dao.selYLocation(datamap));
	
		}
		
		
		return list;
	}

	@Override
	public List<Integer> YmaxLocation(DashBoardDto dto, int MaxX) {
		int dashBoardId = dto.getDashboardId();
		Map<String,Integer> datamap = new HashMap<String, Integer>();
		datamap.put("dashBoardId", dashBoardId);
		
		List<Integer> list = new ArrayList<Integer>();
		
		for(int i = 1 ; i <= MaxX ; i++) {
			datamap.put("xLocation", i);
			list.add(dao.selYmaxLocation(datamap));
	
		}
		
		
		return list;
	}
	
	


}
