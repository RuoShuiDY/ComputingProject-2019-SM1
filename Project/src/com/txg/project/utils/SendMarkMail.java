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
import com.txg.project.queryDomain.QueryMarkDomain;

public class SendMarkMail extends Thread {

	private QueryMarkDomain queryMarkDomain;


	public SendMarkMail(QueryMarkDomain queryMarkDomain) {
		// TODO Auto-generated constructor stub
		this.queryMarkDomain = queryMarkDomain;
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
			String emailContent = "Dear "+queryMarkDomain.getStudentSurname()+",</br>"+
					"This email mainly reminds you that your result in "+queryMarkDomain.getClassId()+" "+queryMarkDomain.getSemester()+" "+queryMarkDomain.getYear()+" class has been published.</br>"+
					"The details are:</br>"+
					"Assignment: "+queryMarkDomain.getAssignment()+"</br>"+
					"Your  mark: "+queryMarkDomain.getMarks()+"</br>"+
					"Total mark: "+queryMarkDomain.getMaxMark()+"</br>"+
					"Comment From Marker: "+queryMarkDomain.getComment()+"</br></br/></br>"+
					"Kind regards.</br>"+
					"Marking Assist Group";

			System.out.println(emailContent);
			// 创建默认的 MimeMessage 对象
			MimeMessage message = new MimeMessage(session);

			// Set From: 头部头字段
			message.setFrom(new InternetAddress(from));

			// Set To: 头部头字段
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(queryMarkDomain.getTutorEmail()));

			// Set Subject: 头部头字段
			message.setSubject("Mark released");

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
			Transport.send(message);
			System.out.println("Sent message successfully");
		} catch (MessagingException mex) {
			mex.printStackTrace();
		}

	}

}
