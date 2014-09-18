package org.construccion.service;

import org.construccion.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PersistenceService {

	@Autowired
	UsuarioRepository usuario;

	public boolean exist(String username) {

		if (usuario.findByUsername(username) != null) {
			return true;
		} else {
			return false;
		}
	}
}
