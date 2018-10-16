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
		
		dao.inPro(dto);
		System.out.println("projectId : "+dto.getProjectId());
		
		Map map = new HashMap();
		map.put("projectId", dto.getProjectId());
		map.put("user", user);
		
		dao.inProMember(map);
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

	
}
