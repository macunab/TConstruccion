package org.construccion.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//POJO Grupo
//author : Marco, Acuna.
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
@Entity
@Table(name = "grupo")
public class Grupo {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "idgrupo")
	private Integer idgrupo;

	@Column(name = "rolname")
	private int permiso;

	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "usuario")
	private Usuario usuario;

	public Grupo() {

	}

	public Grupo(int permiso, Usuario usuario) {
		this.permiso = permiso;
		this.usuario = usuario;
	}

	public Integer getIdgrupo() {
		return idgrupo;
	}

	public void setIdgrupo(Integer idgrupo) {
		this.idgrupo = idgrupo;
	}

	public int getPermiso() {
		return permiso;
	}

	public void setPermiso(int permiso) {
		this.permiso = permiso;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

}
