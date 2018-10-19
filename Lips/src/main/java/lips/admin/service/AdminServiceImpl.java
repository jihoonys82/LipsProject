package lips.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import lips.admin.dao.AdminDao;
import lips.admin.dto.NoticeDto;
import lips.admin.util.Paging;
import lips.project.dto.ProjectDto;
import lips.userinfo.dto.User;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired AdminDao adminDao;

	@Override
	public void notice(NoticeDto notice) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<User> closeAccount(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> reopenAccount(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProjectDto> stopProject(ProjectDto project) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProjectDto> deleteProject(ProjectDto project) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProjectDto> restartProject(ProjectDto project) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> getUserList(Paging paging) {
	
//		int totalPage = selCount();	
//		Paging paging = new Paging(totalPage, curPage);
//
//		model.addAttribute("paging",paging);
	
		return adminDao.selUserInfo(paging);
	}

	@Override
	public List<ProjectDto> getproList(ProjectDto project) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User getUserInfo(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProjectDto getProInfo(ProjectDto project) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getNumOfPCreater(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Integer> getNumofUser() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Integer> getNumOfPro() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selUTotalCount() {
		return adminDao.selUTotalCnt();
	}
	
	

}
	
	
