package org.construccion.controller;

import java.math.BigDecimal;
import java.util.List;

import javax.validation.Valid;

import org.construccion.models.Categoria;
import org.construccion.models.Grupo;
import org.construccion.models.MensajeDto;
import org.construccion.models.Pedido;
import org.construccion.models.PedidoProducto;
import org.construccion.models.Producto;
import org.construccion.models.Usuario;
import org.construccion.repository.CategoriaRepository;
import org.construccion.repository.ProductoRepository;
import org.construccion.repository.UsuarioRepository;
import org.construccion.service.PasswordGenerator;
import org.construccion.service.PersistenceService;
import org.construccion.validation.UsuarioValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping()
public class HomeController {

	UsuarioValidator validator = null;

	public UsuarioValidator getValidator() {
		return validator;
	}

	@Autowired
	public void setValidator(UsuarioValidator validator) {
		this.validator = validator;
	}

	@Autowired
	ProductoRepository productoRepo;

	@Autowired
	CategoriaRepository categoriaRepo;

	@Autowired
	UsuarioRepository usuarioRepo;

	@Autowired
	PersistenceService service;

	static final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

	/*
	 * Devuelve la pagina principal para clientes.
	 */
	@RequestMapping(value = "/{pageNumber}", method = RequestMethod.GET)
	public String getHome(@PathVariable Integer pageNumber, Model model) {

		PageRequest request = new PageRequest(pageNumber - 1, 6,
				Sort.Direction.DESC, "nombre");

		Page<Producto> productos = productoRepo.findAllActive(request);
		List<Categoria> categorias = categoriaRepo.findAll();

		int current = productos.getNumber() + 1;
		int begin = Math.max(1, current - 5);
		int end = Math.min(begin + 10, productos.getTotalPages());

		model.addAttribute("page", productos);
		model.addAttribute("beginIndex", begin);
		model.addAttribute("endIndex", end);
		model.addAttribute("currentIndex", current);
		model.addAttribute("productos", productos.getContent());
		model.addAttribute("categorias", categorias);

		return "home_page";
	}

	@RequestMapping(value = "/save_usuario", method = RequestMethod.GET)
	public String getSaveUsuario(Model model) {

		model.addAttribute("usuario", new Usuario());
		return "usuario_add";
	}

	@RequestMapping(value = "/save_usuario", method = RequestMethod.POST)
	@Transactional
	public String postSaveUsuario(@Valid Usuario usuario, BindingResult result) {
		validator.validate(usuario, result);
		if (result.hasErrors()) {
			return "usuario_add";
		} else {
			usuario.setEnable(true);
			usuario.setRol(new Grupo(2, usuario));
			PasswordGenerator generarPassword = new PasswordGenerator();
			String password = generarPassword.GeneratedPassword();

			System.out.println("PASWORD GENERADA = #################### "
					+ generarPassword);
			usuario.setPassword(passwordEncoder.encode(usuario.getPassword()));

			usuarioRepo.save(usuario);
			System.out.println(usuario.getPassword() + "###################3");

			return "redirect:/1";

		}

	}

	/*
	 * Busqueda de Productos.
	 */
	@RequestMapping(value = "/busqueda_producto", method = RequestMethod.GET)
	public String getBusqueda(@RequestParam("busqueda") String busqueda,
			Model model) {

		List<Producto> productos = productoRepo.busquedaByTag(busqueda);
		model.addAttribute("productos", productos);
		return "busqueda_page";
	}

	/*
	 * 
	 * Detalle de Producto.
	 */
	@RequestMapping(value = "/get_producto", method = RequestMethod.GET)
	public String getProductoDetalle(
			@RequestParam("codigo") Integer codigoProducto, Model model) {

		Producto producto = productoRepo.findOne(codigoProducto);
		List<Categoria> categorias = categoriaRepo.findAll();
		model.addAttribute("producto", producto);
		model.addAttribute("categorias", categorias);

		return "producto_detalle";
	}

	/*
	 * 
	 * Formulario de contacto - GET
	 */
	@RequestMapping(value = "/contacto", method = RequestMethod.GET)
	public String getContacto(Model model) {

		List<Categoria> categorias = categoriaRepo.findAll();

		model.addAttribute("categorias", categorias);
		model.addAttribute("mensajeDto", new MensajeDto());
		return "contacto_form";
	}

	@RequestMapping(value = "/contacto", method = RequestMethod.POST)
	public String postContacto(@Valid MensajeDto mensajeDto,
			BindingResult result) {

		if (result.hasErrors()) {
			return "contacto_form";
		} else {

			System.out.println("PASO POR EL POST EXITOSAMENTE");
			service.sendMail(mensajeDto);

			return "redirect:/1";
		}
	}

	// ##############################################################################################
	@RequestMapping(value = "/get_carrito", method = RequestMethod.GET)
	public String getCarrito(@RequestParam("username") String username,
			Model model) {

		Pedido pedido = service.getCarrito(username);
		if (pedido != null) {
			BigDecimal total = new BigDecimal(0);
			List<PedidoProducto> pp = service.getPedidoProductoByPedido(pedido);
			model.addAttribute("productos", pp);

			for (int i = 0; i < pp.size(); i++) {
				total = total.add(pp.get(i).getProducto().getPrecio()
						.multiply(new BigDecimal(pp.get(i).getCantidad())));
			}
			model.addAttribute("total", total);

		}
		model.addAttribute("pedido", pedido);

		return "carrito_cliente";
	}

	@RequestMapping(value = "/generar_pedido", method = RequestMethod.GET)
	public String postCarrito(@RequestParam("pedido") Integer id) {

		Pedido pedido = service.getPedido(id);
		System.out.println("#####################################3"
				+ pedido.getUsuario().getUsername());

		return "redirect:/1";
	}

	/*
	 * ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	 * Añade un articulo en el carrito
	 */
	@RequestMapping(value = "/add_carrito", method = RequestMethod.POST)
	public String cantidadCarrito(@RequestParam("producto") Integer codigo,
			@RequestParam("cantidad") String cantidad) {

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();

		Pedido pedido = service.getCarrito(auth.getName());
		Producto producto = service.getProducto(codigo);

		PedidoProducto pp = new PedidoProducto();
		pp.setProducto(producto);
		pp.setCantidad(Integer.parseInt(cantidad));
		pp.setPedido(pedido);

		List<PedidoProducto> pedidoProductos = service
				.getPedidoProductoByPedido(pedido);

		pedidoProductos.add(pp);
		pedido.setPedidoProductos(pedidoProductos);

		if (service.existPedidoProductoByProducto(producto, pedido)) {

			PedidoProducto pedidoP = service.getPedidoProductoByProducto(
					producto, pedido);
			pedidoP.setCantidad(Integer.parseInt(cantidad));
			service.updatePedidoProductoByProducto(pedidoP);

		} else {
			service.savePedido(pedido);
		}

		/*
		 * SimpleDateFormat("dd-MM-yyyy h:mm a")
		 * SimpleDateFormat("dd/MMM/yy HH:mm:ss")
		 * SimpleDateFormat("EEEE dd 'de' MMMM 'de' yyyy h:mm:ss:SSS")
		 */
		// SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

		return "home_page";
	}

	/*
	 * Cantidad de articulos en el carrito
	 */
	@RequestMapping(value = "/get_productos_carrito", method = RequestMethod.POST)
	public @ResponseBody Integer getProductosCarrito() {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		System.out.println("########################### " + auth.getName());
		if (!auth.getName().equals("anonymousUser")) {
			System.out.println("########################### " + auth.getName());
			Pedido pedido = service.getCarrito(auth.getName());
			List<PedidoProducto> pedidoProductos = service
					.getPedidoProductoByPedido(pedido);
			return pedidoProductos.size();

		}
		return 1;
	}

	@RequestMapping(value = "/get_total_carrito", method = RequestMethod.POST)
	public @ResponseBody BigDecimal getTotalCarrito() {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		BigDecimal total = new BigDecimal(0);

		if (!auth.getName().equals("anonymousUser")) {

			Pedido pedido = service.getCarrito(auth.getName());
			List<PedidoProducto> pedidoProductos = service
					.getPedidoProductoByPedido(pedido);

			for (int i = 0; i < pedidoProductos.size(); i++) {
				total = total.add(pedidoProductos
						.get(i)
						.getProducto()
						.getPrecio()
						.multiply(
								new BigDecimal(pedidoProductos.get(i)
										.getCantidad())));
			}

			return total;

		}
		return new BigDecimal(0);
	}

	/*
	 * Remover producto de carrito.
	 */
	@RequestMapping(value = "/remove_producto_carrito", method = RequestMethod.GET)
	public String removeProducto(@RequestParam("producto") Integer productoid) {

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();

		Pedido pedido = service.getCarrito(auth.getName());

		Producto producto = service.getProducto(productoid);

		service.deletePPByProducto(pedido, producto);

		return "";
	}

}
