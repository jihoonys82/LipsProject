package lips.utils;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import lips.userinfo.dto.User;

public class MailSender {
	public MailSender(User user,HttpServletRequest request,String subject, String body) {
		
		String host = "smtp.gmail.com";
		final String username = "lipsmailsender";
		final String password = "q1w2e3r4!@#";
		int port = 465;
		
		String recipient = user.getEmail();
		
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
	}
}
