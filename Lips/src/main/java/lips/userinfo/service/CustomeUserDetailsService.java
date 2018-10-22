package lips.userinfo.service;

import java.util.Properties;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import lips.userinfo.dao.UserDao;
import lips.userinfo.dto.User;

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

	public String sendMail(User user,HttpServletRequest request) {
		UUID uid = UUID.randomUUID();
		String code = uid.toString().split("-")[0];
		
		String host = "smtp.gmail.com";
		final String username = "lipsmailsender";
		final String password = "q1w2e3r4!@#";
		int port = 465;
		
		String recipient = user.getEmail();
		String subject = "Lips 회원가입 메일 인증";
		String body = "안녕하세요 Lips 입니다. \r\n" +
					"이메일 인증란에 " + code + " 를 입력해 주세요.";
		
		Properties props = System.getProperties();
		
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			
			String un = username;
			String pw = password;
			protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
				return new javax.mail.PasswordAuthentication(un,pw);
			}
			
		});
		session.setDebug(true);
		
		Message mimeMessage = new MimeMessage(session);
		try {
			mimeMessage.setFrom(new InternetAddress("lipsmailsender@gmail.com"));
			
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
		
			mimeMessage.setSubject(subject);
			mimeMessage.setText(body);
			Transport.send(mimeMessage);
			
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {	
			e.printStackTrace();
		}
		
		return code;
	}
}
