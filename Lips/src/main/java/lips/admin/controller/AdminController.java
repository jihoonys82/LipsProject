package lips.admin.controller;
 import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lips.admin.service.AdminService;
import lips.admin.util.Paging;
import lips.project.dto.ProjectDto;
import lips.project.service.ProjectService;
import lips.userinfo.dto.User;
import lips.userinfo.dto.UserTracker;
 @Controller
public class AdminController {
   
   private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
   
   @Autowired AdminService adminService;
   @Autowired ProjectService projectService;
   @Autowired UserTracker userTracker;
   
   @RequestMapping(value="/admin/main", method=RequestMethod.GET)
   public String main() {
      logger.info("메인 페이지");
      
      return "admin/main";
   }
   
   @RequestMapping(value="/admin/notice", method=RequestMethod.GET)
   public void notice() {
	   logger.info("공지 페이지");
   }
  
   @RequestMapping(value="/admin/project/chart", method=RequestMethod.GET)
   public String proChart() {
	   logger.info("프로젝트 차트 페이지");
	   
	   return "admin/project/chart";
   }
   
   @RequestMapping(value="/admin/project/text", method=RequestMethod.GET)
   public void proText(Model model, @RequestParam(defaultValue="0", required=false)int curPage) {
	  logger.info("프로젝트 텍스트 페이지");
	  
	  int totalPage = adminService.getPTotalCount();
	  Paging paging = new Paging(totalPage, curPage);
	  
	  List<ProjectDto> pList = adminService.getProList(paging);
	  
	  model.addAttribute("paging",paging);
	  model.addAttribute("pList",pList);
	  
   }
   
   @RequestMapping(value="/admin/user/chart", method=RequestMethod.GET)
   public void userChart(Model model) {
	   logger.info("유저 차트 페이지");
	   
	   int allUserCnt =  userTracker.getAllUserTrack();
	   List<Integer> cntList = adminService.getNumOfUser();
	   
	   model.addAttribute("allUserCnt",allUserCnt);
	   model.addAttribute("cntList",cntList);
   }
   
   @RequestMapping(value="/admin/user/text", method=RequestMethod.GET)
   public void userText(Model model, @RequestParam(defaultValue="0", required=false)int curPage) {
	   logger.info("유저 텍스트 페이지");
	   
	   int totalPage = adminService.getUTotalCount();
	   Paging paging = new Paging(totalPage,curPage);
	   
	   List<? extends Object> uList = adminService.getUserList(paging);//0: userList 1: userIsLeaderList
	   List<Integer> cntList = adminService.getNumOfUser();
	   	
// 	   List<ProjectDto> pInfo = projectService.selPro(user);	   
	   
	   model.addAttribute("paging",paging);
	   model.addAttribute("uList",uList.get(0));
	   model.addAttribute("uLeaderList",uList.get(1));
	   model.addAttribute("cntList",cntList);

//	   model.addAttribute("pInfo",pInfo);
   }
   
   @RequestMapping(value="/admin/user/view", method=RequestMethod.GET)
   public void userDetailView(Model model, User user) {
		logger.info("유저 상세 페이지");
		
		User userinfo = adminService.getUserInfo(user);
//		ProjectDto proinfo = adminService.getProByUid(user);
		List proinfo = projectService.selPro(user);
		model.addAttribute("userInfo", userinfo);
		model.addAttribute("projectInfo",proinfo);
   }
   
   @RequestMapping(value="/admin/user/view", method=RequestMethod.POST)
   public ModelAndView userClose(Model model, User user, boolean param) {
		logger.info("유저 상세 페이지_계정삭제");
		ModelAndView mav = new ModelAndView();
		
		if(param == true) {
			adminService.closeAccount(user);
			
		} else if(param == false) {
			adminService.reopenAccount(user);
		}
		
		String id = user.getUserId();

		mav.addObject("userId", id);
		mav.setViewName("jsonView");
		return mav;
   }
   
   @RequestMapping(value="/admin/project/view", method=RequestMethod.GET)
   public void proDetailView(Model model, ProjectDto project) {
	   logger.info("프로젝트 상세 페이지");
	   
//	   ProjectDto projectinfo = adminService.getProInfo(project);
//	   model.addAttribute("proInfo",projectinfo);
	   
   }
   
}
