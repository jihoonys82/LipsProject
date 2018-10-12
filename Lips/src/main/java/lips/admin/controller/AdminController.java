package lips.admin.controller;
 import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
 @Controller
public class AdminController {
   
   private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
   
   @RequestMapping(value="/admin/main")
   public String main() {
      logger.info("메인 페이지");
      
      return "admin/main";
   }
   
}
