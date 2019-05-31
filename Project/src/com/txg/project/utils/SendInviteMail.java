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
			// ����Ĭ�ϵ� MimeMessage ����
			MimeMessage message = new MimeMessage(session);

			// Set From: ͷ��ͷ�ֶ�
			message.setFrom(new InternetAddress(from));

			// Set To: ͷ��ͷ�ֶ�
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(tutor_email));

			// Set Subject: ͷ��ͷ�ֶ�
			message.setSubject("Tutor Invitation");

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
			//Transport.send(message);
			System.out.println("Sent message successfully");
		} catch (MessagingException mex) {
			mex.printStackTrace();
		}

	}

}
