package lips.main.dao;

import java.util.List;

import lips.userinfo.dto.User;

public interface MainDao {

	/**나에게 할당된 이슈
	 * 
	 * @param user
	 * @return IssueDto
	 */
	public List selAllocateIssue(User user);
	
	
	/**내가 소속된 프로젝트의 총 이슈
	 * 
	 * @param user
	 * @return IssueDto
	 */
	public List selAllMyIssue(User user);
	
	
	
	/** 모~든 이슈 조회
	 * 
	 * @return IssueDto
	 */
	public List selAllIssue();
	
	
	
	
	/** 오픈된 프로젝트 정보
	 * 
	 * @return ProjectDto
	 */
	public List selOpenPro();
	
	
	
	/** 내가 참여하고 있는 프로젝트 가져오기 
	 * 
	 * @param user
	 * @return ProjectDto
	 */
	public List selMyPro(User user);
	
	/**(Lips의 모든 프로젝트 가져옴)
	 * 
	 * @return ProjectDto
	 */
	public List selAllPro();
	
	
	/**
	 * 
	 * 
	 */
	
	public List selProIssueTop();
	
	
	/** 타임라인 공지 가져오기
	 * 
	 * @return NoticeDto list
	 */
	public List selTimelineInfo();
	
}
