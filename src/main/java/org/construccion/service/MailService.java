package org.construccion.service;

import javax.mail.MessagingException;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//MailSevice interface
//author : Marco, Acuna.
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
public interface MailService {

	public void send(String from, String subject, String text, String to);
	
	public void sendHtml(String from, String subject, String text, String to) throws MessagingException;

}
