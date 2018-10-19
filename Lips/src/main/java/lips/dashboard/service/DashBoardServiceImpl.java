package lips.dashboard.service;

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
	public Integer maxLocation(DashBoardDto dto) {
		
		
		return dao.selAssetMaxXDto(dto);
	}

	@Override
	public JSONObject lineLocation(DashBoardDto dto , int maxX) {
		Map<String, Integer> dataMap = new HashMap<String, Integer>();
		Map<Integer,List<Integer>> lineMap = new HashMap<Integer, List<Integer>>();
		JSONObject jsonOb = new JSONObject();
		
		dataMap.put("dashBoardId", dto.getDashboardId());
		for(int i = 1; i < maxX+1; i++) {
			dataMap.put("lineNo", i);
//			System.out.println("dataMap : " +dataMap);
			
			lineMap.put(i, dao.selassetLineDashBoardId(dataMap) ) ;
		}
//		System.out.println("lineMap : " + lineMap);
		jsonOb.putAll(lineMap);
		
		return jsonOb;
	}

	@Override
	public JSONObject lineMaxLocation(DashBoardDto dto, int MaxX) {
		Map<String, Integer> dataMap = new HashMap<String, Integer>();
		Map<Integer,Integer> lineMap = new HashMap<Integer, Integer>();
		JSONObject jsonOb = new JSONObject();
		
		dataMap.put("dashBoardId", dto.getDashboardId());
		for(int i = 1; i < MaxX+1; i++) {
			dataMap.put("lineNo", i);
//			System.out.println("dataMap : " +dataMap);
			
			lineMap.put(i, dao.selassetLineMaxDashBoardId(dataMap) ) ;
		}
//		System.out.println("lineMap : " + lineMap);
		
		jsonOb.putAll(lineMap);
		
		return jsonOb;
	}
}
