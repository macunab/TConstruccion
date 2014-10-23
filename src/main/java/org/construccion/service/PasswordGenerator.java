package org.construccion.service;

public class PasswordGenerator {

	private String caracteres = "qwertyuiopasdfghjklñzxcvbnmQWERTYUIOPASDFGHJKLÑZXCVBNM1234567890";
	private StringBuffer buffer = new StringBuffer();

	public PasswordGenerator() {

	}

	public String GeneratedPassword() {

		for (int i = 0; i < caracteres.length(); i++) {

			double index = Math.random() * caracteres.length();
			buffer.append(caracteres.charAt((int) index));
		}
		return buffer.toString();
	}

}
