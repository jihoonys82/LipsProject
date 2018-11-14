package lips.project.dao;

import java.util.List;
import java.util.Map;

import lips.issue.dto.IssueCategoryDto;
import lips.project.dto.ProjectDto;
import lips.project.dto.ProjectMemberDto;
import lips.project.dto.ProjectinvitecodeDto;
import lips.userinfo.dto.User;

public interface ProjectDao {
	
	/** 카테고리 업데이트
	 * 
	 * @param IssueCategoryDto List
	 */
	
	public void inCate(IssueCategoryDto dto);
	
	/** 카테고리 지우기
	 * 
	 * @param ProjectId
	 */
	public void delCate(int ProjectId);
	
	/** 모든 카테고리 에셋 불러오기
	 * 
	 * @return CategoryAssetDto
	 */
	public List selAllcate();
	

	/** 프로젝트 카테고리 조회
	 * 
	 * @param Projectdto
	 */
	public List selIssueCateAs(ProjectDto dto);
	
	
	/** 리더 위임
	 * 
	 * @param ProjectDto 
	 */
	
	public void upProLeader(ProjectDto dto);
	
	/**
	 * 
	 * @param map(projectId & invitecode)
	 */
	
	public void upProinvite(Map map); 
	
	
	
	/** ProjectDto(ProjectId)를 바탕으로 ProjectinvitecodeDto 출력
	 * 
	 * @param ProjectDto
	 * @return ProjectinvitecodeDto
	 */
	public ProjectinvitecodeDto selInvitebyProid(ProjectDto dto); 
	/**프로젝트 업데이트
	 * 
	 * @param Projectdto
	 * @return ProjectDto
	 */
	public void upPro(ProjectDto dto);
	
	/** 프로젝트 멤버 레벨 변경(pardon= level = 1)
	 * 
	 * @param ProjectMemberDto
	 * @return ProjectMemberDto
	 */ 
	public void upPromemberLevelUp(ProjectMemberDto dto); 
	
	
	/** 프로젝트 멤버 레벨 변경(밴 = level = 0)
	 * 
	 * @param ProjectMemberDto
	 * @return ProjectMemberDto
	 */ 
	public void upPromemberLevelDown(ProjectMemberDto dto); 
	
	
	/** 프로젝트 재가입용
	 * @param map(ProjetId,UserId) 
	 */
	public void upPromember(Map map);
	
	
	//프로젝트 아이디(ProjectDto)를 바탕으로 프로젝트에 참가하고 있는 멤버를 조회 
	/**
	 * 
	 * @param ProjectDto
	 * @return ProjectMemeberDto
	 */
	public List selProOnlyMember(ProjectDto dto);
	
	
	//초대코드를 이용하여  project_invitation테이블의을 조회,  expirydate 을 가져옴
	public ProjectinvitecodeDto inviteTimecheck(ProjectDto dto);
	
	//초대코드를 이용해 조인할 때 유저객체를 바탕으로 가입했는지 확인 가입했으면 1 가입하지 않았으면 0 리턴
	public ProjectinvitecodeDto invitecheck(Map map);
	
	//초대코드를 바탕으로 프로젝트 리스트 출력
	public List selProbyinvite(ProjectDto dto);

	//프로젝트 아이디 를 바탕으로 프로젝트 정보 가져오기
	public ProjectDto selProbyProId(String projectId);
	
	 //유저객체를 바탕으로 해당 유저가 소속된 프로젝트 리스트를 가져옴 
	/**
	 * 
	 * @param user
	 * @return ProjectDto
	 */
	public List selPro(User user);
	
	// 프로젝트 인서트
	public int inPro(ProjectDto dto); 
	
	// 프로젝트 멤버 인서트( 프로젝트 인서트와 함께 실행됨)
	public void inProMember(Map map);

	// 프로젝트 카레고리 인서트(프로젝트 인서트와 함께 실행됨)
	public void inProct(ProjectDto dto);
	
	// 프로젝트 인바이트코드 인서트(프로젝트 인서트와 함께 실행)
	public void inProic(Map map);
	
	// 프로젝트에 소속된 유저 조회
	public List selProMember(ProjectDto dto);
	
	
	public void UpProStatus(ProjectDto dto);
}
