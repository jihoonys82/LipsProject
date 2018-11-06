package lips.issue.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import lips.issue.dao.IssueDao;
import lips.issue.dto.CategoryAssetDto;
import lips.issue.dto.IssueCategoryDto;
import lips.issue.dto.IssueCommentDto;
import lips.issue.dto.IssueDto;
import lips.issue.dto.IssueStagePresetDto;
import lips.issue.dto.StageAssetDto;
import lips.project.dao.ProjectDao;
import lips.project.dto.ProjectDto;
import lips.userinfo.dao.UserDao;
import lips.userinfo.dto.User;
import lips.userinfo.dto.UserByToken;
import lips.utils.Paging;

@Service
public class IssueService {

	private static final Logger logger = LoggerFactory.getLogger(IssueService.class);
	
	@Autowired IssueDao issueDao;
	@Autowired ProjectDao projectDao;
	@Autowired UserDao userDao;
	
	public ModelAndView setIssueMain(User user) {
		
//		logger.info(user.toString());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("issue/main");
		
		//new user check - not participated in any project. 
		int participated = issueDao.selCountParticipatedByUser(user);
		logger.info("??"+participated);
		if(participated <1) {
			return mav;
		}
		
		IssueDto issueDeadline = issueDao.selIssueByDealine(user);
		IssueDto issueMostFollowed = issueDao.selIssueByFollower(user);
//		logger.info(issueDeadline.toString());
//		logger.info(issueMostFollowed.toString());
		
		if(issueDeadline != null) {
			mav.addObject("issueCloseDeadline", issueDeadline);
			mav.addObject("watcherCloseDeadline", issueDao.selIssueWatcherCount(issueDeadline));
			mav.addObject("commentCloseDeadline", issueDao.selIssueCommentCount(issueDeadline));
		}
		if(issueMostFollowed != null) {
			mav.addObject("issueMostFollowed", issueMostFollowed);
			mav.addObject("watcherMostFollowed", issueDao.selIssueWatcherCount(issueMostFollowed));
			mav.addObject("commentMostFollowed", issueDao.selIssueWatcherCount(issueMostFollowed));			
		}
		
		mav.addObject("issueAssigned", issueDao.selIssueByAssignee(user));
		mav.addObject("issueFollowing", issueDao.selIssueByFollowing(user));
		
		mav.addObject("issueStage", issueDao.selStageAsset());
		
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
	
	public ModelAndView getIssueList(String listType, String projectId, User issueOwner, int curPage) {
		
		List<IssueDto> issues = new ArrayList<>();
		ModelAndView mav = new ModelAndView();
		
		// if issue Owner is not defined, set it as current user.
		if(issueOwner == null) {
			issueOwner = new UserByToken().getInstance();
		}
		int totalCount = 0; 
		Paging paging = new Paging(totalCount); 
		switch(listType) {
		case "FollowingIssue": 
			totalCount = issueDao.selTotalCountByIssueFollowing(issueOwner);
			paging = new Paging(totalCount, curPage);
			Map<String, String> fiMap = new HashMap<>();
			fiMap.put("userId", issueOwner.getUserId());
			fiMap.put("startNo", ((Integer)paging.getStartNo()).toString());
			fiMap.put("endNo", ((Integer)paging.getEndNo()).toString());
			issues = issueDao.selIssueByFollowingPaging(fiMap);
			break;
		case "AssignedIssue":
			totalCount = issueDao.selTotalCountByAssignee(issueOwner);
			paging = new Paging(totalCount, curPage);
			Map<String, String> aMap = new HashMap<>();
			aMap.put("userId", issueOwner.getUserId());
			aMap.put("startNo", ((Integer)paging.getStartNo()).toString());
			aMap.put("endNo", ((Integer)paging.getEndNo()).toString());
			issues = issueDao.selIssueByAssgineePaging(aMap);
			break;
		case "ProjectIssue":
			if(projectId != null) {
				ProjectDto projectDto = new ProjectDto();
				projectDto.setProjectId(Integer.parseInt(projectId));
				
				totalCount = issueDao.selTotalCountByProject(projectDto);
				paging = new Paging(totalCount, curPage);
				Map<String, String> pMap = new HashMap<>();
				pMap.put("projectId", ((Integer)projectDto.getProjectId()).toString());
				pMap.put("startNo", ((Integer)paging.getStartNo()).toString());
				pMap.put("endNo", ((Integer)paging.getEndNo()).toString());
				issues = issueDao.selIssueByProjectPaging(pMap);				
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
			mav.addObject("issueStage", issueDao.selStageAsset());
			mav.addObject("paging", paging);
			mav.setViewName("issue/issueList");
		} else {
			// there is no issue redirect to issue Error page.
			List<String> list = new ArrayList<>();
			list.add("에러가 발생했습니다. 다음 이유 때문에 발생했을 가능성이 있습니다.");
			list.add("project 정보가 정상적으로 요청되지 않았습니다.");
			list.add("이슈가 한건도 없습니다. ");
			mav.addObject("errorBody", list);
			mav.addObject("errorTitle", "잘못된 요청입니다.");
			mav.setViewName("error");
		}
		
		return mav;
	}
	
	/**
	 * get issue detail data
	 * @param isssueDto
	 * @return
	 */
	public ModelAndView getIssue(IssueDto issueDto) {
		ModelAndView mav = new ModelAndView();
		User user = new UserByToken().getInstance();
		
		Map<String, String> map = new HashMap<>(); // for userId and projectId
		map.put("userId", user.getUserId());
		map.put("projectId", ((Integer)issueDto.getProjectId()).toString());
		
		// 1. 유저가 해당 이슈가 포함된 프로젝트 멤버인지 확인 (아니면 에러페이지) 
		if(issueDao.selCountProjectMember(map) <= 0) {
			List<String> list = new ArrayList<>();
			list.add("에러가 발생했습니다. 다음 이유 때문에 발생했을 가능성이 있습니다.");
			list.add("프로젝트에 참여중인 맴버가 아닙니다. 프로젝트 맴버만 조회 가능합니다.");
			list.add("프로젝트 리더가 회원님을 밴 했습니다.");
			mav.addObject("errorBody", list);
			mav.addObject("errorTitle", "잘못된 요청입니다.");
			mav.setViewName("error");
		}
		
		// 2. 이슈 데이터 가져오기
		IssueDto issue = issueDao.selIssueByIssueId(issueDto);
		
		// 3. 스테이지 데이터 가져오기
		IssueStagePresetDto ispDto = new IssueStagePresetDto();
		ispDto.setIssuePresetId(issue.getStagePresetId());
		List<StageAssetDto> issueStages = issueDao.selStageAssetByPresetId(ispDto);
		
		// 4. 팔로워 수, 팔로워 리스트, 팔로잉 유무 가져오기 
		int followerCount = issueDao.selCountIssueFollowingByIssue(issue);
		List<User> follower = issueDao.selFollowerByIssue(issue);
		boolean amIFollowing = false;
		for(User u : follower) {
			if(u.getUserId() == user.getUserId()) amIFollowing = true;
		}
		// 5. 프로젝트 정보 가져오기
		ProjectDto projectDto = projectDao.selProbyProId(((Integer)issue.getProjectId()).toString());
		
		// 6. 이슈 카테고리명 가져오기
		List<CategoryAssetDto> categories = issueDao.selCatByProjId(projectDto);
		String categoryName ="";
		for(CategoryAssetDto catAsset: categories) {
			if(catAsset.getCategoryAssetId() == issue.getCategoryId()) {
				categoryName = catAsset.getAssetName();
			}
		}
		// TODO 7. 첨부파일 가져오기 
		
		// 8. 댓글 가져오기 
		List<IssueCommentDto> comments = issueDao.selCommentByIssue(issue);
		
		// 9. mav에 추가 
		mav.addObject("issue", issue );
		mav.addObject("issueStages", issueStages);
		mav.addObject("followerCount", followerCount);
		mav.addObject("follower", follower);
		mav.addObject("amIFollowing", amIFollowing);
		mav.addObject("projectDto", projectDto);
		
		mav.addObject("comments", comments);
		mav.addObject("catName", categoryName);
		
		mav.setViewName("issue/issueDetail");
		return mav;
	}

	/**
	 * change assignee
	 * @param map : issueId, userId
	 */
	public void changeAssignee(Map<String, String> map) {
		issueDao.upIssueAssignee(map);
	}

	/**
	 * delete issue Comment
	 * @param issueCommentDto
	 */
	public void deleteComment(IssueCommentDto issueCommentDto) {
		issueDao.delComment(issueCommentDto);
	}

	/**
	 * Add issue Comment (and file)
	 * @param issueCommentDto
	 * @return
	 */
	public ModelAndView addComment(IssueCommentDto issueCommentDto) {
		ModelAndView mav = new ModelAndView();
		
		//TODO: file upload 처리 
		
		//ERROR: currval 문제 처리 , 본문내역 입력 안됨. 
		IssueCommentDto icDto = issueDao.inComment(issueCommentDto); 
		
		mav.addObject("comment", icDto);
		mav.setViewName("issue/commentBody");
		
		return mav;
	}
	
}
