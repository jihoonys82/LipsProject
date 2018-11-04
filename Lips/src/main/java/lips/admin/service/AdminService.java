package lips.admin.service;

import java.util.HashMap;
import java.util.List;

import lips.admin.dto.NoticeDto;
import lips.project.dto.ProjectDto;
import lips.userinfo.dto.User;
import lips.utils.Paging;

public interface AdminService {

	// Notice 등록
	
	public List<NoticeDto> getNinfo();
	
	public void oneLineNotice(String content);
	
	public void timeLineNotice(NoticeDto notice); 
	
	public void noticeToStop(NoticeDto notice);
	
	public void noticeToLeader(NoticeDto notice);

	public NoticeDto getOneLineNotice();
	
	public void upOneLineHeader();
	
	public List<NoticeDto> getMoreOneLineN();

	// User 관리
	
	public void closeAccount(User user);
	
	public void reopenAccount(User user);

	public void stopProject(ProjectDto project);
		
	public void restartProject(ProjectDto project);
	
	public void finishProject(ProjectDto project);
	
	public List getUserList(Paging paging);
	
	public List<ProjectDto> getProList(Paging paging);
	
	public User getUserInfo(User user);
	
	public ProjectDto getProInfo(ProjectDto project);

	public List<Integer> getNumOfUser();
		//	public int getNumOfTotalUser(User user);	
		//	public int getNumOfNewUser(User user);
		//	public int getNumOfClosedAccount(User user);
	public int getNumOfPCreater(User user);
	
	public List<Integer> getNumOfPro();
		//	public int getNumOfTotalPro(ProjectDto project);
		//	public int getNumOfNewProject(ProjectDto project);
		//	public int getNumOfCompletedProject(ProjectDto project);
		//	public int getNumOfStoppedProject(ProjectDto project);
	
	public List<Integer> getNumOfPInfo(ProjectDto project);
	
	public List<Integer> getNumOfDash();
	
	public int getUTotalCount();
	
	public int getPTotalCount();
	
	public List<ProjectDto> getUOnP(ProjectDto project);

	public ProjectDto getProByUid(User user);
	
	public HashMap<String,String> getElapsedTime(ProjectDto project);
	
}
