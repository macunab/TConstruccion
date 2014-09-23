package org.construccion.repository;

import org.construccion.models.Pedido;
import org.construccion.models.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface PedidoRepository extends JpaRepository<Pedido, Integer> {

	public final static String CARRITO_USUARIO = "SELECT p FROM Pedido p WHERE p.usuario = :usuario AND p.estado = 'carrito'";

	@Query(CARRITO_USUARIO)
	Pedido getCarrito(@Param("usuario") Usuario usuario);

}
