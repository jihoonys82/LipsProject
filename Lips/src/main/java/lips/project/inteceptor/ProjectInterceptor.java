package lips.project.inteceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lips.project.dao.ProjectDao;
import lips.userinfo.dto.User;
import lips.userinfo.dto.UserByToken;

public class ProjectInterceptor extends HandlerInterceptorAdapter {
	@Autowired ProjectDao dao;
	
@Override
public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
		throws Exception {
	User user = new UserByToken().getInstance();
	String ProjectLeader=dao.selProbyProId(request.getParameter("projectId")).getProjectLeader();
	
	System.out.println(user.getUserId());
	System.out.println(ProjectLeader);
	
	if(user.getUserId().equals(ProjectLeader)) {
		return true;
	}
	
	
	response.sendRedirect("/project/main");
	return false;
}


@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
			super.postHandle(request, response, handler, modelAndView);
	}
}
