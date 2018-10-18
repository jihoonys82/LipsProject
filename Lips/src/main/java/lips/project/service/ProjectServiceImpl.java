package lips.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lips.project.dao.ProjectDao;
import lips.project.dto.ProjectDto;
import lips.userinfo.dto.User;

@Service
public class ProjectServiceImpl implements ProjectService {
@Autowired ProjectDao dao;
	
	@Override
	public List selPro(User user) {
		
		return dao.selPro(user);
	}

	@Override
	public int inPro(ProjectDto dto,User user) {
		
		
		//프로젝트테이블 인서트
		dao.inPro(dto);
//		System.out.println("projectId : "+dto.getProjectId());
		
		Map map = new HashMap();
		map.put("projectId", dto.getProjectId());
		map.put("user", user);
		
		//프로젝트 참여멤버 테이블 인서트
		dao.inProMember(map);
		
		//프로젝트 카테고리 테이블 인서트
		dao.inProct(dto);
		return 0;
		
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

	
}
