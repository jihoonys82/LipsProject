package lips.main.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class mainController {
	
	private static final Logger logger = LoggerFactory.getLogger(mainController.class);

	
	//인트로
	@RequestMapping(value = "/intro", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("intro 활성화");
		
		
		return "intro";
	}
	
}
