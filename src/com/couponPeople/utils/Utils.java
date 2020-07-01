package com.couponPeople.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Utils {

	Myproperties mp = new Myproperties();
	Properties pp = mp.getProperties();

	private String salt = pp.getProperty("HASH_KEY");
	private String user = mp.getProperties().getProperty("MAIL_ADDRESS");
	private String password = mp.getProperties().getProperty("MAIL_PASSWORD");
	private Properties prop = new Properties();

	public Utils() {
		// TODO Auto-generated constructor stub
	}

	public String hashFunction(String data) {

		String SHA = "";
		String str = data + salt;

		try {

			MessageDigest sh = MessageDigest.getInstance("SHA-256");
			sh.update(str.getBytes());
			byte byteData[] = sh.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			SHA = sb.toString();

		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			SHA = null;
		}

		return SHA;

	}

	public String createUUID() {

		UUID uuid = UUID.randomUUID();

		return uuid.toString().replace("-", "").trim();

	}

	public void sendVerifyGmail(String receiveUser, String content) {

		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));

			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiveUser));

			message.setSubject("VERIFY YOUR EMAIL!");

			message.setContent("CLICK <a href=\"http://localhost:8085/Coupon_People_Ver2/users/verifyEmailAction.us?emailSecret="
					+ content + "\">HERE</a> TO VERIFY YOUR EMAIL!", "text/html");

			Transport.send(message);

		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public boolean sendPasswordResetGmail(String receiveUser, String content) {

		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));

			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiveUser));

			message.setSubject("RESET YOUR PASSWORD?");

			message.setContent("CLICK <a href=\"http://localhost:8085/Coupon_People_Ver2/users/resetPasswordOkAction.us?emailSecret="
					+ content + "\">HERE</a> TO RESET YOUR PASSWORD!", "text/html");

			Transport.send(message);

		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

		return true;
	}

}
