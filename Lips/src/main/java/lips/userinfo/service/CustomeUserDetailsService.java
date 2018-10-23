package lips.userinfo.service;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import lips.userinfo.dao.UserDao;
import lips.userinfo.dto.User;
import lips.utils.MailSender;

@Service
public class CustomeUserDetailsService implements UserDetailsService {
	@Autowired
	UserDao dao;

	@Override
	public User loadUserByUsername(String username) throws UsernameNotFoundException {
		User userinfo;

		if (!username.contains("@")) {
			userinfo = dao.selUserById(username);
		} else {
			userinfo = dao.selUserByEmail(username);
		}
		return userinfo;
	}

	public void join(User user) {
		dao.inUser(user);
	}

	public boolean checkId(User user) {
		if (dao.selCntUserId(user) == 0) {
			return true;
		} else {
			return false;
		}
	}
	public boolean checkEmail(User user) {
		if ((dao.selCntUserEmail(user)) ==0){
			return true;
		}else {
			return false;
		}
	}
	public boolean searchId(User user,HttpServletRequest request) {
		User searchUser = null;
		if((searchUser = dao.selUserByEmail(user.getEmail())) != null){
			String title = "Lips 아이디 찾기 안내";
			String body = "안녕하세요 Lips 입니다. \r\n"+
							"등록된 고객님의 Lips 계정 ID 는 \r\n" +
							searchUser.getUserId()+"입니다. \r\n"+
							"감사합니다.";
			new MailSender(searchUser,request,title,body);
			return true;
		}else {
			return false;
		}
	}
	public boolean searchPw(User user,HttpServletRequest request) {
		User searchUser = null;
		searchUser = dao.selUserByEmail(user.getEmail());
		if(searchUser.getUserId().equals(user.getUserId())) {
			UUID uid = UUID.randomUUID();
			String newPw = uid.toString().split("-")[0];
			searchUser.setPw(newPw);
			dao.upUserData(searchUser);
			String title = "Lips 비밀번호 찾기 안내";
			String body = "안녕하세요 Lips 입니다. \r\n"+
							"등록된 고객님의 Lips 계정 새로운 PW는 \r\n" +
							newPw + " 입니다. \r\n"+
							"감사합니다.";
			new MailSender(searchUser,request,title,body);
			return true;
		}else {
			return false;
		}
	}

	public String sendMail(User user,HttpServletRequest request) {
		UUID uid = UUID.randomUUID();
		String code = uid.toString().split("-")[0];
		String subject = "Lips 회원가입 메일 인증";
		String body = "안녕하세요 Lips 입니다. \r\n" +
					"이메일 인증란에 " + code + " 를 입력해 주세요.";
		new MailSender(user,request,subject,body);		
		return code;
	}
}
