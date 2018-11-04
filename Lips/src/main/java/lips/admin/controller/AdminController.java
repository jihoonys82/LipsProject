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

import lips.admin.dto.NoticeDto;
import lips.admin.service.AdminService;
import lips.project.dto.ProjectDto;
import lips.project.service.ProjectService;
import lips.userinfo.dto.User;
import lips.userinfo.dto.UserTracker;
import lips.utils.Paging;
 @Controller
 @RequestMapping(value="/admin")
public class AdminController {
   
   private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
   
   @Autowired AdminService adminService;
   @Autowired ProjectService projectService;
   @Autowired UserTracker userTracker;
   
   @RequestMapping(value="/main", method=RequestMethod.GET)
   public void main(Model model) {
      logger.info("메인 페이지");
      
	  int allUserCnt =  userTracker.getAllUserTrack();
	  List<Integer> cntList = adminService.getNumOfDash();
	   
	  model.addAttribute("allUserCnt",allUserCnt);
	  model.addAttribute("cntList",cntList);

   }
   
   @RequestMapping(value="/notice", method=RequestMethod.GET)
   public void notice(Model model) {
	   logger.info("공지 페이지");
	   
	   List<NoticeDto> nInfo = adminService.getNinfo();
	   NoticeDto oneLineHeader = adminService.getOneLineNotice();
	   
	   model.addAttribute("nInfo", nInfo);
	   model.addAttribute("oneLine",oneLineHeader);
   }
   
   @RequestMapping(value="/notice",method=RequestMethod.POST)
   public ModelAndView noticeWrite(String param, String content, NoticeDto notice) {
	   ModelAndView mav = new ModelAndView();
	   
	   if(param.equals("1")) {
		   adminService.oneLineNotice(content);
	   }else if(param.equals("0")) {
		   adminService.timeLineNotice(notice);
	   }else if(param.equals("delete")) {
		   adminService.upOneLineHeader();
	   }else if(param.equals("update")) {
		   NoticeDto oneLineNotice = adminService.getOneLineNotice();
		   
		   mav.addObject("notice",oneLineNotice);
	   }else if(param.equals("more")) {
		   List<NoticeDto> moreNotice = adminService.getMoreOneLineN();
		   
		   mav.addObject("more", moreNotice);
	   }
	   
	   
	   mav.setViewName("jsonView");
	   return mav;
   }
  
   @RequestMapping(value="/project/chart", method=RequestMethod.GET)
   public void proChart(Model model) {
	   logger.info("프로젝트 차트 페이지");
	   
   }
   
   @RequestMapping(value="/project/text", method=RequestMethod.GET)
   public void proText(Model model, @RequestParam(defaultValue="0", required=false)int curPage) {
	  logger.info("프로젝트 텍스트 페이지");
	  
	  int totalPage = adminService.getPTotalCount();
	  Paging paging = new Paging(totalPage, curPage);
	  
	  List<ProjectDto> pList = adminService.getProList(paging); 
	  List<Integer> cntList = adminService.getNumOfPro();
	   
	  model.addAttribute("paging",paging);
	  model.addAttribute("pList",pList);
	  model.addAttribute("cntList", cntList);
	  
   }
   
   @RequestMapping(value="/user/chart", method=RequestMethod.GET)
   public void userChart(Model model) {
	   logger.info("유저 차트 페이지");
	   
	   int allUserCnt =  userTracker.getAllUserTrack();
	   List<Integer> cntList = adminService.getNumOfUser();
	   
	   model.addAttribute("allUserCnt",allUserCnt);
	   model.addAttribute("cntList",cntList);
   }
   
   @RequestMapping(value="/user/text", method=RequestMethod.GET)
   public void userText(Model model, @RequestParam(defaultValue="0", required=false)String curPage) {
	   logger.info("유저 텍스트 페이지");
	   
	  int curPageParse = Integer.parseInt(curPage);
	  logger.info(curPage);
	  System.out.println(curPageParse);
	   int totalPage = adminService.getUTotalCount();
	   Paging paging = new Paging(totalPage,curPageParse);
	   
	   List<? extends Object> uList = adminService.getUserList(paging);//0: userList 1: userIsLeaderList
	   List<Integer> cntList = adminService.getNumOfUser();
	   	
// 	   List<ProjectDto> pInfo = projectService.selPro(user);	   
	   
	   model.addAttribute("paging",paging);
	   model.addAttribute("uList",uList.get(0));
	   model.addAttribute("uLeaderList",uList.get(1));
	   model.addAttribute("cntList",cntList);

//	   model.addAttribute("pInfo",pInfo);
   }
   
   @RequestMapping(value="/user/view", method=RequestMethod.GET)
   public void userDetailView(Model model, User user) {
		logger.info("유저 상세 페이지");
		
		User userinfo = adminService.getUserInfo(user);
		List proinfo = projectService.ProjectMain(user);
		
		model.addAttribute("userInfo", userinfo);
		model.addAttribute("projectInfo",proinfo);
   }
   
   @RequestMapping(value="/user/view", method=RequestMethod.POST)
   public ModelAndView userClose(Model model, User user, String param) {
		logger.info("유저 상세 페이지_강등 & 강등 취소");
		ModelAndView mav = new ModelAndView();
		
		if(param.equals("true")) {
			adminService.reopenAccount(user);
			
		} else if(param.equals("false")) {
			adminService.closeAccount(user);
		}
		
		int blocked = user.getBlocked();
		int level = user.getUserLevel();
		
		mav.addObject("blocked", blocked);
		mav.addObject("level",level);
		mav.setViewName("jsonView");
		return mav;
   }
   
   @RequestMapping(value="/project/view", method=RequestMethod.GET)
   public void proDetailView(Model model, ProjectDto project) {
	   logger.info("프로젝트 상세 페이지");
	   
	   ModelAndView mav = new ModelAndView();
	   
	   ProjectDto proInfo = adminService.getProInfo(project);
	   List<ProjectDto> uPInfo = adminService.getUOnP(project);
	   
	   List<Integer> pList = adminService.getNumOfPInfo(project);
//	   HashMap<String, String> pTime = adminService.getElapsedTime(project);
	   
	   model.addAttribute("proInfo", proInfo);
	   model.addAttribute("uPInfo",uPInfo);
	   model.addAttribute("pList",pList);
//	   model.addAttribute("pTime",pTime);

//	   ProjectDto projectinfo = adminService.getProInfo(project);
//	   model.addAttribute("proInfo",projectinfo);
	   
   }
   
   
   @RequestMapping(value="/project/view", method=RequestMethod.POST)
   public ModelAndView projectManage(Model model, ProjectDto project, String param, NoticeDto notice) {
		logger.info("프로젝트 상세 페이지_정지 & 재개");
		ModelAndView mav = new ModelAndView();
		
		if(param.equals("restart")) {
			adminService.restartProject(project);
			
		} else if(param.equals("stop")) {
			adminService.noticeToStop(notice);
			adminService.stopProject(project);
			
		} else if(param.equals("finish")) {
			adminService.finishProject(project);
			
		} else if(param.equals("leader")) {
			adminService.noticeToLeader(notice);
		}
		
		String status = project.getStatus();
		
		mav.addObject("status",status);
		mav.setViewName("jsonView");
		return mav;
   }
   
}