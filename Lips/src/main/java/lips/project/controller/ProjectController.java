package lips.project.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lips.project.dto.ProjectDto;
import lips.project.service.ProjectService;
import lips.userinfo.dto.User;

@Controller
@RequestMapping(value = "/project")
public class ProjectController {

	@Autowired
	ProjectService service;
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);

	// 프로젝트 기본 페이지
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void project(String create, HttpSession session, ModelAndView mav) {
		logger.info("project탭 활성화");
		
//		User user = (User)session.getAttribute("user");
//		
//		
//		
//		mav.addObject("userProjectInfo", service.selPro(user));
		mav.setViewName("project/main");
		

		
	}

	// 프로젝트 생성페이지
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String projectCreate() {
		logger.info("project 생성 페이지 활성화");

		return "project/create";
	}

	// 프로젝트 생성처리
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String projectCreateProc(ProjectDto dto,HttpSession session) {
		logger.info("----------------------------------");
		logger.info(dto.toString());
		User user = (User)session.getAttribute("user");
		System.out.println("유저나오니?"+user.toString());
		int create =service.inPro(dto,user);
	
		if(create>=0) {
			return "redirect:/project/main?create=success";	
		}
		else {
			return "redirect:/project/main?create=fail";
		}

	}

	// 프로젝트 수정 페이지
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void projectUpdate(ProjectDto dto) {

	}

	// 프로젝트 수정 페이지 프로세스
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public void projectUpdateProc(ProjectDto dto) {

	}

	// 프로젝트 삭제 프로세스
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public void projectDeleteProc(ProjectDto dto) {

	}
}
