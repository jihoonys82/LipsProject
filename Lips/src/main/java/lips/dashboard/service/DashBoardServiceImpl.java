package lips.dashboard.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lips.card.dto.CardDto;
import lips.dashboard.dao.DashBoardDao;
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
//			
//			return checkdto;
//		}
	
		return dto ;
	}
	@Override
	public Integer maxXLocation(DashBoardDto dto) {
		
		return dao.selAssetMaxXDto(dto);
	}
	
	@Override
	public List<CardDto> AllCardList() {
	
		return dao.selAllCardList();
	}
	@Override
	public Map<String, String> splitData(String data) {
		
		int length = data.split(",").length;
		
		List<String> splitList = new ArrayList<>();
		Map<String, String> splitMap = new HashMap<>();
		
		System.out.println(splitMap);
		for(int i = 0 ; i<length; i++) {
			splitList.add(data.split(",")[i]);
		}
		for(int j = 0 ; j<length; j++) {
			String startreplace = splitList.get(j).split(":")[0].replace("[{", "");
			String startre = startreplace.replace("\"", "");
			String endreplace = splitList.get(j).split(":")[1].replace("}]", "");
			String endre = endreplace.replace("\"", "");
			splitMap.put(startre, endre) ;
		}
		System.out.println("data :" + data);
		System.out.println("splitList" + splitList);
		System.out.println("splitMap " + splitMap);
		System.out.println("splitMapSelect " + splitMap.get("projectId"));
		return splitMap;
	}


}
