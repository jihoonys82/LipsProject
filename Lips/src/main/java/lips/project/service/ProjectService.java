package lips.project.service;

import java.util.List;

import lips.project.dto.ProjectDto;
import lips.userinfo.dto.User;

public interface ProjectService {

	
	public List selPro(User user);
	public List selProMember(ProjectDto dto);
	public String inPro(ProjectDto dto,User user); 
	public int upPro(ProjectDto dto);
	public int delPro(ProjectDto dto);
	public int joinPro(ProjectDto dto,User user);
}
