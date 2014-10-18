package org.construccion.models;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "pedido_producto")
public class PedidoProducto {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "idpedido_producto")
	private Integer id;

	@ManyToOne
	@JoinColumn(name = "idpedido")
	private Pedido pedido;

	@ManyToOne
	@JoinColumn(name = "idproducto")
	private Producto producto;

	@Column(name = "cantidad")
	private Integer cantidad;

	public PedidoProducto() {

	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Pedido getPedido() {
		return pedido;
	}

	public void setPedido(Pedido pedido) {
		this.pedido = pedido;
	}

	public Producto getProducto() {
		return producto;
	}

	public void setProducto(Producto producto) {
		this.producto = producto;
	}

	public Integer getCantidad() {
		return cantidad;
	}

	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}

	public BigDecimal getSubTotal() {

		return this.producto.getPrecio()
				.multiply(new BigDecimal(this.cantidad));
	}

}
