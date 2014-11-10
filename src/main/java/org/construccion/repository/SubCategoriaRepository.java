package org.construccion.repository;

import java.util.List;

import org.construccion.models.Categoria;
import org.construccion.models.SubCategoria;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface SubCategoriaRepository extends
		JpaRepository<SubCategoria, Integer> {

	List<SubCategoria> findByCategoria(Categoria categoria);

	@Query("SELECT c FROM SubCategoria c WHERE c.nombre = :nombre")
	SubCategoria findByNombre(@Param("nombre") String nombre);

}
