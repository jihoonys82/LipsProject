package lips.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lips.project.dao.ProjectDao;
import lips.project.dto.ProjectDto;

@Service
public class ProjectServiceImpl implements ProjectService {
@Autowired ProjectDao dao;
	
	@Override
	public List selPro(ProjectDto dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean inPro(ProjectDto dto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean upPro(ProjectDto dto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delPro(ProjectDto dto) {
		// TODO Auto-generated method stub
		return false;
	}

	
}
