package org.construccion.repository;

import org.construccion.models.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//Usuario JpaRepository
//author : Marco, Acuna.
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
public interface UsuarioRepository extends JpaRepository<Usuario, String> {

	@Query("SELECT u FROM Usuario u WHERE u.username = :username")
	Usuario findByUsername(@Param("username") String username);

}
