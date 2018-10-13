package lips.dashboard.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lips.dashboard.dao.DashBoardDao;
import lips.dashboard.dto.DashBoardAssetDto;
import lips.dashboard.dto.DashBoardDto;



@Service
public class DashBoardServiceImpl implements DashBoardService{
	@Autowired DashBoardDao dao ;
	
	@Override
	public DashBoardDto checkPreset(DashBoardDto dto) {
		DashBoardDto checkdto = dao.seldashboardDashDto(dto);
//		
//		if (checkdto == null) {
////			dashmap의 키값unjoindashBoard 에 dashBoard 미등록시 보여줄 커스터 마이징 툴팁이미지 경로 넣어야함
//			
//			return checkdto;
//		}
	
		return checkdto ;
	}

	@Override
	public List<DashBoardAssetDto> presetData(DashBoardDto dto) {
		List<DashBoardAssetDto> assetData = new ArrayList<DashBoardAssetDto>();
		assetData =  dao.selJoinAssetDto(dto);
	
		return assetData ;
	}
}
