package lips.userinfo.interceptor;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
//	
//	@Autowired UserService userService;
//	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//			throws Exception {
//		
//        HttpSession session = request.getSession();
//        Object obj = session.getAttribute("login");
//         
//        if ( obj == null ){
//            Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
// 
//            if ( loginCookie != null ){ 
//                String sessionId = loginCookie.getValue();
//
//                User loginUser = userService.loginAuto(sessionId);
//                 
//                if ( loginUser != null ){
//                	logger.info(loginUser.toString());
//                	loginUser.setPw(null);
//        			session.setAttribute("user", loginUser);
//        			session.setAttribute("login", true);
//        			
//        			Cookie cookie = new Cookie("loginCookie", session.getId());
//    				userService.addLoginServer(loginUser, session.getId());
//    				cookie.setMaxAge(60*60*24*7);
//    				response.addCookie(cookie);
//                    response.sendRedirect("/main");
//                    return false;
//                }
//            }   
//        }
//        return true;
//	}
}