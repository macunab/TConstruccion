package org.construccion.models;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "usuario")
public class Usuario {

	@Id
	@Column(name = "username")
	private String username;

	@Column(name = "password")
	private String password;

	@Column(name = "enable")
	private boolean enable;

	@Column(name = "avatar")
	private String urlAvatar;

	@OneToOne(fetch = FetchType.LAZY, mappedBy = "usuario", cascade = CascadeType.ALL)
	private Grupo rol;

	public Usuario() {

	}

	public Usuario(String username, String password, boolean enable,
			String urlAvatar, Grupo rol) {
		this.username = username;
		this.password = password;
		this.enable = enable;
		this.urlAvatar = urlAvatar;
		this.rol = rol;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isEnable() {
		return enable;
	}

	public void setEnable(boolean enable) {
		this.enable = enable;
	}

	public String getUrlAvatar() {
		return urlAvatar;
	}

	public void setUrlAvatar(String urlAvatar) {
		this.urlAvatar = urlAvatar;
	}

	public Grupo getRol() {
		return rol;
	}

	public void setRol(Grupo rol) {
		this.rol = rol;
	}

}
