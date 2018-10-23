package lips.dashboard.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lips.dashboard.dto.DashBoardDto;
import lips.dashboard.service.DashBoardService;


@Controller
@RequestMapping(value = "/dashboard")
public class DashBoardController {
	
	@Autowired DashBoardService dbsvc;
	private static final Logger logger = LoggerFactory.getLogger(DashBoardController.class);

	
	@RequestMapping(value = "/dashview", method = RequestMethod.GET)
	public ModelAndView dashBoardView(@RequestParam(required=false,defaultValue="0") int projectId ) {
		
		ModelAndView mav = new ModelAndView();
		int maxXLocation ;
	
		DashBoardDto boarddto = dbsvc.checkPreset(projectId);
		maxXLocation = dbsvc.maxXLocation(boarddto);

		logger.info("MaxXLocation : " + maxXLocation); 
	
		
		mav.addObject("maxX",maxXLocation);
		mav.addObject("dashBoardId",boarddto.getDashboardId());
	

		mav.setViewName("dashboard/dashview");
		
		return mav;
	}
	
	@RequestMapping(value = "/dashBoardCustom", method = RequestMethod.GET)
	public ModelAndView dashCustom(@RequestParam(required=false,defaultValue="0") int dashboardId) {
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("dashboard/dashcustom");
		return mav;
	}
	
	@RequestMapping(value = "/dashBoardCustom", method = RequestMethod.POST)
	public ModelAndView dashCustomSaveProc() {
		ModelAndView mav = new ModelAndView();
		
		logger.info("project start /dashboard view");
		
		return mav;
	}
}
