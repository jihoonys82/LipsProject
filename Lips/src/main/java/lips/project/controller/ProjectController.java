package lips.project.controller;
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
public class ProjectController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);

	
	//인트로
	@RequestMapping(value = "/project", method = RequestMethod.GET)
	public String intro() {
		logger.info("project탭 활성화");
		
		
		return "project/project";
	}
	



	
	
	
}
