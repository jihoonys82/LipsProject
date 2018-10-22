package lips.admin.dao;

import java.util.List;

import lips.admin.dto.NoticeDto;
import lips.admin.util.Paging;
import lips.project.dto.ProjectDto;
import lips.userinfo.dto.User;

public interface AdminDao {
	
	/**
	 *  공지사항 정보 DB에 저장
	 * @param notice
	 * 
	 */
	public void inNotice(NoticeDto notice);
	
	/**
	 *   유저의 block 여부 설정 
	 * @param user
	 * @return 
	 */
	public void upUserAccClose(User user);
	
	public void upUserAccReopen(User user);
	
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
	
	public ProjectDto selProByUid(User user);

	
}
