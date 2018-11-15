package lips.issue.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lips.issue.dao.IssueDao;
import lips.issue.dto.IssueDto;
import lips.userinfo.dto.User;
import lips.userinfo.dto.UserByToken;

public class IssueInterceptor extends HandlerInterceptorAdapter{
	@Autowired IssueDao issueDao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		User user = new UserByToken().getInstance();
		IssueDto issueDto = new IssueDto();
		issueDto.setIssueId(Integer.parseInt(request.getParameter("issueId")));
		String issueCreater = issueDao.selIssueByIssueId(issueDto).getCreateUser();
		if(user.getUserId().equals(issueCreater)) {
			return true;
		}else {
			response.sendRedirect("/issue/main");
			return false;
		}
		
	}
}
