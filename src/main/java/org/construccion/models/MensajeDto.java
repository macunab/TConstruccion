package org.construccion.models;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//POJO DTO MensajeDto
//author : Marco, Acuna.
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
public class MensajeDto {

	@NotEmpty(message="Tiene que ingresar un nombre.")
	private String nombre;

	@NotEmpty(message="Tiene que ingresar un email.")
	@Email(message="Tiene que ser un email valido.")
	private String email;

	@NotEmpty(message="Tiene que ingresar un mensaje.")
	private String mensaje;

	public MensajeDto(String nombre, String email, String mensaje) {
		this.nombre = nombre;
		this.email = email;
		this.mensaje = mensaje;
	}

	public MensajeDto() {

	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMensaje() {
		return mensaje;
	}

	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}

}
