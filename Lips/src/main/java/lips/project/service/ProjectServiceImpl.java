package lips.project.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lips.project.dao.ProjectDao;
import lips.project.dto.ProjectDto;
import lips.userinfo.dto.User;

@Service
public class ProjectServiceImpl implements ProjectService {
@Autowired ProjectDao dao;
String invitecode;
	@Override
	public List selPro(User user) {
		
		return dao.selPro(user);
	}

	@Override
	public String inPro(ProjectDto dto,User user) {
		
		
		//프로젝트테이블 인서트
		dao.inPro(dto);

		
		
		Map map = new HashMap();
		map.put("projectId", dto.getProjectId());
		map.put("user", user);
		
		//프로젝트 참여멤버 테이블 인서트
		dao.inProMember(map);
		
		//프로젝트 카테고리 테이블 인서트
		dao.inProct(dto);
		
		
		//프로젝트 초대코드 인서트
		invitecode = UUID.randomUUID().toString().split("-")[4]+"_"+dto.getProjectKey();
		Map map2 = new HashMap();
		map2.put("projectId", dto.getProjectId());
		map2.put("invitecode", invitecode);
		dao.inProic(map2);
	
		return invitecode;
		
		
		
	}
	



	@Override
	public int upPro(ProjectDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delPro(ProjectDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
	@Override
	public List selProMember(ProjectDto dto) {
		
		return dao.selProMember(dto);
	}

	@Override
	public int joinPro(ProjectDto dto, User user) {
		
		List list = dao.selProbyinvite(dto);

		
		//인바이트 코드로  프로젝트 검색 있는지 없는지 확인
		if(list.isEmpty()){
			// 빈 리스트이면(초대코드가 잘못된)
			return 1;
		} else if(!list.isEmpty()) {
			//비어있찌 않으면
			//이미 가입하였는지 확인
			//
			// 초대코드가 있고 24시간이 만료하지 않았는지 확인
			//
			return 2;
				
			}
			
			
		
		return 3;
		
				
			
			
	}

		
		
//		Map map = new HashMap();
//		map.put("projectId", dto.getProjectId());
//		map.put("user", user);
		
		//프로젝트 참여멤버 테이블 인서트
//		dao.inProMember(map);
		
		//성공하면 1
		//실패하면 2
		//이미 가입했으면 3
		
		


	



	
}
