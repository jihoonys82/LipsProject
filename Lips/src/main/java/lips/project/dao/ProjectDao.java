package lips.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lips.project.dto.ProjectDto;
import lips.userinfo.dto.User;

public interface ProjectDao {
	
	/**
	 * 유저객체를 바탕으로 해당 유저가 소속된 프로젝트 리스트를 가져옴 
	 */
	public List selPro(User user);
	
	public int inPro(ProjectDto dto); 
	
	public List selProMember(ProjectDto dto);
	
	public void inProMember(Map map);
	
	
	public int upPro(ProjectDto dto);
	
	
	public int delPro(ProjectDto dto);
}
