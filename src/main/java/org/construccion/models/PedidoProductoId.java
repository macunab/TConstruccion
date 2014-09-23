package org.construccion.models;

import javax.persistence.Embeddable;
import javax.persistence.ManyToOne;

@Embeddable
public class PedidoProductoId implements java.io.Serializable {

	private static final long serialVersionUID = -7259949569727862407L;

	@ManyToOne
	private Pedido pedido;

	@ManyToOne
	private Producto producto;

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

	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		PedidoProductoId that = (PedidoProductoId) o;

		if (pedido != null ? !pedido.equals(that.pedido) : that.pedido != null)
			return false;
		if (producto != null ? !producto.equals(that.producto)
				: that.producto != null)
			return false;

		return true;
	}

	public int hashCode() {
		int result;
		result = (pedido != null ? pedido.hashCode() : 0);
		result = 31 * result + (producto != null ? producto.hashCode() : 0);
		return result;
	}

}
