package lips.project.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lips.project.dto.ProjectDto;

@Controller
@RequestMapping(value="/project")
public class ProjectController {

	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);

	// 프로젝트 기본 페이지
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String project() {
		logger.info("project탭 활성화");

		return "project/main";
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
		logger.info("----------------------------------");
		logger.info(dto.toString());
		//20181012 여기까지함 
		//받은 dto 처리하는것부터하기 

	}

}
