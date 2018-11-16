package lips.admin.controller;
 import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import lips.admin.service.IndexService;
import lips.issue.dto.CategoryAssetDto;
import lips.project.dto.ProjectDto;
import lips.project.service.ProjectService;
import lips.userinfo.dto.User;
import lips.utils.Paging;
import net.sf.json.JSONObject;
 @Controller
 @RequestMapping(value="/admin")
public class AdminController {
   
   private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
   
   @Autowired AdminService adminService;
   @Autowired ProjectService projectService;
   @Autowired IndexService isvc;
   
   @RequestMapping(value="/main", method=RequestMethod.GET)
   public ModelAndView main(Model model) {
      ModelAndView mav = new ModelAndView();
	  List<Integer> cntList = adminService.getNumOfDash();
	  List<Integer> pChart = adminService.getTotalPChart(); 
	  List<Integer> uChart = adminService.getTotalUChart();
	  
	  JSONObject obj = new JSONObject();	   
	  obj.accumulate("pChart", pChart);
	  obj.accumulate("uChart", uChart);
	  
	  mav.addObject("chart",obj);
	  mav.addObject("cntList",cntList);
	   
	  mav.setViewName("admin/main"); 
	  return mav;
   }
   
   @RequestMapping(value="/notice", method=RequestMethod.GET)
   public void notice(Model model) {
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

   @RequestMapping(value="/notice/delete",method=RequestMethod.POST)
   public ModelAndView timeLineDelete(int noticeId) {
	   ModelAndView mav = new ModelAndView();
	   adminService.timeLineDelete(noticeId);
	   
	   mav.setViewName("jsonView");
	   return mav;
   }
  
   @RequestMapping(value="/project/chart", method=RequestMethod.GET)
   public ModelAndView proChart(Model model) {
	   ModelAndView mav = new ModelAndView();

	   List<Integer> cntList = adminService.getNumOfPro();
	   List<HashMap<String,String>> newPChart = adminService.getNewPByMonth();
	   List<Integer> closedPChart = adminService.getClosedPByMonth();

	   List<Integer> overduePChart = adminService.getOverduePByMonth();
	   List<Integer> pieChart = adminService.getPPieChart();
	  
	   JSONObject obj = new JSONObject();	   
	   obj.accumulate("newP", newPChart);
	   obj.accumulate("closedP", closedPChart);
	   obj.accumulate("overP", overduePChart);
	   obj.accumulate("pieChart", pieChart);
	   
	   mav.addObject("chart",obj);
	   mav.addObject("cntList",cntList);
	   
	   mav.setViewName("admin/project/chart"); 
	   return mav;
   }
   
   @RequestMapping(value="/project/text", method=RequestMethod.GET)
   public void proText(Model model, @RequestParam(defaultValue="0", required=false)int curPage) {
	  int totalPage = adminService.getPTotalCount();
	  Paging paging = new Paging(totalPage, curPage);
	  
	  List<ProjectDto> pList = adminService.getProList(paging); 
	  List<Integer> cntList = adminService.getNumOfPro();
	   
	  model.addAttribute("paging",paging);
	  model.addAttribute("pList",pList);
	  model.addAttribute("cntList", cntList);
	  
   }
   
   @RequestMapping(value="/project/category", method=RequestMethod.GET)
   public ModelAndView proCategory() {
	   ModelAndView mav = new ModelAndView();
	   
	   List<CategoryAssetDto> cateList = adminService.getPCate();
	   
	   mav.addObject("cateList",cateList);
	   return mav;
   }
   
   @RequestMapping(value="/project/category", method=RequestMethod.POST)
   public ModelAndView pCate(String param, CategoryAssetDto category) {
	   ModelAndView mav = new ModelAndView();
	   
	   if(param.equals("newCategory")) {
		   adminService.createCategoryAsset(category);
	   }
	  
	   mav.setViewName("jsonView");
		
	   return mav;
   }
   
   @RequestMapping(value="/user/chart", method=RequestMethod.GET)
   public ModelAndView userChart(Model model) {
	   ModelAndView mav = new ModelAndView();
	   List<Integer> cntList = adminService.getNumOfUser();
	   List<HashMap<String,String>> newUChart = adminService.getNewUByMonth();
	   List<Integer> pieChart = adminService.getUPieChart();
	   List<Integer> closedUCnt = adminService.getClosedUChart();
	      
	   JSONObject obj = new JSONObject();	   
	   obj.accumulate("data", newUChart);
	   obj.accumulate("pieChart", pieChart);
	   obj.accumulate("closeData", closedUCnt);
	   
	   mav.addObject("chart",obj);
	   mav.addObject("cntList",cntList);
	   
	   mav.setViewName("admin/user/chart"); 
	   return mav;
   }
   
   @RequestMapping(value="/user/text", method=RequestMethod.GET)
   public void userText(Model model, @RequestParam(defaultValue="0", required=false)String curPage) {
	   logger.info("유저 텍스트 페이지");
	   
	  int curPageParse = Integer.parseInt(curPage);
//	  logger.info(curPage);
//	  System.out.println(curPageParse);
	  int totalPage = adminService.getUTotalCount();
	  Paging paging = new Paging(totalPage,curPageParse);
	   
	  List<? extends Object> uList = adminService.getUserList(paging);//0: userList 1: userIsLeaderList
	  List<Integer> cntList = adminService.getNumOfUser();
	   	
// 	  List<ProjectDto> pInfo = projectService.selPro(user);	   
	   
	  model.addAttribute("paging",paging);
	  model.addAttribute("uList",uList.get(0));
	  model.addAttribute("uLeaderList",uList.get(1));
	  model.addAttribute("cntList",cntList);

//	  model.addAttribute("pInfo",pInfo);
   }
   
   @RequestMapping(value="/user/view", method=RequestMethod.GET)
   public void userDetailView(Model model, User user) {
		User userinfo = adminService.getUserInfo(user);
		List proinfo = projectService.ProjectMain(user);
		
		model.addAttribute("userInfo", userinfo);
		model.addAttribute("projectInfo",proinfo);
   }
   
   @RequestMapping(value="/user/view", method=RequestMethod.POST)
   public ModelAndView userClose(Model model, User user, String param) {
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
	   ModelAndView mav = new ModelAndView();
	   
	   ProjectDto proInfo = adminService.getProInfo(project);
	   List<ProjectDto> uPInfo = adminService.getUOnP(project);
	   List uInfo = projectService.selProMember(project);
	   List<Integer> pList = adminService.getNumOfPInfo(project);
//	   HashMap<String, String> pTime = adminService.getElapsedTime(project);
	   
	   model.addAttribute("proInfo", proInfo);
	   model.addAttribute("uPInfo",uPInfo);
	   model.addAttribute("uInfo",uInfo);
	   model.addAttribute("pList",pList);
//	   model.addAttribute("pTime",pTime);

//	   ProjectDto projectinfo = adminService.getProInfo(project);
//	   model.addAttribute("proInfo",projectinfo); 
   }
   
   
   @RequestMapping(value="/project/view", method=RequestMethod.POST)
   public ModelAndView projectManage(Model model, ProjectDto project, String param, NoticeDto notice) {
		ModelAndView mav = new ModelAndView();
		ProjectDto proInfo = adminService.getProInfo(project);

		String error = "";

		if(param.equals("restart")) {
			adminService.restartProject(project);
			
		} else if(param.equals("stop")) {
			if(notice.getNoticeContent().equals("") ||
				notice.getNoticeContent().equals("")) {
				error = "모든 칸을 입력해주세요";
					
			} else {
				adminService.noticeToStop(notice);
				adminService.stopProject(project);								
			}
			
		} else if(param.equals("finish")) {
			adminService.finishProject(project);
			
		} else if(param.equals("leader")) {			
			if(notice.getNoticeTitle().equals("") ||
					notice.getNoticeContent().equals("")) {
				error = "모든 칸을 입력해주세요";
				
			} else {
				adminService.noticeToLeader(notice);						
			}
		}
		
		String status = project.getStatus();
		
		mav.addObject("error",error);
		mav.addObject("status",status);
		mav.addObject("proInfo",proInfo);
		mav.setViewName("jsonView");
		return mav;
   }
   
   //석호것
   @RequestMapping(value="/project/text", method=RequestMethod.POST)
   public ModelAndView proTextIndexing(
		   @RequestParam(defaultValue="0", required=false)int curPage,
		   String indexData
		   ) {
	   
	  ModelAndView mav = new ModelAndView();
	  
	  Map<String, String> index = new HashMap<>();
	  
	  index = isvc.splitData(indexData);

	  mav = isvc.getProListIndex(curPage, index);
	
	  List<Integer> cntList = adminService.getNumOfPro();
	  
	  mav.addObject("cntList", cntList);
	  
	  mav.setViewName("admin/project/text");

	  return mav;
   }
   
   @RequestMapping(value="/user/text", method=RequestMethod.POST)
   public ModelAndView userTextIndexing(
		   @RequestParam(defaultValue="0", required=false)int curPage,
		   String indexData
		   ) {
	   
	  ModelAndView mav = new ModelAndView();
	  
	  Map<String, String> index = new HashMap<>();
	  
	  index = isvc.splitData(indexData);
	  
//	  System.out.println("#############################################"+ index);

		  mav = isvc.getUserList(index, curPage); 
	
	  List<Integer> cntList = adminService.getNumOfUser();
	  
	  mav.addObject("cntList", cntList);
	  
	  mav.setViewName("admin/user/text");

	  return mav;
   }
   //석호것 끝
   
}