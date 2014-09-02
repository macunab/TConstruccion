package org.construccion.repository;

import java.util.List;

import org.construccion.models.Producto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ProductoRepository extends JpaRepository<Producto, Integer>{
	
	public final static String SEARCH_BY_TAG_QUERY = "SELECT p FROM Producto p LEFT JOIN p.tags t WHERE t.nombre = :nombre";
	
	@Query(SEARCH_BY_TAG_QUERY)
	List<Producto> busquedaByTag(@Param("nombre") String nombre);

}
