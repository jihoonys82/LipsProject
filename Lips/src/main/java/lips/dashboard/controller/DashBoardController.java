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
import net.sf.json.JSONObject;


@Controller
@RequestMapping(value = "/dashboard")
public class DashBoardController {
	
	@Autowired DashBoardService dbsvc;
	private static final Logger logger = LoggerFactory.getLogger(DashBoardController.class);

	
	@RequestMapping(value = "/dashview", method = RequestMethod.GET)
	public ModelAndView dashBoardView(@RequestParam(required=false,defaultValue="0") int projectId ) {
		
		ModelAndView mav = new ModelAndView();
		List<DashBoardAssetDto> assetList = new ArrayList<DashBoardAssetDto>();
		int maxXLocation ;
//		Map<Integer, Integer> lineMaxLocation = new HashMap<Integer, Integer>();
//		Map<Integer, List<Integer>> lineLocation = new HashMap<Integer, List<Integer>>();
		JSONObject lineMax = new JSONObject();
		JSONObject lineLoc = new JSONObject();
		
		//test 데이터
		
		//========
		
		DashBoardDto boarddto = dbsvc.checkPreset(projectId);
		assetList = dbsvc.presetData(boarddto);
		maxXLocation = dbsvc.maxLocation(boarddto);
		lineMax = dbsvc.lineMaxLocation(boarddto, maxXLocation);
		lineLoc = dbsvc.lineLocation(boarddto, maxXLocation);
		
		logger.info("Boarddto : " + boarddto);
		logger.info("AssetData : " + assetList);
		logger.info("MaxLocation : " + maxXLocation); 
		logger.info("lineMaxLocation : " + lineMax); 
		logger.info("lineLocation : " + lineLoc );
		
		mav.addObject("boarddto",boarddto);
		mav.addObject("assetData", assetList);
		mav.addObject("maxX",maxXLocation);
		mav.addObject("lineMax", lineMax);
		mav.addObject("lineLoc", lineLoc);
		
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
