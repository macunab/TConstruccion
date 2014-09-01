package org.construccion.repository;

import org.construccion.models.Categoria;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface CategoriaRepository extends JpaRepository<Categoria, Integer>{
	
	@Query("SELECT c FROM Categoria c WHERE c.nombre = :nombre")
	Categoria findByNombre(@Param("nombre") String nombre);

}
