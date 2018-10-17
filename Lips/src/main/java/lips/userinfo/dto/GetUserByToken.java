package lips.userinfo.dto;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;

public class GetUserByToken extends User{
	private static final Logger logger = LoggerFactory.getLogger(GetUserByToken.class);
	public User GetUserToken() {
		
		Object userTokenData = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		User user;
		if(userTokenData instanceof User) {
			user = ((User)userTokenData);
		}else {
			user = null;
			
		}
		return user;
	}
}
