package lips.card.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lips.card.service.CardService;

@Controller
@RequestMapping(value = "/card")
public class CardController {
	@Autowired
	CardService csvc;
	private static final Logger logger = LoggerFactory.getLogger(CardController.class);
	
	@RequestMapping(value = "/card1", method = RequestMethod.GET)
	public ModelAndView card1() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("Test" , "TestCard1");
		
		mav.setViewName("card/card1");
		return mav;
	}
	@RequestMapping(value = "/card2", method = RequestMethod.GET)
	public ModelAndView card2() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("card/card2");
		return mav;
	}
	@RequestMapping(value = "/card3", method = RequestMethod.GET)
	public ModelAndView card3() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("card/card3");
		return mav;
	}
	@RequestMapping(value = "/card4", method = RequestMethod.GET)
	public ModelAndView card4() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("card/card4");
		return mav;
	}
	@RequestMapping(value = "/card5", method = RequestMethod.GET)
	public ModelAndView card5() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("card/card5");
		return mav;
	}
	@RequestMapping(value = "/card6", method = RequestMethod.GET)
	public ModelAndView card6() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("card/card6");
		return mav;
	}
	@RequestMapping(value = "/card7", method = RequestMethod.GET)
	public ModelAndView card7() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("card/card7");
		return mav;
	}
	@RequestMapping(value = "/card8", method = RequestMethod.GET)
	public ModelAndView card8() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("card/card8");
		return mav;
	}
	@RequestMapping(value = "/card9", method = RequestMethod.GET)
	public ModelAndView card9() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("card/card9");
		return mav;
	}
}
