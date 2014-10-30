package org.construccion.repository;

import java.util.List;

import org.construccion.models.Producto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ProductoRepository extends JpaRepository<Producto, Integer> {

	public final static String SEARCH_BY_TAG_QUERY = "SELECT p FROM Producto p LEFT JOIN p.tags t WHERE t.nombre = :nombre";

	public final static String FIND_ALL_ACTIVE = "SELECT p FROM Producto p WHERE p.activo = true";

	public final static String SEARCH_BY_TAG_AN_CATEGORY = "SELECT p FROM Producto p LEFT JOIN p.tags t WHERE t.nombre = :tag AND p.categoria = :categoria";

	@Query(SEARCH_BY_TAG_QUERY)
	List<Producto> busquedaByTag(@Param("nombre") String nombre);

	@Query(FIND_ALL_ACTIVE)
	Page<Producto> findAllActive(Pageable page);

	//@Query(SEARCH_BY_TAG_AN_CATEGORY)
	//Page<Producto> getAllByCategoria(@Param("tag") String tag,
		//	@Param("categoria") Categoria categoria);

}
