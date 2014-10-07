package org.construccion.repository;

import java.util.List;

import org.construccion.models.Pedido;
import org.construccion.models.PedidoProducto;
import org.construccion.models.Producto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface PedidoProductoRepository extends
		JpaRepository<PedidoProducto, Integer> {

	public static final String EXIST_BY_PRODUCTO = "SELECT CASE WHEN count(p) > 0 THEN TRUE ELSE FALSE END FROM PedidoProducto p "
			+ "WHERE p.producto = :producto AND p.pedido = :pedido";
	public static final String FIND_BY_PEDIDO = "SELECT p FROM PedidoProducto p WHERE p.pedido = :pedido";
	public static final String UPDATE_BY_PRODUCTO = "SELECT p FROM PedidoProducto p WHERE "
			+ "p.producto = :producto AND p.pedido = :pedido";

	@Query(FIND_BY_PEDIDO)
	List<PedidoProducto> findPedidos(@Param("pedido") Pedido pedido);

	@Query(EXIST_BY_PRODUCTO)
	boolean existProductoIn(@Param("producto") Producto producto,
			@Param("pedido") Pedido pedido);

	@Query(UPDATE_BY_PRODUCTO)
	PedidoProducto findByProductoPedido(@Param("producto") Producto producto,
			@Param("pedido") Pedido pedido);

}
