package lips.main.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lips.admin.controller.AdminController;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	
	//인트로
	@RequestMapping(value = "/intro", method = RequestMethod.GET)
	public String intro() {
		logger.info("intro 활성화");
		
		
		return "intro";
	}
	


	
	//메인페이지 
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		logger.info("main 활성화");
		
		
		return "main/main";
	}
	
	
	
}
