package lips.userinfo.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import lips.userinfo.service.UserService;

public class UserInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired UserService userService;
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
				HttpSession session = request.getSession();
				Object obj = session.getAttribute("login");
				
				
				if ( obj == null ){ //로그인 상태가 아닐경우
					response.sendRedirect("/user/login");
					return false;
				}else {
					int state = userService.checkLoginServer(session.getId());
					
					if(state==0) {//다른사용자가 로그인한 경우
						response.sendRedirect("/user/logoutauto");
						return false;
					}
				}
				return true;
		}
		
		
}

