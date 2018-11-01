package lips.project.service;

import java.util.List;
import java.util.Map;

import lips.project.dto.ProjectDto;
import lips.project.dto.ProjectMemberDto;
import lips.userinfo.dto.User;


public interface ProjectService {

	public ProjectMemberDto UpdateProjectMemberBan(ProjectMemberDto dto);
	public ProjectMemberDto UpdateProjectMemberPardon(ProjectMemberDto dto);
	public List ProjectMain(User user);
	public List selProMember(ProjectDto dto);
	public String inPro(ProjectDto dto,User user); 
	public int upPro(ProjectDto dto);
	public void delPro(ProjectDto dto);
	public int joinPro(ProjectDto dto,User user);
	public Map updatepage(ProjectDto dto,User user);
	public ProjectDto projectUpdate(ProjectDto dto,String invitecode);
	public void leaderAuthorize(ProjectDto dto);

}
