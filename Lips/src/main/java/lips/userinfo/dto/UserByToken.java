package lips.userinfo.dto;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;

public class UserByToken{
	private static final Logger logger = LoggerFactory.getLogger(UserByToken.class);
	public User getInstance() {
		Object userTokenData = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user;
		if(userTokenData instanceof User) {
			user = ((User)userTokenData);
		}else {
			user = null;
			logger.warn("유저 객체를 불러올 수 없습니다.");
		}
		return user;
	}
}
