package lips.dashboard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	


}
