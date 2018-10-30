package lips.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lips.project.dto.ProjectDto;
import lips.project.dto.ProjectMemberDto;
import lips.project.service.ProjectService;
import lips.userinfo.dto.User;
import lips.userinfo.dto.UserByToken;

@Controller
@RequestMapping(value = "/project")
public class ProjectController {

	
	@Autowired
	ProjectService service;
	String invitecode; 
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);

	// 프로젝트 기본 페이지
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public ModelAndView project(String create, ModelAndView mav) {
		logger.info("project탭 활성화");
		
//		// 내가 던져준 애 . 받은 객체 . 그 중에 토큰 정보 . 내가지정한 값
//		Object user = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		User loginUser = null;
//		// 토큰에서 받아온 유저랑 비교한다(데이터타입을) dto유저랑
//		if (user instanceof User) {
//			loginUser = (User) user;
//		} else {
//			logger.info(user.toString());
//		}
//		
		////////////////////////
		
		User user = new UserByToken().getInstance();
	
	
		List<ProjectDto> list = service.ProjectMain(user);

		
		
		mav.addObject("userProjectInfo", list);
		mav.addObject("user",user);
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
	public @ResponseBody Map<String,String> projectCreateProc(ProjectDto dto) {
	
		User user = new UserByToken().getInstance();
		invitecode= service.inPro(dto, user);
		
		HashMap<String,String> map = new HashMap<>();
	
		map.put("invitecode", invitecode);
		
		return map;
		 

	}
	//프로젝트 참가	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void projectjoin() {

		}
	
	//프로젝트 참가 처리
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public void projectjoinProc(String invitecode,HttpServletResponse resp) {
		
		   resp.setContentType("application/json; charset=utf-8");
		   PrintWriter out;
	
		   
		   		User user = new UserByToken().getInstance();
				
				ProjectDto dto = new ProjectDto();
				dto.setInvitecode(invitecode);
				
				int result = service.joinPro(dto,user);
				
				 try {
					out = resp.getWriter();
					out.append("{\"result\":"+result+"}");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
	
		}

	// 프로젝트 수정 페이지
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public ModelAndView projectUpdate(ProjectDto dto,ModelAndView mav) {
	User user = new UserByToken().getInstance();
	Map map = service.updatepage(dto,user);
	
	
	mav.addObject("updatePageinfo",map);
	mav.setViewName("project/update");

	
	//20181024 여기까지함 업데이트페이지에 유저정보와 프로젝트 정보를 전달

	
	return mav;
	}

	// 프로젝트 수정 페이지 프로세스
	@RequestMapping(value = "/update/project", method = RequestMethod.POST)
	public void projectUpdateProc(ProjectDto dto) {

	}
	
	//프로젝트 수정 페이지 유저 프로세스(유저 레벨 변경 밴)
	@RequestMapping(value="/update/member/ban", method =RequestMethod.POST)
	public void projectUpdateProMemberBan(ProjectMemberDto dto, HttpServletResponse resp) {
		
		
		System.out.println("하하하하");
		System.out.println(dto.getUserId());
		System.out.println(dto.getProjectId());
		resp.setContentType("application/json; charset=utf-8");
		 PrintWriter out;
		dto = service.UpdateProjectMemberBan(dto);
		
		
		System.out.println("촤하하하");
		System.out.println(dto.getUserId());
		System.out.println(dto.getProjectId());
		
		int result = dto.getUserLevel();
		
		try {
			out = resp.getWriter();
			out.append("{\"result\":"+result+"}");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
	}
	
	//프로젝트 수정 페이지 유저 프로세스(밴 해제)
	@RequestMapping(value="/update/member/pardon", method =RequestMethod.POST)
	public void projectUpdateProMemberPardon(ProjectMemberDto dto, HttpServletResponse resp) {
		
		
		System.out.println("하하하하");
		System.out.println(dto.getUserId());
		System.out.println(dto.getProjectId());
		resp.setContentType("application/json; charset=utf-8");
		 PrintWriter out;
		dto = service.UpdateProjectMemberPardon(dto);
		
		
		System.out.println("촤하하하");
		System.out.println(dto.getUserId());
		System.out.println(dto.getProjectId());
		
		int result = dto.getUserLevel();
		
		try {
			out = resp.getWriter();
			out.append("{\"result\":"+result+"}");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
	}

	// 프로젝트 삭제 프로세스
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public void projectDeleteProc(ProjectDto dto) {

	}
}