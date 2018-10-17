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
		User userinfo = null;
		userinfo = dao.selUserById(username);
		return userinfo;
	}
	
}
