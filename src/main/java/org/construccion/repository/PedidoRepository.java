package org.construccion.repository;

import java.util.List;

import org.construccion.models.Pedido;
import org.construccion.models.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//PedidoRepository JpaRepository
//author : Marco, Acuna.
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
public interface PedidoRepository extends JpaRepository<Pedido, Integer> {

	public final static String CARRITO_USUARIO = "SELECT p FROM Pedido p WHERE p.usuario = :usuario AND p.estado = 'carrito'";
	public final static String PROCESANDO_USUARIO = "SELECT p FROM Pedido p WHERE p.usuario = :usuario AND p.estado = 'procesando'";

	@Query(CARRITO_USUARIO)
	Pedido getCarrito(@Param("usuario") Usuario usuario);

	@Query(PROCESANDO_USUARIO)
	List<Pedido> getPedidoProcesando(@Param("usuario") Usuario usuario);

}
