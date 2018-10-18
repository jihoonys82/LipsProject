package lips.userinfo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import lips.userinfo.dao.UserDao;
import lips.userinfo.dto.User;

@Service
public class CustomeUserDetailsService implements UserDetailsService {
	@Autowired UserDao dao;


	@Override
	public User loadUserByUsername(String username) throws UsernameNotFoundException {
		User userinfo;
		
		if(!username.contains("@")) {
			userinfo = dao.selUserById(username);
		}else {
			userinfo = dao.selUserByEmail(username);
		}
		return userinfo;
	}
	
	public void join(User user) {
		dao.inUser(user);
	}
}
