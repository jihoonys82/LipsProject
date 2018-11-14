package lips.guide.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
@RequestMapping(value="/guide")
public class GuideController {
	
//	private static final Logger logger = LoggerFactory.getLogger();
	
	/**
	 * 가이드 화면 출력
	 */
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public void main() {
		return;
	}
}
