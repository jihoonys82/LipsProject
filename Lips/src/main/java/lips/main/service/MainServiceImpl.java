package lips.main.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lips.admin.dao.AdminDao;
import lips.issue.dao.IssueDao;
import lips.main.dao.MainDao;
import lips.project.dao.ProjectDao;
import lips.userinfo.dto.User;

@Service
public class MainServiceImpl implements MainService {
	@Autowired ProjectDao pdao;
	@Autowired IssueDao idao;
	@Autowired AdminDao adao;
	@Autowired MainDao dao;

	@Override
	public Map mainPage(User user) {
	
		Map map = new HashMap();
		
		//나에게 할당된 이슈
		map.put("AllcoateIssueCnt", dao.selAllocateIssue(user).size());
		
		//소속된 프로젝트의 이슈
		map.put("MyProjectIssueCnt", dao.selAllMyIssue(user).size());
		//모~든 프로젝트의 개수
		map.put("AllProjectCnt", dao.selAllPro().size());
		//오픈된 프로젝트의 개수
		map.put("OpenProjectCnt", dao.selOpenPro().size());
		// 내가 참여한 프로젝트의 개수	
		map.put("MyProjectCount", dao.selMyPro(user).size());
		
		//모~ 든 이슈 
		map.put("AllIssueCnt", dao.selAllIssue().size());
		
		
		map.put("IssueCount", idao.selIssueByAssignee(user).size());
		map.put("Notice",dao. selTimelineInfo()); 
		map.put("OpenProjectList", dao.selProIfOpen());
		map.put("board","보드가아직 없지롱");
		
		//안나옴 20181107 모영호 여기까지함 
		System.out.println("나오니"+dao.selProIfOpen().toString());
		
		return map;
	}
	
	
}
