package org.construccion.models;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tag")
public class Tag {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "idtag")
	private Integer identified;

	@Column(name = "nombre")
	private String nombre;

	/*@ManyToMany(cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinTable(name = "producto_tag", joinColumns = { @JoinColumn(name = "tag_id") }, inverseJoinColumns = { @JoinColumn(name = "producto_id") })*/
	@ManyToMany(mappedBy = "tags", fetch = FetchType.EAGER)
	private Set<Producto> productos;

	public Tag() {

	}

	public Tag(String nombre, Set<Producto> productos) {
		this.nombre = nombre;
		this.productos = productos;
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

	public Set<Producto> getProductos() {
		return productos;
	}

	public void setProductos(Set<Producto> productos) {
		this.productos = productos;
	}
	
	//Obtengo el id como String para ayudar al binding de spring.
	public String getIdAsString(){
		
		return new Integer(identified).toString();
	}

}
