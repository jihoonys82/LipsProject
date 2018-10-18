package lips.project.controller;

import java.util.Iterator;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
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
	public ModelAndView project(String create, ModelAndView mav) {
		logger.info("project탭 활성화");
		
		// 내가 던져준 애 . 받은 객체 . 그 중에 토큰 정보 . 내가지정한 값
		Object user = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User loginUser = null;
		// 토큰에서 받아온 유저랑 비교한다(데이터타입을) dto유저랑
		if (user instanceof User) {
			loginUser = (User) user;
		} else {
			logger.info(user.toString());
		}
		
		////////////////////////
		
		System.out.println("--------------------------");
	
	
		List<ProjectDto> list = service.selPro(loginUser);

		
		
	
		mav.addObject("userProjectInfo", list);
		mav.setViewName("project/main");
		return mav;
	}

	// 프로젝트 생성페이지
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String projectCreate() {
		logger.info("project 생성 페이지 활성화");

		return "project/create";
	}

	// 프로젝트 생성처리
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public void projectCreateProc(ProjectDto dto) {
		// 내가 던져준 애 . 받은 객체 . 그 중에 토큰 정보 . 내가지정한 값
		Object user = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User loginUser = null;
		// 토큰에서 받아온 유저랑 비교한다(데이터타입을) dto유저랑
		if (user instanceof User) {
			loginUser = (User) user;
		} else {
			logger.info(user.toString());
		}
		

		 service.inPro(dto, loginUser);
		 
//		 
//		 String uniqueID = UUID.randomUUID().toString();


		
			

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
