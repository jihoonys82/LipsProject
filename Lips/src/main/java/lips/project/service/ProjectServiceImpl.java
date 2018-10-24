package lips.project.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lips.project.dao.ProjectDao;
import lips.project.dto.ProjectDto;
import lips.project.dto.ProjectinvitecodeDto;
import lips.userinfo.dto.User;

@Service
public class ProjectServiceImpl implements ProjectService {
@Autowired ProjectDao dao;
String invitecode;
	@Override
	public List selPro(User user) {
		
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
	public int delPro(ProjectDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
	@Override
	public List selProMember(ProjectDto dto) {
		
		return dao.selProMember(dto);
	}

	@Override
	public int joinPro(ProjectDto dto, User user) {
		List list = dao.selProbyinvite(dto);
		//인바이트 코드로  프로젝트 검색 있는지 없는지 확인
		if(list.isEmpty()){
			// 빈 리스트이면(초대코드가 잘못된)
//			System.out.println("존재하지 않는 초대코드 입니다"+list.toString());
			return 1;
		} else 
			if(!list.isEmpty())
			{
//			System.out.println("존재하는 코드입니다"+list.toString());
			//이미 가입하였는지 확인
			Map map = new HashMap();
			map.put("invitecode", dto.getInvitecode());
			map.put("userid", user.getUserId());
			ProjectinvitecodeDto checkDto = new ProjectinvitecodeDto();
			checkDto = dao.invitecheck(map);
//			System.out.println("체크시작한다");
			if(checkDto!=null) {
				
//				System.out.println("가입한 상태");
				return 2;
			} else if(checkDto==null) {
//				System.out.println("가입하지 않은 상태");
				//24시간 검증
				ProjectinvitecodeDto check24Dto = dao.inviteTimecheck(dto);
//				System.out.println("24시간 검증");
				
				
				long expDate = check24Dto.getExpiryDate().getTime();
				long curDate = new Date().getTime();
//				System.out.println(curDate);
//				System.out.println(expDate);
				
				if(expDate<curDate) {
//					System.out.println("24시간이 지남");
					return 3;
				} else if (expDate>curDate) {
					
					
					Map map3 = new HashMap();
					map3.put("projectId", check24Dto.getProjectId());
					map3.put("user", user);
					
					dao.inProMember(map3);
					
					
					
					return 4;
				}
				
			}

				
			}
		return 0;
			

			
	}

	@Override
	public ProjectDto updatepage(String ProjectId) {
		

		return 	dao.selProbyProId(ProjectId);
	}

		



	



	
}
