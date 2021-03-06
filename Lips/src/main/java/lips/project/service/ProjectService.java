package lips.project.service;

import java.util.List;
import java.util.Map;

import lips.issue.dto.IssueCategoryDto;
import lips.project.dto.ProjectDto;
import lips.project.dto.ProjectMemberDto;
import lips.userinfo.dto.User;
import lips.utils.Paging;


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
	public List AllOpenProject(Paging paging);
	public void categoryUp(List<IssueCategoryDto> catelist,int projectId);  
	//ㅅㅎ
	public int totalcnt();
}
