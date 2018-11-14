package lips.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import lips.issue.dto.IssueCategoryDto;
import lips.project.dao.ProjectDao;
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
	@Autowired ProjectDao dao;
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
	
	// 모든 프로젝트 보여주는 페이지
	@RequestMapping(value = "/main/all", method = RequestMethod.GET)
	public ModelAndView project(ModelAndView mav) {
		User user = new UserByToken().getInstance();
		mav.addObject("user",user);
		mav.addObject("projectInfo", service.AllOpenProject());
		mav.setViewName("project/allProjectmain");
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
	public ModelAndView projectUpdateProc(HttpServletResponse resp, ProjectDto dto, String invitecode) {
		resp.setContentType("application/json; charset=utf-8");

		
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("jsonView");
		service.projectUpdate(dto,invitecode);
		mav.addObject("ProjectKey",dto.getProjectKey());
		mav.addObject("ProjectName",dto.getProjectName());
	
	
		
		return mav;

	}
	
	//프로젝트 수정 페이지 유저 프로세스(유저 레벨 변경 밴)
	@RequestMapping(value="/update/member/ban", method =RequestMethod.POST)
	public void projectUpdateProMemberBan(ProjectMemberDto dto, HttpServletResponse resp) {
		
		
	
		resp.setContentType("application/json; charset=utf-8");
		 PrintWriter out;
		dto = service.UpdateProjectMemberBan(dto);

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
		
		
		resp.setContentType("application/json; charset=utf-8");
		 PrintWriter out;
		dto = service.UpdateProjectMemberPardon(dto);
		

		
		int result = dto.getUserLevel();
		
		try {
			out = resp.getWriter();
			out.append("{\"result\":"+result+"}");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	//초대코드 재생성 프로세스
	@RequestMapping(value = "/reinvitecode", method = RequestMethod.POST)
	public void inviteRefresh(ProjectDto dto,HttpServletResponse resp) {
		resp.setContentType("application/json; charset=utf-8");
		 PrintWriter out;
		String result = UUID.randomUUID().toString().split("-")[4]+"_"+dto.getProjectKey();
		try {
			
			out = resp.getWriter();
			out.append("{\"result\":\""+result+"\"}");
			//int 나 map 넘길때 out.append("{\"result\":"+result+"}");
			//string 넘길때 out.append("{\"result\":\""+result+"\"}");
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	// 프로젝트 종료처리 프로세스
	@RequestMapping(value = "/close", method = RequestMethod.POST)
	public void projectDeleteProc(ProjectDto dto,HttpServletResponse resp) {
		resp.setContentType("application/json; charset=utf-8");
		 PrintWriter out;
		 service.delPro(dto);
		 
		 
	
			try {
				
				String result = "프로젝트잘끝냈지롱";
				out = resp.getWriter();
				out.append("{\"result\":\""+result+"\"}");
				
				
			} catch (IOException e) {
		
				e.printStackTrace();
			}
		
	}
	
	
	// 프로젝트 리더넘기기 프로세스
	@RequestMapping(value = "/update/leader", method = RequestMethod.POST)
	public void projectLeader(ProjectDto dto,HttpServletResponse resp) {
		resp.setContentType("application/json; charset=utf-8");
		 PrintWriter out;
		
		 service.leaderAuthorize(dto);
		 
		 
	
			try {
				
				String result = "프로젝트 리떠 위임 짤 했찌롱~";
				out = resp.getWriter();
				out.append("{\"result\":\""+result+"\"}");
				
				
			} catch (IOException e) {
		
				e.printStackTrace();
			}
		
	}
	
	@RequestMapping(value="/update/category", method=RequestMethod.POST)
	public ModelAndView uPCate (String arrlist, int projectId) {
		//제이슨 객체 배열 받기
		//01. 제이슨 객체를 문자열로받음 ( 리스트로 받으니까 , 기준으로 짤라버림)

		//02. gson 객체 생성
		Gson gson = new Gson();
		
		//03. 리스트 생성하기 
		List<IssueCategoryDto> icDtos = new ArrayList<>();
		
		//04. 문자열을              지슨을 사용해서 제이슨 형식에 맞춰 잘라주기 ,   뉴 어레이리스트 해서 클래스 가져오기
		List<String> dtos = gson.fromJson(arrlist, new ArrayList<>().getClass());
		
		//05. 포이치 돌려서 자른 문자열을  dto객체형식그로 변환하기
		for(String s : dtos) {
			IssueCategoryDto dto = new IssueCategoryDto();
			
			dto = gson.fromJson(s, IssueCategoryDto.class);
			// 디티오 리스트에 저장
			icDtos.add(dto);
		}
		
	
		service.categoryUp(icDtos,projectId);
		ProjectDto a = new ProjectDto();
		a.setProjectId(projectId);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", dao.selIssueCateAs(a));
		mav.setViewName("jsonView");
		return mav;
		
		
	}
	
}