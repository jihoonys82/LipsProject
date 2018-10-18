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

import lips.dashboard.dto.DashBoardAssetDto;
import lips.dashboard.dto.DashBoardDto;
import lips.dashboard.service.DashBoardService;
import lips.userinfo.dto.User;
import lips.userinfo.dto.UserByToken;


@Controller
@RequestMapping(value = "/dashboard")
public class DashBoardController {
	
	@Autowired DashBoardService dbsvc;
	private static final Logger logger = LoggerFactory.getLogger(DashBoardController.class);

	
	@RequestMapping(value = "/dashview", method = RequestMethod.GET)
	public ModelAndView dashBoardView(@RequestParam(required=false,defaultValue="0") int projectId ) {
		
		ModelAndView mav = new ModelAndView();
		List<DashBoardAssetDto> assetList = new ArrayList<DashBoardAssetDto>();
		Map<String, String> maxLocation = new HashMap<String, String>();
		Map<Integer, Integer> lineLocation = new HashMap<Integer, Integer>();
		
		//test 데이터
		projectId = 1;
		//========
		
		DashBoardDto boarddto = dbsvc.checkPreset(projectId);
		assetList = dbsvc.presetData(boarddto);
		maxLocation = dbsvc.maxLocation(boarddto);
//		lineLocation = dbsvc.lineLocation(projectId, maxLocation);
		
		logger.info("Boarddto : " + boarddto);
		logger.info("AssetData : " + assetList);
		logger.info("MaxLocation : " + maxLocation); 
		
		mav.addObject("boarddto",boarddto);
		mav.addObject("assetData", assetList);
		mav.addObject("maxLocation",maxLocation);
		
		mav.setViewName("dashboard/dashview");
		
		return mav;
	}
	
	@RequestMapping(value = "/dashview", method = RequestMethod.POST)
	public ModelAndView dashBoardViewProc() {
		ModelAndView mav = new ModelAndView();
		
		logger.info("project start /dashboard view");
		
		return mav;
	}
}
