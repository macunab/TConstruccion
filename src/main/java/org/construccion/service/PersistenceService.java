package org.construccion.service;

import org.construccion.models.Pedido;
import org.construccion.models.Usuario;
import org.construccion.repository.PedidoRepository;
import org.construccion.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PersistenceService {

	@Autowired
	UsuarioRepository usuarioRepository;

	@Autowired
	PedidoRepository pedidoRepository;

	/*
	 * ##########################################################################
	 * ############ COMPRUEBA QUE EXISTE EL USUARIO
	 */
	public boolean exist(String username) {

		if (usuarioRepository.findByUsername(username) != null) {
			return true;
		} else {
			return false;
		}
	}

	/*
	 * ##########################################################################
	 * ############# DEVUELVE EL CARRITO DE UN USUARIO
	 */
	public Pedido getCarrito(String username) {

		Usuario usuario = usuarioRepository.findByUsername(username);
		Pedido pedido = pedidoRepository.getCarrito(usuario);

		return pedido;

	}

	public Pedido getPedido(Integer id) {

		return pedidoRepository.findOne(id);
	}

}
