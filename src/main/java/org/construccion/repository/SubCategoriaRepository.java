package org.construccion.repository;

import java.util.List;

import org.construccion.models.Categoria;
import org.construccion.models.SubCategoria;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SubCategoriaRepository extends
		JpaRepository<SubCategoria, Integer> {

	List<SubCategoria> findByCategoria(Categoria categoria);

}
