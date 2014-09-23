package org.construccion.models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "pedido")
public class Pedido {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "idpedido")
	private Integer codigoPedido;

	@Column(name = "estado")
	private String estado;

	@Column(name = "activo")
	private boolean activo;

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "pk.pedido", cascade = CascadeType.ALL)
	private List<PedidoProducto> pedidoProductos;

	@ManyToOne
	@JoinColumn(name = "usuario")
	private Usuario usuario;

	public Pedido() {

	}

	public Pedido(String estado, boolean activo) {
		this.estado = estado;
		this.activo = activo;
	}

	public Integer getCodigoPedido() {
		return codigoPedido;
	}

	public void setCodigoPedido(Integer codigoPedido) {
		this.codigoPedido = codigoPedido;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public boolean isActivo() {
		return activo;
	}

	public void setActivo(boolean activo) {
		this.activo = activo;
	}

	public List<PedidoProducto> getPedidoProductos() {
		return pedidoProductos;
	}

	public void setPedidoProductos(List<PedidoProducto> pedidoProductos) {
		this.pedidoProductos = pedidoProductos;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

}
