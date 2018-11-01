package lips.dashboard.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lips.card.dto.CardDto;
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
	
		for(int i = 0 ; i<length; i++) {
			splitList.add(data.split(",")[i]);
		}
		for(int j = 0 ; j<length; j++) {
//			System.out.println(splitList);
			String startreplace = splitList.get(j).split(":")[0].replace("[{", "");
			String startre = startreplace.replace("\"", "");
//			System.out.println(splitList.get(j));
			String endreplace = splitList.get(j).split(":")[1].replace("}]", "");
			String endre = endreplace.replace("\"", "");
			splitMap.put(startre, endre) ;
		}

		return splitMap;
	}

	@Override
	public int getDashBoardId(Map<String, String> dataMap) {
		User user = new UserByToken().getInstance();
		String userId = user.getUserId();
		int dashboardId = 0;
		
		if(Integer.parseInt(dataMap.get("dashboardId")) ==0) {
			DashBoardDto dto = new DashBoardDto();
			dto.setProjectId(Integer.parseInt(dataMap.get("projectId")));
			dto.setDashboardName(dataMap.get("dashBoardName"));
			dto.setUserid(userId);
			
			dao.insertDashBoard(dto);
			dto = dao.seldashboardDashDto(dto);
			dashboardId = dto.getDashboardId();
		}else {
			dashboardId = Integer.parseInt(dataMap.get("dashboardId"));
		}
		
		return dashboardId;
	}
	
	@Override
	public void insertData(Map<String, String> dataMap , int dashboardId) {
		DashBoardAssetDto assetDto = new DashBoardAssetDto();
		dataMap.remove("dashboardId");
		dataMap.remove("projectId");
		dataMap.remove("dashBoardName");
		System.out.println(dataMap);
		
		assetDto.setDashboardId(dashboardId);
		dao.deletUserAssetDataBydashId(assetDto);
		
		 for( String key : dataMap.keySet() ){
	            	String cardview = dataMap.get(key);
	            	String x = key.split("x")[0] ; 
	            	String y = key.split("x")[1] ; 
	            	
	            	assetDto.setAssetView(cardview);
	            	assetDto = dao.selectAssetId(assetDto);
	            	
	            	int assetId = assetDto.getAssetId();
	            	
	            	assetDto.setDashboardId(dashboardId);
	            	assetDto.setAssetId(assetId);
	            	assetDto.setPositionX(Integer.parseInt(x));
	            	assetDto.setPositionY(Integer.parseInt(y));
	            	
	            	if(dao.selectUserAssetCount(assetDto)!=0){
	            		dao.updateUserAssetData(assetDto);
	            	}else {
	            		dao.insertUserAssetData(assetDto);
	            	}
	        }
	}
	
	
}
