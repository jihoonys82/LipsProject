package lips.issue.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lips.issue.dto.IssueDto;
import lips.issue.dto.IssueStagePresetDto;
import lips.issue.dto.StageAssetDto;
import lips.issue.service.IssueService;
import lips.project.dto.ProjectDto;
import lips.userinfo.dto.User;
import lips.userinfo.dto.UserByToken;

@Controller
@RequestMapping(value="/issue")
public class IssueController {
	
	private static final Logger logger = LoggerFactory.getLogger(IssueService.class);
	
	@Autowired IssueService issueService;
	
	/**
	 * Issue Main Page 
	 * @return
	 */
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public ModelAndView issueMain() {
		User user = new UserByToken().getInstance();
		
		ModelAndView mav = issueService.setIssueMain(user);
		
		return mav;
	}
	
	/**
	 * Issue Create Form
	 * @param projectId
	 * @return
	 */
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public ModelAndView issueCreateForm(@RequestParam(required=false) String projectId) {
		ModelAndView mav;
		ProjectDto projectDto; 
		if(projectId != null) {
			projectDto = new ProjectDto();
			projectDto.setProjectId(Integer.parseInt(projectId));
			mav = issueService.setIssueCreate(projectDto);
		} else {
			mav = issueService.setIssueCreate();
		}
		
		return mav;
	}
	
	/**
	 * get Users for find assignee via Ajax
	 * @param name
	 * @param projectId
	 * @return
	 */
	@RequestMapping(value="/getMembers", method=RequestMethod.POST, produces="application/json; charset=utf-8")
	public @ResponseBody Map<String, List<String>> getMembers(String name, String projectId) {
		ProjectDto projectDto = new ProjectDto();
		projectDto.setProjectId(Integer.parseInt(projectId));
		
		ArrayList<User> userList = issueService.getMemberList(name, projectDto);
		ArrayList<String> userName = new ArrayList<String>();
		
		for(User u : userList) {
			userName.add(u.getUserId());
		}
		
		HashMap<String,List<String>> map = new HashMap<String,List<String>>();
		map.put("name", userName);
		return map;
	}
	
	/**
	 * get Category List via Ajax 
	 * @param projectId
	 * @return
	 */
	@RequestMapping(value="/getCategory", method=RequestMethod.POST)
	public ModelAndView getCategory(String projectId) {
		ProjectDto projectDto = new ProjectDto();
		projectDto.setProjectId(Integer.parseInt(projectId));
		
		return issueService.getCategory(projectDto);
	}
	
	/**
	 * get Stage Asset via Ajax
	 * @param ispDto
	 * @return  
	 */
	@RequestMapping(value="/getStageAssets", method=RequestMethod.POST)
	public @ResponseBody Map<String, List<StageAssetDto>> getStageAssets(IssueStagePresetDto ispDto) {
		List<StageAssetDto> stageAssets = issueService.getStageAssets(ispDto);
		Map<String, List<StageAssetDto>> map = new HashMap<>();
		map.put("stageAssets", stageAssets);
		
		return map;
	}
	
	
	/**
	 * Issue Create process
	 */
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String issueCreateProc(IssueDto issueDto) {
		issueService.setNewIssue(issueDto);
		return "redirect:/issue/main";
	}
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public void issueDetail() {
		
	}
	
	/**
	 * Issue list page
	 * @param listType
	 * @param projectDto
	 * @param issueOwner
	 */
	@RequestMapping(value="/issueList", method=RequestMethod.GET)
	public ModelAndView issueList(@RequestParam(required=false, defaultValue="AssignedIssue") String listType,
			@RequestParam(required=false) String projectId,
			@RequestParam(required=false) User issueOwner,
			@RequestParam(required=false, defaultValue="0") int curPage) {
		
		ModelAndView mav = issueService.getIssueList(listType, projectId, issueOwner, curPage);
		
		return mav; 
	}
	
}
