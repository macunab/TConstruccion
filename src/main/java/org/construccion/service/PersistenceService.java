package org.construccion.service;

import java.util.List;

import javax.annotation.Resource;
import javax.mail.MessagingException;

import org.construccion.models.Categoria;
import org.construccion.models.MensajeDto;
import org.construccion.models.Pedido;
import org.construccion.models.PedidoProducto;
import org.construccion.models.Producto;
import org.construccion.models.Usuario;
import org.construccion.repository.CategoriaRepository;
import org.construccion.repository.PedidoProductoRepository;
import org.construccion.repository.PedidoRepository;
import org.construccion.repository.ProductoRepository;
import org.construccion.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//Servicion que engloba todas las transacciones de persistencia.
//author : Marco, Acuna.
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
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

	@Autowired
	CategoriaRepository categoriaRepository;

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

	/*
	 * ##########################################################################
	 * ############# DEVUELVE UN PEDIDO POR SU ID
	 */
	public Pedido getPedido(Integer id) {

		return pedidoRepository.findOne(id);
	}

	/*
	 * ##########################################################################
	 * ############# ENVIA UN EMAIL SIMPLE
	 */
	public boolean sendMail(MensajeDto mail, String to) {

		mailService.send(mail.getEmail(), mail.getNombre(), mail.getMensaje(),
				to);

		return true;
	}

	/*
	 * ##########################################################################
	 * ############# ENVIA UN EMAIL TIPO HTML
	 */
	public boolean sendHtmlMail(MensajeDto mail, String to)
			throws MessagingException {

		mailService.sendHtml(mail.getEmail(), mail.getNombre(),
				mail.getMensaje(), to);

		return true;
	}

	/*
	 * ##########################################################################
	 * ############# DEVUELVE UN PRODUCTO BY ID
	 */
	public Producto getProducto(Integer codigo) {

		return productoRepository.findOne(codigo);
	}

	/*
	 * ##########################################################################
	 * ############# PERSISTE UN PEDIDO
	 */
	public void savePedido(Pedido pedido) {

		pedidoRepository.save(pedido);
	}

	/*
	 * ##########################################################################
	 * ############# DEVUELVE UN PEDIDO PRODUCTO BY PEDIDO
	 */
	@Transactional(readOnly = true)
	public List<PedidoProducto> getPedidoProductoByPedido(Pedido pedido) {

		List<PedidoProducto> pedidoProductos = pedidoProductoRepository
				.findPedidos(pedido);
		return pedidoProductos;

	}

	/*
	 * ##########################################################################
	 * ############# TRUE SI EXISTE UN PEDIDOPRODUCTO BY PEDIDO,PRODUCTO
	 */
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
			pedidoProductoRepository.customDelete(pedido, producto);
			return true;
		} catch (Exception e) {
			return false;
		}

	}

	/*
	 * ##########################################################################
	 * ############# DEVUELVE TODOS LOS PRODUCTOS
	 */
	@Transactional(readOnly = true)
	public Page<Producto> getAllProductos(PageRequest request) {

		return productoRepository.findAllActive(request);
	}

	/*
	 * ##########################################################################
	 * ############# DEVUELVE TODAS LAS CATEGORIAS
	 */
	@Transactional(readOnly = true)
	public List<Categoria> getAllCategorias() {

		return categoriaRepository.findAll();
	}

	/*
	 * ##########################################################################
	 * ############# PERSISTE UN USUARIO
	 */
	public void saveUsuario(Usuario usuario) {

		usuarioRepository.save(usuario);
	}

	/*
	 * ##########################################################################
	 * ############# DEVUELVE UN USUARIO BY USERNAME
	 */
	public Usuario getUsuarioByUsername(String username) {

		return usuarioRepository.findByUsername(username);
	}

	/*
	 * ##########################################################################
	 * ############# DEVUELVE LISTADO DE PEDIDOS PROCESANDO
	 */
	public List<Pedido> getPedidoProcesando(Usuario usuario) {

		return pedidoRepository.getPedidoProcesando(usuario);
	}

}
