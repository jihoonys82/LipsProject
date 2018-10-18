package lips.dashboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jdk.nashorn.api.tree.LineMap;
import lips.dashboard.dao.DashBoardDao;
import lips.dashboard.dto.DashBoardAssetDto;
import lips.dashboard.dto.DashBoardDto;
import lips.userinfo.dto.User;
import lips.userinfo.dto.UserByToken;



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
////			dashmap의 키값unjoindashBoard 에 dashBoard 미등록시 보여줄 커스터 마이징 툴팁이미지 경로 넣어야함
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
	public Map<String, String> maxLocation(DashBoardDto dto) {
		Map<String,String> maxLocation = new HashMap<String, String>();
		maxLocation.put("Xlocation", dao.selAssetMaxXDto(dto));
		maxLocation.put("Ylocation", dao.selAssetMaxYDto(dto));
		
		return maxLocation;
	}

	@Override
	public Map<Integer, Integer> lineLocation(int projectId , Map<String, String> maxLocation) {
		Map<String, Integer> dataMap = new HashMap<String, Integer>();
		Map<Integer,Integer> lineMap = new HashMap<Integer, Integer>();
		int lineno = Integer.parseInt(maxLocation.get("Xlocation")) ;
		
		dataMap.put("projectId", projectId);
		for(int i = 1 ; i < lineno+1; i++) {
			dataMap.put("lineNo", i);
			lineMap.put(i, dao.selassetLineMaxYprojectId(dataMap)) ;
		}		
		return lineMap;
	}
}
