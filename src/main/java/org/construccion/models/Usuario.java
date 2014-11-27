package org.construccion.models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//POJO Usuario
//author : Marco, Acuna.
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
@Entity
@Table(name = "usuario")
public class Usuario {

	@Id
	@Column(name = "username")
	@NotEmpty(message = "Tiene que ingresar un email")
	@Email(message = "Ingrese un mail valido")
	private String username;

	@Column(name = "password")
	private String password;

	@Column(name = "activo")
	private boolean enable;

	@OneToOne(fetch = FetchType.LAZY, mappedBy = "usuario", cascade = CascadeType.ALL)
	private Grupo rol;

	@Column(name = "nombre")
	@NotEmpty(message = "Tiene que ingresar un nombre")
	private String nombre;

	@Column(name = "apellido")
	@NotEmpty(message = "Tiene que ingresar un apellido")
	private String apellido;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "usuario", cascade = CascadeType.ALL)
	private List<Pedido> pedidos;

	public Usuario() {

	}

	public Usuario(String username, String password, boolean enable, Grupo rol,
			String nombre, String apellido) {
		this.username = username;
		this.password = password;
		this.enable = enable;
		this.rol = rol;
		this.apellido = apellido;
		this.nombre = nombre;
		
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

	public Grupo getRol() {
		return rol;
	}

	public void setRol(Grupo rol) {
		this.rol = rol;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public List<Pedido> getPedidos() {
		return pedidos;
	}

	public void setPedidos(List<Pedido> pedidos) {
		this.pedidos = pedidos;
	}

}
