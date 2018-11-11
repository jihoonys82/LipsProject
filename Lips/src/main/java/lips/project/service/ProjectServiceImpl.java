package lips.project.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lips.admin.dao.AdminDao;
import lips.main.dao.MainDao;
import lips.project.dao.ProjectDao;
import lips.project.dto.ProjectDto;
import lips.project.dto.ProjectMemberDto;
import lips.project.dto.ProjectinvitecodeDto;
import lips.userinfo.dto.User;

@Service
public class ProjectServiceImpl implements ProjectService {
@Autowired ProjectDao dao;
@Autowired AdminDao adao;
@Autowired MainDao mdao;

	String invitecode;
	@Override
	public List ProjectMain(User user) {
	
		return dao.selPro(user);
	}


	@Override
	public String inPro(ProjectDto dto,User user) {
		
		
		//프로젝트테이블 인서트
		dao.inPro(dto);

		
		
		Map map = new HashMap();
		map.put("projectId", dto.getProjectId());
		map.put("user", user);
		
		//프로젝트 참여멤버 테이블 인서트
		dao.inProMember(map);
		
		//프로젝트 카테고리 테이블 인서트
		dao.inProct(dto);
		
		
		//프로젝트 초대코드 인서트
		invitecode = UUID.randomUUID().toString().split("-")[4]+"_"+dto.getProjectKey();
		Map map2 = new HashMap();
		map2.put("projectId", dto.getProjectId());
		map2.put("invitecode", invitecode);
		dao.inProic(map2);
	
		return invitecode;
		
		
		
	}
	



	@Override
	public int upPro(ProjectDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void delPro(ProjectDto dto) {
		dao.UpProStatus(dto);
	}

	
	
	@Override
	public List selProMember(ProjectDto dto) {
		
		return dao.selProMember(dto);
	}

	@Override
	public int joinPro(ProjectDto dto, User user) {
		List list = dao.selProbyinvite(dto);
		if(list.isEmpty()){return 1; /**없는 초대 코드 **/}
		else if (!list.isEmpty()) { 
			/**있는 초대 코드  24시간 내 코드인지 확인**/  
			ProjectinvitecodeDto check24Dto = dao.inviteTimecheck(dto);
			long expDate = check24Dto.getExpiryDate().getTime();
			long curDate = new Date().getTime();
			if(expDate<curDate) {
				//System.out.println("24시간이 지남");
				return 2;
			} else if  (expDate>curDate) {
				//자격을 갖추고있는지 확인
				Map map = new HashMap();
				map.put("invitecode", dto.getInvitecode());
				map.put("userid", user.getUserId());
				ProjectinvitecodeDto checkDto = new ProjectinvitecodeDto();
				checkDto = dao.invitecheck(map);
				if(checkDto==null) {
					//가입하지 않은 순수한 상태 가입가능
					Map map3 = new HashMap();
					map3.put("projectId", check24Dto.getProjectId());
					map3.put("user", user);
					
					dao.inProMember(map3);
					return 3;
				} else if(checkDto.getUserLevel()==-1) {
					//자발적으로 나간 상태 상태
					Map map5 = new HashMap();
					map5.put("projectId", checkDto.getProjectId());
					map5.put("user", user);
					System.out.println(checkDto.getProjectId());
					System.out.println(user.getUserId());
					dao.upPromember(map5);
					return 4;
				} else if(checkDto.getUserLevel()==0) {
					return 5;
				} else if (checkDto.getUserLevel()==1) {
					return 6;
			}
			}
		}
		return 0;
		
		

		
	} 

	@Override
	public Map updatepage(ProjectDto dto,User user) {
		
		Map map = new HashMap();
		
		map.put("projectinfo", dao.selProbyProId(String.valueOf(dto.getProjectId())));
		map.put("usercount", adao.selUCntOnP(dto));
		map.put("issuecount", adao.selIssCntOnP(dto));
		map.put("userinfo", user);
		map.put("projectUserinfo", dao.selProOnlyMember(dto));
		map.put("invitecode", dao.selInvitebyProid(dto));
		System.out.println("테스트+++"+adao.selUOnP(dto).toString());
	
		return map;
	}


	@Override
	public ProjectMemberDto UpdateProjectMemberBan(ProjectMemberDto dto) {
		
		System.out.println("이곳은프로젝트서비스임플");
		dao.upPromemberLevelDown(dto);
		return dto;

	}

	@Override
	public ProjectMemberDto UpdateProjectMemberPardon(ProjectMemberDto dto) {
		
		dao.upPromemberLevelUp(dto);
		return dto;

	}


	@Override
	public ProjectDto projectUpdate(ProjectDto dto,String invitecode) {
		//프로젝트 정보 업데이트
		dao.upPro(dto);
		

		Map map = new HashMap();
		map.put("projectId", dto.getProjectId());
		map.put("invitecode", invitecode);
		//초대코드 업데이트
		dao.upProinvite(map);
		return dao.selProbyProId(String.valueOf(dto.getProjectId()));
	}


	@Override
	public void leaderAuthorize(ProjectDto dto) {
		dao.upProLeader(dto);
		
	}


	@Override
	public List AllOpenProject() {

		return mdao.selOpenPro();
	}




		



	



	
}
