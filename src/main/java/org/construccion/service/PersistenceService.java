package org.construccion.service;

import java.util.List;

import javax.annotation.Resource;

import org.construccion.models.MensajeDto;
import org.construccion.models.Pedido;
import org.construccion.models.PedidoProducto;
import org.construccion.models.Producto;
import org.construccion.models.Usuario;
import org.construccion.repository.PedidoProductoRepository;
import org.construccion.repository.PedidoRepository;
import org.construccion.repository.ProductoRepository;
import org.construccion.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PersistenceService {

	@Autowired
	UsuarioRepository usuarioRepository;

	@Autowired
	PedidoRepository pedidoRepository;

	@Autowired
	ProductoRepository productoRepository;

	@Autowired
	PedidoProductoRepository pedidoProductoRepository;

	@Resource
	MailService mailService;

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
	@Transactional(readOnly = true)
	public Pedido getCarrito(String username) {

		Usuario usuario = usuarioRepository.findByUsername(username);
		Pedido pedido = pedidoRepository.getCarrito(usuario);

		return pedido;

	}

	public Pedido getPedido(Integer id) {

		return pedidoRepository.findOne(id);
	}

	// ENVIO DE EMAIL
	public boolean sendMail(MensajeDto mail) {

		mailService.send(mail.getEmail(), mail.getNombre(), mail.getMensaje());

		return true;
	}

	public Producto getProducto(Integer codigo) {

		return productoRepository.findOne(codigo);
	}

	public void savePedido(Pedido pedido) {

		pedidoRepository.save(pedido);
	}

	// Devuelve un pedidoProducto en base a un pedido.
	@Transactional(readOnly = true)
	public List<PedidoProducto> getPedidoProductoByPedido(Pedido pedido) {

		List<PedidoProducto> pedidoProductos = pedidoProductoRepository
				.findPedidos(pedido);
		return pedidoProductos;

	}

	@Transactional(readOnly = true)
	public boolean existPedidoProductoByProducto(Producto producto,
			Pedido pedido) {

		boolean exist = pedidoProductoRepository.existProductoIn(producto,
				pedido);
		return exist;
	}

	@Transactional()
	public void updatePedidoProductoByProducto(PedidoProducto pedidoProducto) {

		pedidoProductoRepository.save(pedidoProducto);
	}

	public PedidoProducto getPedidoProductoByProducto(Producto producto,
			Pedido pedido) {

		return pedidoProductoRepository.findByProductoPedido(producto, pedido);
	}

	@Transactional()
	public boolean deletePPByProducto(Pedido pedido, Producto producto) {

		try {
			pedidoProductoRepository.deleteByProducto(pedido, producto);
			return true;
		} catch (Exception e) {
			return false;
		}

	}

}
