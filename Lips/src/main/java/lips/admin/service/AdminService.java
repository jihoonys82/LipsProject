package lips.admin.service;

import java.util.List;

import org.springframework.ui.Model;

import lips.admin.dto.NoticeDto;
import lips.admin.util.Paging;
import lips.project.dto.ProjectDto;
import lips.userinfo.dto.User;

public interface AdminService {
	
	public void notice(NoticeDto notice);
	
	public List<User> closeAccount(User user);
	
	public List<User> reopenAccount(User user);

	public List<ProjectDto> stopProject(ProjectDto project);
	
	public List<ProjectDto> deleteProject(ProjectDto project);
	
	public List<ProjectDto> restartProject(ProjectDto project);
	
	public List<User> getUserList(Paging paging);
	
	public List<ProjectDto> getproList(ProjectDto project);
	
	public User getUserInfo(User user);
	
	public ProjectDto getProInfo(ProjectDto project);

	public List<Integer> getNumofUser();
		//	public int getNumOfTotalUser(User user);	
		//	public int getNumOfNewUser(User user);
		//	public int getNumOfClosedAccount(User user);
	public int getNumOfPCreater(User user);
	
	public List<Integer> getNumOfPro();
		//	public int getNumOfTotalPro(ProjectDto project);
		//	public int getNumOfNewProject(ProjectDto project);
		//	public int getNumOfCompletedProject(ProjectDto project);
		//	public int getNumOfStoppedProject(ProjectDto project);
	
	public int selUTotalCount();


}
