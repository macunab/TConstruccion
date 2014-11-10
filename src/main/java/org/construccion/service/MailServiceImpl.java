package org.construccion.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//MailService Implementation
//author : Marco, Acuna.
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
public class MailServiceImpl implements MailService {

	/** wrapper de Spring sobre javax.mail */
	private JavaMailSenderImpl mailSender;

	public void setMailSender(JavaMailSenderImpl mailSender) {
		this.mailSender = mailSender;
	}

	// private static final File[] NO_ATTACHMENTS = null;

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
	public void send(String from, String subject, String text, String to) {

		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom(from);
		message.setTo(to);
		message.setSubject(subject);
		message.setText(text + from);

		this.mailSender.send(message);

	}

	public void sendHtml(final String from, final String subject,
			final String text, final String to) throws MessagingException {

		MimeMessage message = this.mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);

		helper.setTo(to);
		helper.setSubject(from);
		helper.setText(text, true);

		this.mailSender.send(message);

	}

}
