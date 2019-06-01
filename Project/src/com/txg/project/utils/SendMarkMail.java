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
		// �����˵�������
		String from = "2430070746@qq.com";
		// ָ�������ʼ�������Ϊ smtp.qq.com
		String host = "smtp.qq.com"; // QQ �ʼ�������
		// ��ȡϵͳ����
		Properties properties = System.getProperties();
		// �����ʼ�������
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
		// ��ȡĬ��session����
		Session session = Session.getDefaultInstance(properties, new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("2430070746@qq.com", "uxccpidrsldtebcc"); // �������ʼ��û���������
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
			// ����Ĭ�ϵ� MimeMessage ����
			MimeMessage message = new MimeMessage(session);

			// Set From: ͷ��ͷ�ֶ�
			message.setFrom(new InternetAddress(from));

			// Set To: ͷ��ͷ�ֶ�
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(queryMarkDomain.getTutorEmail()));

			// Set Subject: ͷ��ͷ�ֶ�
			message.setSubject("Mark released");

			// ������Ϣ��
			//message.setText(emailContent);

			Multipart mainPart = new MimeMultipart();
			// ����һ������HTML���ݵ�MimeBodyPart
			BodyPart html = new MimeBodyPart();
			// ����HTML����
			html.setContent(emailContent, "text/html; charset=utf-8");
			mainPart.addBodyPart(html);
			// ��MiniMultipart��������Ϊ�ʼ�����
			message.setContent(mainPart);

			// ������Ϣ
			Transport.send(message);
			System.out.println("Sent message successfully");
		} catch (MessagingException mex) {
			mex.printStackTrace();
		}

	}

}
