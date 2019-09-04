package kr.or.ddit.login.controller;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class SendEmailJoin {
	
	static String tmp = "";
	
	public void sendEmailJoin(String mem_mail) {
		
		String host = "smtp.naver.com";
		final String USER = "raonraon123";
		final String PASSWORD = "RAONraon123!";

		String to = mem_mail; // 이메일 받을 사람

		// Get the session object
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");

		Session session = Session.getDefaultInstance(props,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(USER, PASSWORD);
					}
				});
		
		// Compose the message
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(USER));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(
					to));
			Random rnd = new Random();	
			// Subject
			message.setSubject("LAON IDE에서 임시 비밀번호를 발송합니다.");
			int w = (int)(Math.random()*8999+1000);
			String a = String.valueOf((char)((int)(rnd.nextInt(26)) + 65));
			int x = (int)(Math.random()*8999+1000);
			String b = String.valueOf((char)((int)(rnd.nextInt(26)) + 65));
			int y = (int)(Math.random()*8999+1000);
			String c = String.valueOf((char)((int)(rnd.nextInt(26)) + 65));
			int z = (int)(Math.random()*8999+1000);
			String tmp = w + a + x + b + y + c + z;
			
			// Text
			message.setText("임시 비밀번호는 [ " + tmp.trim() + " ] 입니다. \n" + 
								"로그인 후 비밀번호를 변경해주세요!");
			this.tmp = tmp;
			// send the message
			Transport.send(message);

		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	
}