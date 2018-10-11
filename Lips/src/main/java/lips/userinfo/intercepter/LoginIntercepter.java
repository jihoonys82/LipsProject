package lips.userinfo.intercepter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import lips.userinfo.dto.User;
import lips.userinfo.service.UserService;

public class LoginIntercepter extends HandlerInterceptorAdapter{
	
	@Autowired UserService userService;
	private static final Logger logger = LoggerFactory.getLogger(LoginIntercepter.class);
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("login");
         
        if ( obj == null ){
            Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
 
            if ( loginCookie != null ){ 
                String sessionId = loginCookie.getValue();

                User loginUser = userService.loginAuto(sessionId);
                 
                if ( loginUser != null ){
                	logger.info(loginUser.toString());
                	loginUser.setPw(null);
        			session.setAttribute("user", loginUser);
        			session.setAttribute("login", true);
        			
        			Cookie cookie = new Cookie("loginCookie", session.getId());
    				userService.addLoginServer(loginUser, session.getId());
    				cookie.setMaxAge(60*60*24*7);
    				response.addCookie(cookie);
                    response.sendRedirect("/");
                    return false;
                }
            }   
        }
        return true;
	}
}
