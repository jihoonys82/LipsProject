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
  
   @RequestMapping(value="/admin/project/chart", method=RequestMethod.GET)
   public String proChart() {
	   logger.info("프로젝트 차트 페이지");
	   
	   return "admin/project/chart";
   }
   
}
