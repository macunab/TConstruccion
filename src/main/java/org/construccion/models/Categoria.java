package org.construccion.models;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//POJO Categoria
//author : Marco, Acuna.
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
@Entity
@Table(name = "categoria")
public class Categoria {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "idcategoria")
	private Integer codigo;

	@Column(name = "nombre")
	private String nombre;

	@OneToMany(mappedBy = "categoria")
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<SubCategoria> subCategorias;

	public Categoria() {

	}

	public Categoria(String nombre, List<SubCategoria> subCategorias) {
		this.nombre = nombre;
		this.subCategorias = subCategorias;
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

	public List<SubCategoria> getSubCategorias() {
		return subCategorias;
	}

	public void setSubCategorias(List<SubCategoria> subCategorias) {
		this.subCategorias = subCategorias;
	}

}
