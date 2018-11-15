package lips.userinfo.service;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lips.userinfo.dao.UserDao;
import lips.userinfo.dto.User;
import lips.utils.MailSender;

@Service
public class CustomeUserDetailsService implements UserDetailsService {
	@Autowired	UserDao dao;
	
	@Autowired BCryptPasswordEncoder passwordEncoder;

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
		String bCryptPw = passwordEncoder.encode(user.getPw());
		user.setPw(bCryptPw);
		dao.inUser(user);
		dao.inUserAlarm(user);
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
	public void updateInfo(User user) {
		String bCryptPw = passwordEncoder.encode(user.getPw());
		user.setPw(bCryptPw);
		dao.upUserData(user);
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
			String bCryptPw = passwordEncoder.encode(newPw);
			searchUser.setPw(bCryptPw);
			dao.upUserData(searchUser);
			String title = "Lips 비밀번호 찾기 안내";
			String body = "안녕하세요 Lips 입니다. \r\n"+
							"등록된 고객님의 Lips 계정 새로운 PW는 \r\n" +
							newPw + " 입니다. \r\n"+
							"반드시 상단 메뉴바 -> 마이페이지에서 새로운 비밀번호를 등록해주시기 바랍니다. \r\n"+
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
