package lips.userinfo.utils;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import lips.userinfo.dto.User;
import lips.userinfo.dto.UserTracker;
import lips.userinfo.service.CustomeUserDetailsService;

@Component
public class CustomeAuthenticationProvider implements AuthenticationProvider{
	
	@Autowired CustomeUserDetailsService service;
	@Autowired UserTracker userTracker;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		UsernamePasswordAuthenticationToken authToken = (UsernamePasswordAuthenticationToken) authentication; // 유저가 입력한
																										// 이이디비번으으로만든다.(로그인한
																												// 유저아이디비번정보를담는다)	

		User userInfo = service.loadUserByUsername(authToken.getName()); // UserDetailsService에서
																		// 유저정보를 불러온다.
		if (userInfo == null) {
			throw new UsernameNotFoundException(authToken.getName());
		}

		if (!matchPassword(userInfo.getPassword(), authToken.getCredentials())) {
			throw new BadCredentialsException("not matching username or password");
		}

		List<GrantedAuthority> authorities = (List<GrantedAuthority>) userInfo.getAuthorities();
		userTracker.setUserTrack(authorities, true); //로그인트래커 추가
		return new UsernamePasswordAuthenticationToken(userInfo, null, authorities);//null은 크리덴셜을 제거하기 위함이다.
	}

	private boolean matchPassword(String password, Object credentials) {
		return password.equals(credentials);
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}
}
