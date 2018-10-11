package lips.dashboard.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lips.dashboard.dto.DashBoardDto;
import lips.dashboard.service.DashBoardService;


@Controller
public class DashBoardController {
	
	@Autowired DashBoardService dbsvc;
	private static final Logger logger = LoggerFactory.getLogger(DashBoardController.class);

	
	@RequestMapping(value = "/dashboard/dashview", method = RequestMethod.GET)
	public ModelAndView dashBoardView(String userid , String projectname , DashBoardDto dto) {
		ModelAndView mav = new ModelAndView();
		//임시 데이터
		userid = "skt5015";
		projectname = "dashex";
		//임시 데이터
		
		DashBoardDto dashview = dbsvc.ViewPreset(dto);

		
		
		
		mav.setViewName("/dashboard/dashview");
		
		logger.info("project start /dashboard view");
		
		return mav;
	}
	
	@RequestMapping(value = "/dashboard/dashview", method = RequestMethod.POST)
	public ModelAndView dashBoardViewProc() {
		ModelAndView mav = new ModelAndView();
		
		logger.info("project start /dashboard view");
		
		return mav;
	}
}
