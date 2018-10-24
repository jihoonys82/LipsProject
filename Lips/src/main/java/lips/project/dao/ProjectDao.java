package lips.project.dao;

import java.util.List;
import java.util.Map;

import lips.project.dto.ProjectDto;
import lips.project.dto.ProjectinvitecodeDto;
import lips.userinfo.dto.User;

public interface ProjectDao {
	
	//초대코드를 이용하여  project_invitation테이블의을 조회,  expirydate 을 가져옴
	public ProjectinvitecodeDto inviteTimecheck(ProjectDto dto);
	
	//초대코드를 이용해 조인할 때 유저객체를 바탕으로 가입했는지 확인 가입했으면 1 가입하지 않았으면 0 리턴
	public ProjectinvitecodeDto invitecheck(Map map);
	
	//초대코드를 바탕으로 프로젝트 리스트 출력
	public List selProbyinvite(ProjectDto dto);

	//프로젝트 아이디 를 바탕으로 프로젝트 정보 가져오기
	public ProjectDto selProbyProId(String projectId);
	
	 //유저객체를 바탕으로 해당 유저가 소속된 프로젝트 리스트를 가져옴 
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
	
	
	public int upPro(ProjectDto dto);
	
	
	public int delPro(ProjectDto dto);
}
