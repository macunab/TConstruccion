package org.construccion.models;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//POJO SubCategoria
//author : Marco, Acuna.
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
@Entity
@Table(name = "subcategoria")
public class SubCategoria {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "idsubcategoria")
	private Integer codigo;

	@Column(name = "nombre")
	private String nombre;

	@ManyToOne
	@JoinColumn(name = "categoria")
	private Categoria categoria;

	@OneToMany(mappedBy = "subcategoria")
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Producto> productos;

	public SubCategoria() {

	}

	public SubCategoria(String nombre) {
		this.nombre = nombre;
	}

	public Integer getCodigo() {
		return codigo;
	}

	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}

	public List<Producto> getProductos() {
		return productos;
	}

	public void setProductos(List<Producto> productos) {
		this.productos = productos;
	}

}
