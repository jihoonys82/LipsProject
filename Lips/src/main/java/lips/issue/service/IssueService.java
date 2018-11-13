package lips.issue.service;

import java.text.SimpleDateFormat;
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
import lips.issue.dto.IssueCommentDto;
import lips.issue.dto.IssueDto;
import lips.issue.dto.IssueStagePresetAssetDto;
import lips.issue.dto.IssueStagePresetDto;
import lips.issue.dto.IssueWatcherDto;
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
		
		mav.addObject("issueStage", issueDao.selStageAsset(0)); // default load
		
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
		List<IssueStagePresetDto> ispDtos =  issueDao.selIssueStagePreset(projectDto);
		
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
		
		ProjectDto bulk = new ProjectDto(); //bulk projectId for evade null pointer exception
		bulk.setProjectId(0);
		// 1.Issue_stage_preset 리스트 가져오기
		List<IssueStagePresetDto> ispDtos =  issueDao.selIssueStagePreset(bulk);
		
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
	
	/**
	 * getCategory via AJAX when selected project is changed 
	 * get IssueStage Preset as well. 
	 * @param projectDto
	 * @return
	 */
	public ModelAndView getCategory(ProjectDto projectDto) {
		ModelAndView mav = new ModelAndView();
		
		// 1. get Category
		List<CategoryAssetDto> cat = issueDao.selCatByProjId(projectDto);
		// 2. get Issue_stage_preset list
		List<IssueStagePresetDto> ispDtos =  issueDao.selIssueStagePreset(projectDto);
		
		// 3. get the first(default) preset
		IssueStagePresetDto defaultISP = ispDtos.get(0);
		List<StageAssetDto> defaultAssets = issueDao.selStageAssetByPresetId(defaultISP);
		
		mav.setViewName("jsonView");
		mav.addObject("category", cat);
		mav.addObject("ispDtos", ispDtos);
		mav.addObject("defaultAsset", defaultAssets);
		
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
			mav.addObject("issueStage", issueDao.selStageAsset(Integer.parseInt(projectId)));
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
			if(u.getUserId().equals(user.getUserId())) {
				amIFollowing = true;
			}
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
		
		// if new assingee was issue follower remove from the table.
		IssueWatcherDto iWatcher = new IssueWatcherDto();
		iWatcher.setIssueId(Integer.parseInt(map.get("issueId")));
		iWatcher.setUserId(map.get("userId"));
		
		int cntWatcher = issueDao.selCntIssueWatcher(iWatcher);
		
		if(cntWatcher > 0) {
			issueDao.delWatcherByIssue(iWatcher);
		}
		
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
		 
		int commentId = issueDao.inComment(issueCommentDto); 
		logger.info("test : " + commentId + "");
		IssueCommentDto idDto = new IssueCommentDto();
		idDto.setCommentId(commentId);
		IssueCommentDto icDto = issueDao.selCommentById(idDto);
		System.out.println(icDto);
		mav.addObject("comment", icDto);
		mav.setViewName("issue/commentBody");
		
		return mav;
	}
	public void assetSave(StageAssetDto stageAssetDto) {
		issueDao.inStageAsset(stageAssetDto);
	}
	public void presetSave(IssueStagePresetDto issueStagePresetDto,String[] assetIdList) {
		List<Integer> assetList = new ArrayList<Integer>();
		Map<String,List<Integer>> map = new HashMap<String,List<Integer>>();
		for(int i = 0 ; i<assetIdList.length;i++) {
			assetList.add(Integer.parseInt(assetIdList[i]));
		}
		map.put("assetList", assetList);
		issueDao.inStagePreset(issueStagePresetDto);
		issueDao.inStagePresetAsset(map);
	}
	public void presetModify(IssueStagePresetDto issueStagePresetDto,String[] assetIdList) {
		List<Integer> assetList = new ArrayList<Integer>();
		Map<String,Object> map = new HashMap<String,Object>();
		for(int i = 0 ; i<assetIdList.length;i++) {
			assetList.add(Integer.parseInt(assetIdList[i]));
		}
		map.put("assetList", assetList);
		map.put("issuePresetId", issueStagePresetDto.getIssuePresetId());
		issueDao.upStagePreset(issueStagePresetDto);
		issueDao.delStagePresetAsset(issueStagePresetDto.getIssuePresetId());
		issueDao.inModifyPreset(map);
	}
	public void assetDelete(StageAssetDto stageAssetDto) {
		issueDao.delStageAsset(stageAssetDto);
	}
	public void presetDelete(IssueStagePresetDto issueStagePresetDto) {
		issueDao.delPreset(issueStagePresetDto.getIssuePresetId());
		issueDao.delStagePresetAsset(issueStagePresetDto.getIssuePresetId());
	}
	public List<StageAssetDto> getAssetList(int projectId){
		return issueDao.selStageAsset(projectId);
	} 
	public List<IssueStagePresetDto> getPresetList(int projectId){
		return issueDao.selStagePreset(projectId);
	}
//	public List<IssueStagePresetAssetDto> getPresetAssetList(List<IssueStagePresetDto> presetList){}

	/**
	 * add issue watcher(follower) and return total watcher count
	 * @param issueWatcherDto
	 * @return
	 */
	public int addWatcher(IssueWatcherDto issueWatcherDto) {
		issueDao.inWatcherByIssue(issueWatcherDto);
		IssueDto issue = new IssueDto();
		issue.setIssueId(issueWatcherDto.getIssueId());
		int numWatcher = issueDao.selCountIssueFollowingByIssue(issue);
		
		return numWatcher;
	}

	public int removeWatcher(IssueWatcherDto issueWatcherDto) {
		issueDao.delWatcherByIssue(issueWatcherDto);
		IssueDto issue = new IssueDto();
		issue.setIssueId(issueWatcherDto.getIssueId());
		int numWatcher = issueDao.selCountIssueFollowingByIssue(issue);
		
		return numWatcher;
	}
	
	public Map<String , String> getStageChangeMap(String issueId , String change){
		Map<String, String> map = new HashMap<>();
		
		IssueDto dto = new IssueDto();
		IssueStagePresetAssetDto stagedto = new IssueStagePresetAssetDto();
		StageAssetDto assetdto = new StageAssetDto();
		
		dto.setIssueId(Integer.parseInt(issueId));
		
		dto = issueDao.selIssueByIssueId(dto);
		
		int stagePresetId = dto.getStagePresetId();
		
		int issueStage = dto.getIssueStage();
		
		stagedto.setIssuePresetId(stagePresetId);
		stagedto.setStageAssetId(issueStage);
//		System.out.println("#####dto " +dto);
//		System.out.println("@@@@@stagedto"+ stagedto);
		
		//change 가 up 일때 if
		if(change.equals("up")) {
			//Order 가 99 (끝값 ) 일때
			if(stagedto.getStageAssetId()==99) {
				assetdto.setStageAssetId(99);
				assetdto = issueDao.selStageAssetStageId(assetdto);
			//기본 up 
			}else {

				stagedto = issueDao.selStageAssetPressetUpStageId(stagedto);
				dto.setIssueStage(stagedto.getStageAssetId());
				if(dto.getIssueStage()==99) {
					issueDao.updateIssueIssueStageEnddate(dto);
					dto = issueDao.selIssueEnddate(dto);
					SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
					
					map.put("actualenddate", date.format(dto.getActualEndDate()));
				}
				else {
				issueDao.updateIssueIssueStage(dto);
				}
				
				
				assetdto.setStageAssetId(dto.getIssueStage());
				assetdto= issueDao.selStageAssetStageId(assetdto);
			}
		
		//change 가 down 일때 if
		}else if(change.equals("down")) {
			//Order 가 1 (처음값 ) 일때
			if(stagedto.getStageAssetId()==1) {
				assetdto.setStageAssetId(1);
				assetdto = issueDao.selStageAssetStageId(assetdto);
			//기본 down
			}else {
				if(stagedto.getStageAssetId()==99) {
					issueDao.deleteEnddate(dto);
				}
				
				stagedto = issueDao.selStageAssetPressetDownStageId(stagedto);
				
				dto.setIssueStage(stagedto.getStageAssetId());
				issueDao.updateIssueIssueStage(dto );
				
				assetdto.setStageAssetId(dto.getIssueStage());
				assetdto = issueDao.selStageAssetStageId(assetdto);
			}
		}
		
		map.put("stageId",Integer.toString(assetdto.getStageAssetId()));
		map.put("stageName", assetdto.getStageName());
		
		return map ;
	}
	
}
