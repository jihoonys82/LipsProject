package lips.dashboard.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lips.card.dto.CardDto;
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
		
		if(boarddto != null) {
			maxXLocation = dbsvc.maxXLocation(boarddto);
			mav.addObject("dashBoardId",boarddto.getDashboardId());
			mav.addObject("projectId",projectId);
		}else{
			maxXLocation = 1 ;
			mav.addObject("dashBoardId", 0);
		}
		
		mav.addObject("maxX",  maxXLocation);
		mav.setViewName("dashboard/dashview");
		return mav;
	}
	
	@RequestMapping(value = "/dashBoardCustom", method = RequestMethod.GET)
	public ModelAndView dashCustom(
			@RequestParam(required=false,defaultValue="0") int dashboardId , 
			@RequestParam(required=false,defaultValue="0") int projectId
			) {
		ModelAndView mav = new ModelAndView();
		
		List<CardDto> selCard = new ArrayList<CardDto>();
		selCard = dbsvc.AllCardList();
		
		mav.addObject("selCard", selCard);
		mav.addObject("dashboardId",dashboardId);
		mav.addObject("projectId",projectId);
		
		mav.setViewName("dashboard/dashcustom");
		return mav;
	}
	@RequestMapping(value = "/dashsave", method = RequestMethod.POST)
	public ModelAndView dashCustomSaveProc(String saveData) {
		ModelAndView mav = new ModelAndView();
		Map<String, String> dataMap = new HashMap<>();
		
		dataMap = dbsvc.splitData(saveData);
		String projectId = dataMap.get("projectId");
		int dashboardId = dbsvc.getDashBoardId(dataMap);
		dbsvc.insertData(dataMap , dashboardId);
		
		System.out.println("dataMap"+ dataMap);
//		projectId="+dataMap.get("projectId")
	
		mav.setViewName("redirect:/dashboard/dashview?projectId="+projectId);
		return mav;
	}
}
