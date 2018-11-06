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
		map.put("ProjectCount", pdao.selPro(user).size());
		map.put("IssueCount", idao.selIssueByAssignee(user).size());
		map.put("Notice",adao.selNInfo());
//		noticeCategory = 1 한줄공지 2 = 타임라인 
		map.put("OpenProjectList", dao.selProIfOpen());
		map.put("board","보드가아직 없지롱");
		

		
		return map;
	}
	
	
}
