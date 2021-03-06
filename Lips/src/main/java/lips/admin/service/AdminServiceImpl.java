package lips.admin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lips.admin.dao.AdminDao;
import lips.admin.dto.NoticeDto;
import lips.issue.dto.CategoryAssetDto;
import lips.project.dto.ProjectDto;
import lips.userinfo.dto.User;
import lips.utils.Paging;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired AdminDao adminDao;
	
	@Override
	public void createCategoryAsset(CategoryAssetDto category) {
		adminDao.inPCate(category);
	}
	
	@Override
	public List<CategoryAssetDto> getPCate() {
		return adminDao.selPCate();
	}

	@Override
	public List<Integer> getTotalUChart() {
		return adminDao.selTotalUChart();
	}
	
	@Override
	public List<Integer> getTotalPChart() {
		return adminDao.selTotalPChart();
	}
	
	@Override
	public List<Integer> getOverduePByMonth() {
		return adminDao.selOverduePByMonth();
	}
	
	@Override
	public List<Integer> getClosedPByMonth() {
		return adminDao.selClosedPByMonth();
	}
	
	@Override
	public ArrayList<HashMap<String, String>> getNewPByMonth() {
		return adminDao.selNewPByMonth();
	}

	@Override
	public ArrayList<HashMap<String,String>> getNewUByMonth() {
		return adminDao.selNewUByMonth();
	}
	
	@Override
	public List<NoticeDto> getNinfo() {
		return adminDao.selNInfo();
	}
	
	@Override
	public List<Integer> getPPieChart(){
		return adminDao.selPPieChart();
	}
	
	@Override
	public List<Integer> getUPieChart(){
		return adminDao.selUPieChart();
	}

	@Override
	public List<Integer> getClosedUChart() {
		return adminDao.selClosedUChart();
	}
	
	@Override
	public void oneLineNotice(String content) {
		adminDao.inOneLineNotice(content);
	}
	
	@Override
	public void timeLineNotice(NoticeDto notice) {
		adminDao.inTimeLineNotice(notice);
	}
	
	@Override
	public NoticeDto getOneLineNotice() {
		return adminDao.selOneLineHeader();
	}
	
	@Override
	public void upOneLineHeader() {
		adminDao.upOneLineHeader();
	}
	@Override
	public void timeLineDelete(int noticeId) {
		adminDao.upTimeLineDelete(noticeId);
	}

	
	@Override
	public List<NoticeDto> getMoreOneLineN() {
		return adminDao.selMoreOneLineN();
	}
	
	@Override
	public void noticeToStop(NoticeDto notice) {
		adminDao.inNoticeToStop(notice);
	}

	@Override
	public void noticeToLeader(NoticeDto notice) {
		adminDao.inNoticeToLeader(notice);
	}
	
	@Override
	public void closeAccount(User user) {
		adminDao.upUserAccClose(user);
	}

	@Override
	public void reopenAccount(User user) {
		adminDao.upUserAccReopen(user);
	}

	@Override
	public void stopProject(ProjectDto project) {
		adminDao.upProStop(project);
	}

	@Override
	public void restartProject(ProjectDto project) {
		adminDao.upProRestart(project);
	}

	@Override
	public void finishProject(ProjectDto project) {
		adminDao.upProFinish(project);
		adminDao.upPCloseDate(project);
	}	

	@Override
	public List<List<? extends Object>> getUserList(Paging paging) {
		List<List<? extends Object>> list = new ArrayList<>();
		List<User> userList = adminDao.selUserInfo(paging);
		List<Boolean> userIsLeaderList = new ArrayList<Boolean>();
		java.util.Iterator<User> itr = userList.iterator();
		while(itr.hasNext()) {
			if(adminDao.selIsLeader(itr.next())!=0) {
				//리더임
				userIsLeaderList.add(true);
			}else {
				//리더아님
				userIsLeaderList.add(false);
			}
		}
		list.add(userList);
		list.add(userIsLeaderList);
		
		return list;
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
		return adminDao.selProByPid(project);
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
		List<Integer> list = new ArrayList<Integer>();
		
		list.add(0, adminDao.selPTotalCnt());
		list.add(1, adminDao.selNewPCnt());
		list.add(2, adminDao.selOpenPCnt());
		list.add(3, adminDao.selClosePCnt());
		
		return list;
	}

	@Override
	public int getUTotalCount() {
		return adminDao.selUTotalCnt();
	}

	@Override
	public int getPTotalCount() {
		return adminDao.selPTotalCnt();
	}

	@Override
	public ProjectDto getProByUid(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Integer> getNumOfPInfo(ProjectDto project) {
		List<Integer> list = new ArrayList<Integer>();
		
		list.add(0, adminDao.selUCntOnP(project));
		list.add(1, adminDao.selIssCntOnP(project));
		
		return list;
	}

	@Override
	public List<ProjectDto> getUOnP(ProjectDto project) {
		return adminDao.selUOnP(project);
	}

	@Override
	public HashMap<String,String> getElapsedTime(ProjectDto project) {
		return adminDao.selElapsedTime(project);
	}

	@Override
	public List<Integer> getNumOfDash() {
		
		List<Integer> list = new ArrayList<Integer>();
		
		list.add(0, adminDao.selUCntOnOpenP());
		list.add(1, adminDao.selOpenPCnt());
		list.add(2, adminDao.selUTotalCnt());
		
		return list;
	}

}
	
	
