package lips.admin.controller;
 import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
 @Controller
public class AdminController {
   
   private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
   
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
   public String proText() {
	   logger.info("프로젝트 텍스트 페이지");
	   
	   return "admin/project/text";
   }
   
   @RequestMapping(value="/admin/user/chart", method=RequestMethod.GET)
   public void userChart() {
	   logger.info("유저 차트 페이지");
   }
   
   @RequestMapping(value="/admin/user/text", method=RequestMethod.GET)
   public void userText() {
	   logger.info("유저 텍스트 페이지");
   }
   
   @RequestMapping(value="/admin/user/view", method=RequestMethod.GET)
   public void userDetailView(String userId) {
	   logger.info("유저 상세 페이지");
   }
   
   // int projectId 추가 
   @RequestMapping(value="/admin/project/view", method=RequestMethod.GET)
   public void proDetailView() {
	   logger.info("프로젝트 상세 페이지");
   }
   
}
