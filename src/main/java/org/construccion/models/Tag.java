package org.construccion.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//POJO Tag
//author : Marco, Acuna.
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
@Entity
@Table(name = "tag")
public class Tag {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "idtag")
	private Integer identified;

	@Column(name = "nombre")
	private String nombre;

	@ManyToOne
	@JoinColumn(name = "producto")
	private Producto producto;

	public Tag() {

	}

	public Tag(String nombre) {
		this.nombre = nombre;
	}

	public Tag(String nombre, Producto producto) {
		this.nombre = nombre;
		this.producto = producto;
	}

	public Integer getIdentified() {
		return identified;
	}

	public void setIdentified(Integer identified) {
		this.identified = identified;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Producto getProducto() {
		return producto;
	}

	public void setProducto(Producto producto) {
		this.producto = producto;
	}

	// Obtengo el id como String para ayudar al binding de spring.
	public String getIdAsString() {

		return new Integer(identified).toString();
	}

}
