package org.construccion.models;

import javax.persistence.AssociationOverride;
import javax.persistence.AssociationOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "pedido_producto")
@AssociationOverrides({
		@AssociationOverride(name = "pk.pedido", joinColumns = @JoinColumn(name = "idpedido")),
		@AssociationOverride(name = "pk.producto", joinColumns = @JoinColumn(name = "idproducto")) })
public class PedidoProducto {

	@EmbeddedId
	private PedidoProductoId pk = new PedidoProductoId();

	@Column(name = "cantidad")
	private Integer cantidad;

	public PedidoProducto() {

	}

	public PedidoProductoId getPk() {
		return pk;
	}

	public void setPk(PedidoProductoId pk) {
		this.pk = pk;
	}

	@Transient
	public Pedido getPedido() {

		return getPk().getPedido();
	}

	public void setPedido(Pedido pedido) {

		getPk().setPedido(pedido);
	}

	@Transient
	public Producto getProducto() {
		return getPk().getProducto();
	}

	public void setProducto(Producto producto) {

		getPk().setProducto(producto);
	}

	public Integer getCantidad() {
		return cantidad;
	}

	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}

	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		PedidoProducto that = (PedidoProducto) o;

		if (getPk() != null ? !getPk().equals(that.getPk())
				: that.getPk() != null)
			return false;

		return true;
	}

	public int hashCode() {
		return (getPk() != null ? getPk().hashCode() : 0);
	}

}
