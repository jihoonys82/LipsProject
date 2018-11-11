package lips.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import lips.admin.dto.IndexDto;
import lips.admin.dto.NoticeDto;
import lips.project.dto.ProjectDto;
import lips.userinfo.dto.User;
import lips.utils.Paging;

public interface AdminDao {
	
	/**
	 *  종료일자가 지난 프로젝트 select 
	 * @return
	 */
	public ArrayList<HashMap<String,String>> selOverduePByMonth();
	/**
	 *  월별로 클로즈된 프로젝트 select 
	 * @return
	 */
	public ArrayList<HashMap<String,String>> selClosedPByMonth();
	
	/**
	 *  월별로 신규 프로젝트 select
	 * @return
	 */
	public ArrayList<HashMap<String,String>> selNewPByMonth();
	
	/**
	 *  월별로 신규 가입자 select
	 */
	public ArrayList<HashMap<String,String>> selNewUByMonth();
	
	/**
	 * 	공지사항 정보 가져오기 
	 * @return NoticeDto
	 */
	public List<NoticeDto> selNInfo();
	
	/**
	 *  공지사항 정보 DB에 저장
	 * @param notice
	 * 
	 */
	public void inNotice(NoticeDto notice);
	
	/**
	 * 	1 : 한 줄 공지 DB에 저장
	 * @param content
	 */
	public void inOneLineNotice(String content);
	
	public void inTimeLineNotice(NoticeDto notice);
	
	/**
	 * 	2 : 프로젝트 리더에게 공지 
	 * @param notice
	 */
	public void inNoticeToLeader(NoticeDto notice);
	
	/**
	 *  3 : 프로젝트 정지 사유 공지 
	 * @param notice
	 */
	public void inNoticeToStop(NoticeDto notice);
	
	/**
	 *   최신 한줄공지 select 
	 * @return
	 */
	public NoticeDto selOneLineHeader();

	/**
	 *  한줄공지 카테고리 4(삭제된 공지)로 업데이트
	 */
	public void upOneLineHeader();
	
	/**
	 *  한줄 공지 더 보기 (삭제 공지 포함)
	 * @return
	 */
	public List<NoticeDto> selMoreOneLineN();
	
	/**
	 *   유저의 block 여부 설정 - 강등 
	 * @param user
	 * @return 
	 */
	public void upUserAccClose(User user);
	
	/**
	 * 	유저의 block 여부 설정 - 강등 취소
	 * @param user
	 */
	public void upUserAccReopen(User user);
	
	/**
	 *  프로젝트 정지
	 * @param project
	 */
	public void upProStop(ProjectDto project);
	
	/**
	 * 	프로젝트 재개
	 * @param project
	 */
	public void upProRestart(ProjectDto project);
	
	/**
	 *  프로젝트 종료
	 * @param project
	 */
	public void upProFinish(ProjectDto project);
	
	/**
	 *  프로젝트 closeDate 업데이트
	 * @param project
	 */
	public void upPCloseDate(ProjectDto project);
	
	/**
	 *   프로젝트의 closeDate, status 변경
	 * @param project 
	 * @return List<User>
	 */
	public List<ProjectDto> upPro(ProjectDto project);
	
	/**
	 *   유저 리스트 정보 불러오기 
	 * @param user
	 * @return List<User>
	 */
	public List<User> selUserInfo(Paging paging);
	
	/**
	 * 	 유저가 리더인지 확인
	 * @param user
	 * @return
	 */
	public int selIsLeader(User user);

	/**
	 *   프로젝트 리스트 정보 불러오기
	 * @param project
	 * @return List<ProjectDto>
	 */
	public List<ProjectDto> selProInfo(Paging paging);
	
	/**
	 * 	 유저아이디로 유저 정보 불러오기 
	 * @param user
	 * @return User
	 */
	public User selUserByUid(User user);
	
	/**
	 *   프로젝트 아이디로 프로젝트 정보 불러오기 
	 * @param project
	 * @return ProjectDto
	 */
	public ProjectDto selProByPid(ProjectDto project);
	
	/**
	 * 	 프로젝트 카운트 
	 * @param project
	 * @return int
 	 */
	public int selPCnt(ProjectDto project);
	
	/**
	 * 	 유저 카운트
	 * @param user
	 * @return int
	 */
	public int selUCnt(User user);
	
	/**
	 *   유저 상태에 따른 카운트 
	 * @param user
	 * @return int
	 */
	public int selUCntByStatus(User user);

	/**
	 * 	 프로젝트 상태에 따른 카운트
	 * @param project
	 * @return int
	 */
	public int selPCntByStatus(ProjectDto project);
	
	// ---------------------------------------------
	
	/**
	 * 	사용자 total count 
	 * @return int
	 */
	public int selUTotalCnt();
	
	/**
	 *   신규 사용자 count
	 * @return int
	 */
	public int selNewUCnt();
	
	/**
	 *   탈퇴한 사용자
	 *   	(blocked: 0, userLevel: 0)
	 * 			cf) 강퇴 사용자 (blocked: 1, userLevel: 0)
	 * @return int
	 */
	public int selClosedUCnt();
	
	/**
	 *   프로젝트 생성자
	 * @return int 
	 */
	public int selPCreaterCnt();
	
	
	// ---------------------------
	
	/**
	 * 	 프로젝트 total count
	 * @return int
	 */
	public int selPTotalCnt();
	
	/**
	 * 	 새로운 프로젝트 count
	 * @return int
	 */
	public int selNewPCnt();
	
	/**
	 * 	 완료된 프로젝트 count
	 * @return int
	 */
	public int selClosePCnt();
	
	/**
	 * 	진행 중인 프로젝트 count
	 * @return int
	 */
	public int selOpenPCnt();
	
//	public ProjectDto selProByUid(User user);
	
	/**
	 * 	프로젝트에 속해있는 유저 count
	 * @param project
	 * @return
	 */
	public int selUCntOnP(ProjectDto project);

	/**
	 * 	프로젝트에 생성된 이슈 count 
	 * @param project
	 * @return
	 */
	public int selIssCntOnP(ProjectDto project);
	
	/**
	 * 	프로젝트에 참여한 유저 id 가져오기
	 * @param project
	 * @return List<ProjectDto>
	 */
	public List<ProjectDto> selUOnP(ProjectDto project);
	
	/**
	 * 	프로젝트 경과 시간 
	 * @param project
	 * @return hashMap
	 */
	public HashMap<String,String> selElapsedTime(ProjectDto project);
	
	/**
	 * 	 진행중인 프로젝트에 참여 중인 유저 count 
	 * @return int
	 */
	public int selUCntOnOpenP();
	
		//석호것
		public int totalPageIndexPJname(IndexDto dto);
		
		public int totalPageIndexPJkey(IndexDto dto);
		
		public int totalPageIndexPJstatus(IndexDto dto);
		
		public List<ProjectDto> selProInfoIndexPJname(IndexDto dto);
		
		public List<ProjectDto> selProInfoIndexPJkey(IndexDto dto);
		
		public List<ProjectDto> selProInfoIndexPJstatus(IndexDto dto);
		//모두 입력시 검색 끝
		
		public int totalPageIndexPJnameNodate(IndexDto dto);
		
		public int totalPageIndexPJkeyNodate(IndexDto dto);
		
		public int totalPageIndexPJstatusNodate(IndexDto dto);
		
		public List<ProjectDto> selProInfoIndexPJnameNodate(IndexDto dto);
		
		public List<ProjectDto> selProInfoIndexPJkeyNodate(IndexDto dto);
		
		public List<ProjectDto> selProInfoIndexPJstatusNodate(IndexDto dto);
		//date 미 입력시 검색 끝
		
		public int totalPageIndexNoInput(IndexDto dto);
		
		public List<ProjectDto> selProInfoIndexNoInput(IndexDto dto);
		
		public int totalPagePJindexAll(IndexDto dto);
		
		public List<ProjectDto> selProInfoIndexAll(IndexDto dto);
		
		// input 미 입력시 끝
		
		public int totalPageIndexUserByUserid(IndexDto dto);
		
		public int totalPageIndexUserByUsernick(IndexDto dto);
		
		public List<User> seluserinfoIndexUserid(IndexDto dto);
		
		public List<User> seluserinfoIndexUsernick(IndexDto dto);
		
		/////////
		
		public int totalPageIndexUserByDate(IndexDto dto);
		
		public List<User> seluserinfoINdexDate(IndexDto dto);
		
		public int totalPageIndexUserByUseridNodate(IndexDto dto);
		
		public int totalPageIndexUserByUsernickNodate(IndexDto dto);
		
		public List<User> seluserinfoIndexUseridNodate(IndexDto dto);
		
		public List<User> seluserinfoIndexUsernickNodate(IndexDto dto);
		
		public int totalPageIndexUserAll(IndexDto dto);
		
		public List<User> seluserinfoIndexAll(IndexDto dto);
		//user 검색 끝
		
		//석호것 끗
	
}
