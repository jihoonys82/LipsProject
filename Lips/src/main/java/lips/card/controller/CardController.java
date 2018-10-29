package lips.card.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lips.card.dto.CardDto;
import lips.card.service.CardService;

@Controller
@RequestMapping(value = "/card")
public class CardController {
	@Autowired
	CardService csvc;
	private static final Logger logger = LoggerFactory.getLogger(CardController.class);
	
	@RequestMapping(value = "/cardcontroll", method = RequestMethod.GET)
	public ModelAndView cardController(
			@RequestParam(required=false,defaultValue="0") int positionX ,
			@RequestParam(required=false,defaultValue="0") int dashboardId,
			CardDto dto
			) {
		ModelAndView mav = new ModelAndView();
		if(dashboardId!=0) {
			List<CardDto> selCard = new ArrayList<CardDto>();
			selCard = csvc.YLocationList(dto);
			mav.addObject("selCard", selCard);
			mav.setViewName("card/cardcontroll");
			
		}else {
			mav.setViewName("card/nocustomcard");
		}
		return mav;
	}
	@RequestMapping(value = "/assetList", method = RequestMethod.GET)
	public ModelAndView AssetList(
			@RequestParam(required=false,defaultValue="0") int positionX,
			@RequestParam(required=false,defaultValue="0") int positionY ) {
		ModelAndView mav = new ModelAndView();
		
		List<CardDto> selCard = new ArrayList<CardDto>();
		selCard = csvc.AllCardList();
		
		logger.info(selCard.toString());
		logger.info(positionX+","+positionY);
		mav.addObject("sellocation", "positionX="+positionX+"&"+"positionY="+positionY);
		
		
		mav.addObject("selCard", selCard);
		
		mav.setViewName("card/assetList");
		
		
		return mav;
	}

	@RequestMapping(value = "/customcard", method = RequestMethod.GET)
	public ModelAndView customcard(
			@RequestParam(required=false,defaultValue="0") int positionX,
			@RequestParam(required=false,defaultValue="0") int positionY,
			int assetId, CardDto dto) {
		ModelAndView mav = new ModelAndView();
		logger.info(dto.toString());
		
		return mav;
	}

	@RequestMapping(value = "/card1", method = RequestMethod.GET)
	public ModelAndView card1(
			@RequestParam(required=false,defaultValue="0") int dashboardId,
			@RequestParam(required=false,defaultValue="0") int positionX ,
			@RequestParam(required=false,defaultValue="0") int positionY,
			CardDto dto
			
			) {
		ModelAndView mav = new ModelAndView();
		if(dashboardId != 0) {
		String CardValue = csvc.CardValue(dto);
			mav.addObject("cardvalue", CardValue);
			
		}
		
		mav.setViewName("card/card1");
		
		return mav;
	}
	
	@RequestMapping(value = "/card2", method = RequestMethod.GET)
	public ModelAndView card2(
			@RequestParam(required=false,defaultValue="0") int dashboardId,
			@RequestParam(required=false,defaultValue="0") int positionX ,
			@RequestParam(required=false,defaultValue="0") int positionY,
			CardDto dto
			) {
		ModelAndView mav = new ModelAndView();
		String CardValue = csvc.CardValue(dto);
		mav.addObject("cardvalue", CardValue);
		
		mav.setViewName("card/card2");
		
		return mav;
	}
	
	@RequestMapping(value = "/card3", method = RequestMethod.GET)
	public ModelAndView card3(
			@RequestParam(required=false,defaultValue="0") int dashboardId,
			@RequestParam(required=false,defaultValue="0") int positionX ,
			@RequestParam(required=false,defaultValue="0") int positionY,
			CardDto dto
			) {
		ModelAndView mav = new ModelAndView();
		String CardValue = csvc.CardValue(dto);
		mav.addObject("cardvalue", CardValue);
		
		mav.setViewName("card/card3");
		
		return mav;
	}
	
	@RequestMapping(value = "/card4", method = RequestMethod.GET)
	public ModelAndView card4(
			@RequestParam(required=false,defaultValue="0") int dashboardId,
			@RequestParam(required=false,defaultValue="0") int positionX ,
			@RequestParam(required=false,defaultValue="0") int positionY,
			CardDto dto
			) {
		ModelAndView mav = new ModelAndView();
		String CardValue = csvc.CardValue(dto);
		mav.addObject("cardvalue", CardValue);
		
		mav.setViewName("card/card4");
		
		return mav;
	}
	
	@RequestMapping(value = "/card5", method = RequestMethod.GET)
	public ModelAndView card5(
			@RequestParam(required=false,defaultValue="0") int dashboardId,
			@RequestParam(required=false,defaultValue="0") int positionX ,
			@RequestParam(required=false,defaultValue="0") int positionY,
			CardDto dto
			) {
		ModelAndView mav = new ModelAndView();
		String CardValue = csvc.CardValue(dto);
		mav.addObject("cardvalue", CardValue);
		
		mav.setViewName("card/card5");
		
		return mav;
	}
	
	@RequestMapping(value = "/card6", method = RequestMethod.GET)
	public ModelAndView card6(
			@RequestParam(required=false,defaultValue="0") int dashboardId,
			@RequestParam(required=false,defaultValue="0") int positionX ,
			@RequestParam(required=false,defaultValue="0") int positionY,
			CardDto dto
			) {
		ModelAndView mav = new ModelAndView();
		String CardValue = csvc.CardValue(dto);
		mav.addObject("cardvalue", CardValue);
		
		mav.setViewName("card/card6");
		
		return mav;
	}
	
	@RequestMapping(value = "/card7", method = RequestMethod.GET)
	public ModelAndView card7(
			@RequestParam(required=false,defaultValue="0") int dashboardId,
			@RequestParam(required=false,defaultValue="0") int positionX ,
			@RequestParam(required=false,defaultValue="0") int positionY,
			CardDto dto
			) {
		ModelAndView mav = new ModelAndView();
		String CardValue = csvc.CardValue(dto);
		mav.addObject("cardvalue", CardValue);
		
		mav.setViewName("card/card7");
		
		return mav;
	}
	
	@RequestMapping(value = "/card8", method = RequestMethod.GET)
	public ModelAndView card8(
			@RequestParam(required=false,defaultValue="0") int dashboardId,
			@RequestParam(required=false,defaultValue="0") int positionX ,
			@RequestParam(required=false,defaultValue="0") int positionY,
			CardDto dto
			) {
		ModelAndView mav = new ModelAndView();
		String CardValue = csvc.CardValue(dto);
		mav.addObject("cardvalue", CardValue);
		
		mav.setViewName("card/card8");
		
		return mav;
	}
	
	@RequestMapping(value = "/card9", method = RequestMethod.GET)
	public ModelAndView card9(
			@RequestParam(required=false,defaultValue="0") int dashboardId,
			@RequestParam(required=false,defaultValue="0") int positionX ,
			@RequestParam(required=false,defaultValue="0") int positionY,
			CardDto dto
			) {
		ModelAndView mav = new ModelAndView();
		String CardValue = csvc.CardValue(dto);
		mav.addObject("cardvalue", CardValue);
		
		mav.setViewName("card/card9");
		
		return mav;
	}
}
