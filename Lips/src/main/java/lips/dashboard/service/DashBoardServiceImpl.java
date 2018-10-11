package lips.dashboard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lips.dashboard.dao.DashBoardDao;
import lips.dashboard.dto.DashBoardDto;

@Service
public class DashBoardServiceImpl implements DashBoardService{
	@Autowired DashBoardDao dao ;
	
	@Override
	public DashBoardDto ViewPreset(DashBoardDto dto) {
		DashBoardDto checkdto = dao.viewDash(dto);
		
		if(checkdto ==null) {
			checkdto = dao.viewDashBasic();	
		}
		
		
		
		return checkdto ;
	}
}