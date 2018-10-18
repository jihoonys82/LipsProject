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
		
		return mav;
	}
}
