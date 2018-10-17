package lips.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lips.project.dto.ProjectDto;
import lips.userinfo.dto.User;

public interface ProjectDao {
	public List selPro(User user);
	public int inPro(ProjectDto dto); 
	public void inProMember(Map map);
	public int upPro(ProjectDto dto);
	public int delPro(ProjectDto dto);
}
