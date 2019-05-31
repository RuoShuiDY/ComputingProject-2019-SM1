package com.txg.project.utils;

import java.security.GeneralSecurityException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import com.sun.mail.util.MailSSLSocketFactory;
import com.txg.project.domain.TutorLesson;

public class SendInviteMail extends Thread {

	private String tutor_email;
	private String lecturer_email;
	private TutorLesson tutorLesson;
	boolean newTutor;

	public SendInviteMail(String lecturer_email,String tutor_email, TutorLesson tutorLesson, boolean newTutor) {
		// TODO Auto-generated constructor stub
		this.lecturer_email=lecturer_email;
		this.tutor_email = tutor_email;
		this.tutorLesson = tutorLesson;
		this.newTutor = newTutor;
	}

	@Override
	public void run() {
		// 发件人电子邮箱
		String from = "2430070746@qq.com";
		// 指定发送邮件的主机为 smtp.qq.com
		String host = "smtp.qq.com"; // QQ 邮件服务器
		// 获取系统属性
		Properties properties = System.getProperties();
		// 设置邮件服务器
		properties.setProperty("mail.smtp.host", host);
		properties.put("mail.smtp.auth", "true");
		MailSSLSocketFactory sf = null;
		try {
			sf = new MailSSLSocketFactory();
		} catch (GeneralSecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sf.setTrustAllHosts(true);
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.ssl.socketFactory", sf);
		// 获取默认session对象
		Session session = Session.getDefaultInstance(properties, new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("2430070746@qq.com", "uxccpidrsldtebcc"); // 发件人邮件用户名、密码
			}
		});

		try {
			String emailContent = "This email is a tutor invitation.</br>" + "You are invited as a tutor of "
					+ tutorLesson.getLesson().getClassDict().getClassId() + " class " + "in "
					+ tutorLesson.getLesson().getSemester() + " of " + tutorLesson.getLesson().getYear() + ".</br>";
			if (newTutor == true) {
				emailContent += "It seems that you are a new user of this system.</br>"
						+ "You may login this system by your email address and the initial password </br>"
						+ tutorLesson.getTutor().getPassword() + ".</br>"
						+ "You can also change this password in the system.";
			}

			System.out.println(emailContent);
			// 创建默认的 MimeMessage 对象
			MimeMessage message = new MimeMessage(session);

			// Set From: 头部头字段
			message.setFrom(new InternetAddress(from));

			// Set To: 头部头字段
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(tutor_email));

			// Set Subject: 头部头字段
			message.setSubject("Tutor Invitation");

			// 设置消息体
			//message.setText(emailContent);

			Multipart mainPart = new MimeMultipart();
			// 创建一个包含HTML内容的MimeBodyPart
			BodyPart html = new MimeBodyPart();
			// 设置HTML内容
			html.setContent(emailContent, "text/html; charset=utf-8");
			mainPart.addBodyPart(html);
			// 将MiniMultipart对象设置为邮件内容
			message.setContent(mainPart);

			// 发送消息
			//Transport.send(message);
			System.out.println("Sent message successfully");
		} catch (MessagingException mex) {
			mex.printStackTrace();
		}

	}

}
