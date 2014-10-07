package org.construccion.service;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;

public class MailServiceImpl implements MailService {

	/** wrapper de Spring sobre javax.mail */
	private JavaMailSenderImpl mailSender;

	public void setMailSender(JavaMailSenderImpl mailSender) {
		this.mailSender = mailSender;
	}

	//private static final File[] NO_ATTACHMENTS = null;

	/**
	 * envío de email
	 * 
	 * @param to
	 *            correo electrónico del destinatario
	 * @param subject
	 *            asunto del mensaje
	 * @param text
	 *            cuerpo del mensaje
	 */
	public void send(String from, String subject, String text) {

		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom(from);
		message.setTo("ferreteria.oneclick@gmail.com");
		message.setSubject(subject);
		message.setText(text + from);

		this.mailSender.send(message);

	}

}
