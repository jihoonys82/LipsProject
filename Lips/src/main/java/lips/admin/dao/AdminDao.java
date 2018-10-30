package lips.admin.dao;

import java.util.HashMap;
import java.util.List;

import lips.admin.dto.NoticeDto;
import lips.project.dto.ProjectDto;
import lips.userinfo.dto.User;
import lips.utils.Paging;

public interface AdminDao {
	
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
	
	public void inOneLineNotice(String content);
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
	
}
