package lips.admin.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		return adminDao.selUserInfo(paging);
	}

	@Override
	public List<ProjectDto> getProList(Paging paging) {
		return adminDao.selProInfo(paging);
	}

	@Override
	public User getUserInfo(User user) {
		return adminDao.selUserByUid(user);
	}

	@Override
	public ProjectDto getProInfo(ProjectDto project) {
		
		return null;
	}

	@Override
	public int getNumOfPCreater(User user) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<Integer> getNumOfUser() {
		List<Integer> list = new ArrayList<Integer>();
		
		list.add(0, adminDao.selUTotalCnt());
		list.add(1, adminDao.selNewUCnt());
		list.add(2, adminDao.selClosedUCnt());
		list.add(3, adminDao.selPCreaterCnt());
		
		return list;
	}

	@Override
	public List<Integer> getNumOfPro() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getUTotalCount() {
		return adminDao.selUTotalCnt();
	}

	@Override
	public int getPTotalCount() {
		return adminDao.selPTotalCnt();
	}
	

}
	
	
