package lips.dashboard.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lips.dashboard.dto.DashBoardAssetDto;
import lips.dashboard.dto.DashBoardDto;
import lips.dashboard.service.DashBoardService;


@Controller
public class DashBoardController {
	
	@Autowired DashBoardService dbsvc;
	private static final Logger logger = LoggerFactory.getLogger(DashBoardController.class);

	
	@RequestMapping(value = "/dashboard/dashview", method = RequestMethod.GET)
	public ModelAndView dashBoardView(String userId , int projectId , DashBoardDto dto) {
		ModelAndView mav = new ModelAndView();
		List<DashBoardAssetDto> assetList = new ArrayList<DashBoardAssetDto>();
		DashBoardAssetDto assetdto = new DashBoardAssetDto();

		userId="skt5015";
		projectId = 1;
		
		dto.setProjectId(projectId);
		dto.setUserid(userId);
		
		
		DashBoardDto Boarddto = dbsvc.checkPreset(dto);
		assetList = dbsvc.presetData(Boarddto);

		
		logger.info("Boarddto : " + Boarddto);
		logger.info("assetData : " + assetList);
		
		mav.addObject("Boarddto",Boarddto);
		mav.addObject("assetData", assetList);
		
		
		mav.setViewName("/dashboard/dashview");
		
		
		return mav;
	}
	
	@RequestMapping(value = "/dashboard/dashview", method = RequestMethod.POST)
	public ModelAndView dashBoardViewProc() {
		ModelAndView mav = new ModelAndView();
		
		logger.info("project start /dashboard view");
		
		return mav;
	}
}
