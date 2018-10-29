package lips.issue.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import lips.issue.dao.IssueDao;
import lips.issue.dto.CategoryAssetDto;
import lips.issue.dto.IssueDto;
import lips.issue.dto.IssueStagePresetDto;
import lips.issue.dto.StageAssetDto;
import lips.project.dao.ProjectDao;
import lips.project.dto.ProjectDto;
import lips.userinfo.dao.UserDao;
import lips.userinfo.dto.User;
import lips.userinfo.dto.UserByToken;

@Service
public class IssueService {

	private static final Logger logger = LoggerFactory.getLogger(IssueService.class);
	
	@Autowired IssueDao issueDao;
	@Autowired ProjectDao projectDao;
	@Autowired UserDao userDao;
	
	public ModelAndView setIssueMain(User user) {
		
//		logger.info(user.toString());
		ModelAndView mav = new ModelAndView();
		
		IssueDto issueDeadline = issueDao.selIssueByDealine(user);
		IssueDto issueMostFollowed = issueDao.selIssueByFollower(user);
		
		mav.addObject("issueCloseDeadline", issueDeadline);
		mav.addObject("watcherCloseDeadline", issueDao.selIssueWatcherCount(issueDeadline));
		mav.addObject("commentCloseDeadline", issueDao.selIssueCommentCount(issueDeadline));
		
		mav.addObject("issueMostFollowed", issueMostFollowed);
		mav.addObject("watcherMostFollowed", issueDao.selIssueWatcherCount(issueMostFollowed));
		mav.addObject("commentMostFollowed", issueDao.selIssueWatcherCount(issueMostFollowed));
		
		mav.addObject("issueAssigned", issueDao.selIssueByAssignee(user));
		mav.addObject("issueFollowing", issueDao.selIssueByFollowing(user));
		
		mav.setViewName("issue/main");
		
		return mav;
	}

	public ModelAndView setIssueCreate(ProjectDto projectDto) {
		ModelAndView mav = new ModelAndView();
		User user = new UserByToken().getInstance();
		logger.info(projectDto.toString());
		if(projectDto.getProjectId()>0) {			
			mav.addObject("category", issueDao.selCatByProjId(projectDto));
		}
		
		// 1.Issue_stage_preset 리스트 가져오기
		List<IssueStagePresetDto> ispDtos =  issueDao.selIssueStagePreset();
		
		// 2.리스트의 첫번째 (default) preset 가져오기
		IssueStagePresetDto defaultISP = ispDtos.get(0);
		List<StageAssetDto> defaultAssets = issueDao.selStageAssetByPresetId(defaultISP);
		
		mav.addObject("projList", projectDao.selPro(user));
		mav.addObject("issueStagePreset", ispDtos);
		mav.addObject("defaultAssets", defaultAssets);
		mav.setViewName("issue/create");
		
		return mav;
	}

	public ModelAndView setIssueCreate() {
		ModelAndView mav = new ModelAndView();
		User user = new UserByToken().getInstance();
		
		// 1.Issue_stage_preset 리스트 가져오기
		List<IssueStagePresetDto> ispDtos =  issueDao.selIssueStagePreset();
		
		// 2.리스트의 첫번째 (default) preset 가져오기
		IssueStagePresetDto defaultISP = ispDtos.get(0);
		List<StageAssetDto> defaultAssets = issueDao.selStageAssetByPresetId(defaultISP);
		
		mav.addObject("projList", projectDao.selPro(user));
		mav.addObject("issueStagePreset", ispDtos);
		mav.addObject("defaultAssets", defaultAssets);
		mav.setViewName("issue/create");
		
		return mav;
	}

	public ArrayList<User> getMemberList(String name, ProjectDto projectDto) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("projectId", ((Integer)projectDto.getProjectId()).toString());
		ArrayList<User> users = (ArrayList<User>)issueDao.selUserByName(map);
		
		return users;
	}
	
	public ModelAndView getCategory(ProjectDto projectDto) {
		ModelAndView mav = new ModelAndView();
		
		List<CategoryAssetDto> cat = issueDao.selCatByProjId(projectDto);
		mav.setViewName("jsonView");
		mav.addObject("category", cat);
		
		return mav;
	}
	
	public List<StageAssetDto> getStageAssets(IssueStagePresetDto ispDto){
		
		return issueDao.selStageAssetByPresetId(ispDto);
	}
	
	public void setNewIssue(IssueDto issueDto) {
		User user = new UserByToken().getInstance();
		issueDto.setCreateUser(user.getUserId());
		logger.info(issueDto.toString());
		issueDao.inIssue(issueDto);
	}
	
	public ModelAndView getIssueList(String listType, ProjectDto projectDto, User issueOwner) {
		
		List<IssueDto> issues = new ArrayList<>();
		ModelAndView mav = new ModelAndView();
		
		// if issue Owner is not defined, set it as current user.
		if(issueOwner == null) {
			issueOwner = new UserByToken().getInstance();
		}
		
		switch(listType) {
		case "FollowingIssue": 
			issues = issueDao.selIssueByFollowing(issueOwner);
			break;
		case "AssignedIssue":
			issues = issueDao.selIssueByAssignee(issueOwner);
			break;
		case "ProjectIssue":
			if(projectDto != null) {
				issues = issueDao.selIssueByProject(projectDto);				
			}
			break;			
		default :  // default - Assigned Issue for issue owner.
			listType = "Default";
			issues = issueDao.selIssueByAssignee(issueOwner);
			break;
		}
		
		if(!issues.isEmpty()) {
			mav.addObject("listType", listType);
			mav.addObject("issues", issues);
			mav.addObject("stageAsset", issueDao.selStageAsset());
			mav.setViewName("issue/issueList");
		} else {
			// there is no issue redirect to issue Error page.
			List<String> list = new ArrayList<>();
			list.add("에러가 발생했습니다. 다음 이유 때문에 발생했을 가능성이 있습니다. 관리자에게 문의하세요.");
			list.add("project 정보가 정상적으로 요청되지 않았습니다.");
			list.add("이슈가 한건도 없습니다. ");
			mav.addObject("errorBody", list);
			mav.addObject("errorTitle", "잘못된 요청입니다.");
			mav.setViewName("error");
		}
		
		return mav;
	}
}
