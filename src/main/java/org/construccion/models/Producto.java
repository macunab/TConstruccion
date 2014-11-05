package org.construccion.models;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.validator.constraints.NotEmpty;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//POJO Producto
//author : Marco, Acuna.
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
@Entity
@Table(name = "producto")
public class Producto {

	@Id
	@Column(name = "idproducto")
	@NotNull
	private Integer codigo;

	@Column(name = "nombre")
	@NotEmpty
	private String nombre;

	@Column(name = "descripcion")
	private String descripcion;

	@Column(name = "precio_venta")
	@NotNull
	private BigDecimal precio;

	@Column(name = "precio_compra")
	@NotNull
	private BigDecimal precioCompra;

	@Column(name = "stock")
	@NotNull
	private Integer stock;

	@Column(name = "url_image")
	private String urlImage;

	@OneToMany(mappedBy = "producto", cascade = CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Tag> tags;

	@ManyToOne
	@JoinColumn(name = "subcategoria")
	private SubCategoria subcategoria;

	@Column(name = "active")
	private boolean activo;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "producto")
	Set<PedidoProducto> pedidoProductos = new HashSet<PedidoProducto>(0);

	public Producto() {

	}

	public Producto(Integer codigo, String nombre, String descripcion,
			BigDecimal precio, Integer stock, String urlImage,
			BigDecimal precioCompra) {

		this.codigo = codigo;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.precio = precio;
		this.stock = stock;
		this.urlImage = urlImage;
		this.precioCompra = precioCompra;

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

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public BigDecimal getPrecio() {
		return precio;
	}

	public void setPrecio(BigDecimal precio) {
		this.precio = precio;
	}

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	public String getUrlImage() {
		return urlImage;
	}

	public void setUrlImage(String urlImage) {
		this.urlImage = urlImage;
	}

	public List<Tag> getTags() {
		return tags;
	}

	public void setTag(List<Tag> tags) {
		this.tags = tags;
	}

	public SubCategoria getSubcategoria() {
		return subcategoria;
	}

	public void setSubcategoria(SubCategoria subCategoria) {
		this.subcategoria = subCategoria;
	}

	public BigDecimal getPrecioCompra() {
		return precioCompra;
	}

	public void setPrecioCompra(BigDecimal precioCompra) {
		this.precioCompra = precioCompra;
	}

	public boolean isActivo() {
		return activo;
	}

	public void setActivo(boolean activo) {
		this.activo = activo;
	}

	public Set<PedidoProducto> getPedidoProductos() {
		return pedidoProductos;
	}

	public void setPedidoProductos(Set<PedidoProducto> pedidoProductos) {
		this.pedidoProductos = pedidoProductos;
	}

}
