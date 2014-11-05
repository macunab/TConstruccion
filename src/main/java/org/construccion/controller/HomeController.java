package org.construccion.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;
import javax.validation.Valid;

import org.construccion.models.Categoria;
import org.construccion.models.Grupo;
import org.construccion.models.MensajeDto;
import org.construccion.models.Pedido;
import org.construccion.models.PedidoProducto;
import org.construccion.models.Producto;
import org.construccion.models.SubCategoria;
import org.construccion.models.Usuario;
import org.construccion.repository.CategoriaRepository;
import org.construccion.repository.ProductoRepository;
import org.construccion.repository.UsuarioRepository;
import org.construccion.service.PasswordGenerator;
import org.construccion.service.PersistenceService;
import org.construccion.validation.ErrorMessage;
import org.construccion.validation.UsuarioValidator;
import org.construccion.validation.ValidationResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//Main Client Controller
//author : Marco, Acuna.
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
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

	// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	// GET HOME
	// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	@RequestMapping(value = "/{pageNumber}", method = RequestMethod.GET)
	public String getHome(@PathVariable Integer pageNumber, Model model) {

		PageRequest request = new PageRequest(pageNumber - 1, 6,
				Sort.Direction.DESC, "nombre");

		Page<Producto> productos = service.getAllProductos(request);
		List<Categoria> categorias = service.getAllCategorias();

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

	// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	// REGISTRAR USUARIO
	// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	@RequestMapping(value = "/save_usuario", method = RequestMethod.POST)
	public @ResponseBody ValidationResponse postSaveUsuario(
			@Valid Usuario usuario, BindingResult result)
			throws MessagingException {
		validator.validate(usuario, result);
		ValidationResponse res = new ValidationResponse();

		if (result.hasErrors()) {
			res.setStatus("FAIL");
			List<FieldError> allErrors = result.getFieldErrors();
			List<ErrorMessage> errorMesages = new ArrayList<ErrorMessage>();
			for (FieldError objectError : allErrors) {
				errorMesages.add(new ErrorMessage(objectError.getField(), " "
						+ objectError.getDefaultMessage()));
			}
			res.setErrorMessageList(errorMesages);
			return res;
		} else {
			PasswordGenerator generarPassword = new PasswordGenerator();
			String password = generarPassword.GeneratedPassword();
			Pedido pedido = new Pedido();

			usuario.setEnable(false);
			usuario.setRol(new Grupo(2, usuario));
			usuario.setPassword(passwordEncoder.encode(password));

			service.saveUsuario(usuario);

			pedido.setActivo(true);
			pedido.setEstado("carrito");
			pedido.setUsuario(usuario);
			service.savePedido(pedido);

			MensajeDto mensajeDto = new MensajeDto();
			mensajeDto.setEmail("mn.acunab@gmail.com");
			mensajeDto
					.setMensaje("<p>Gracias por registrarse en OneClick.com.</p></br>"
							+ "<p>Por favor confirme su cuenta por medio del siguiente enlace para empezar a comprar y "
							+ "disfrutar de todos los beneficios que solo OneClick.com le puede ofrecer.</p></br>"
							+ "<li><a href='http://localhost:8080/Ferreteria_Construccion/validate_register?username="
							+ usuario.getUsername()
							+ "' >Confirmar cuenta!</a></li></br>"
							+ "<b>Su password es: " + password + "</b>");
			mensajeDto.setNombre("OneClick.com");
			service.sendHtmlMail(mensajeDto, usuario.getUsername());

			res.setStatus("SUCCESS");
			return res;

		}

	}

	// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	// ACTIVACION DE CUENTA
	// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	@RequestMapping(value = "/validate_register", method = RequestMethod.GET)
	public String validateRegister(@RequestParam("username") String username) {

		Usuario usuario = service.getUsuarioByUsername(username);
		if (usuario.isEnable()) {

			return "";
		} else {
			usuario.setEnable(true);
			service.saveUsuario(usuario);
			return "redirect:/1";
		}

	}

	// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	// BUSQUEDA PRODUCTO
	// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	@RequestMapping(value = "/busqueda_producto", method = RequestMethod.GET)
	public String getBusqueda(@RequestParam("busqueda") String busqueda,
			@RequestParam("filtro") String filtro, Model model) {

		if (filtro.equals("All")) {
			List<Producto> productos = productoRepo.busquedaByTag(busqueda);
			model.addAttribute("productos", productos);
		} else {

		}

		return "busqueda_page";
	}

	// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	// DETALLE DE PRODUCTO
	// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	@RequestMapping(value = "/get_producto", method = RequestMethod.GET)
	public String getProductoDetalle(
			@RequestParam("codigo") Integer codigoProducto, Model model) {

		Producto producto = productoRepo.findOne(codigoProducto);
		List<Categoria> categorias = categoriaRepo.findAll();
		model.addAttribute("producto", producto);
		model.addAttribute("categorias", categorias);

		return "producto_detalle";
	}

	// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	// GET CONTACTO
	// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	@RequestMapping(value = "/contacto", method = RequestMethod.GET)
	public String getContacto(Model model) {

		List<Categoria> categorias = categoriaRepo.findAll();

		model.addAttribute("categorias", categorias);
		model.addAttribute("mensajeDto", new MensajeDto());
		return "contacto_form";
	}

	// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	// POST CONTACTO
	// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	@RequestMapping(value = "/contacto", method = RequestMethod.POST)
	public String postContacto(@Valid MensajeDto mensajeDto,
			BindingResult result) {

		if (result.hasErrors()) {
			return "contacto_form";
		} else {

			System.out.println("PASO POR EL POST EXITOSAMENTE");
			service.sendMail(mensajeDto, "ferreteria.oneclick@gmail.com");

			return "redirect:/1";
		}
	}

	// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	// GET CARRITO
	// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	@RequestMapping(value = "/get_carrito", method = RequestMethod.GET)
	public String getCarrito(Model model) {

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();

		Pedido pedido = service.getCarrito(auth.getName());
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

	// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	// ADD PRODUCTO A CARRITO
	// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
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

	// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	// GET CANTIDAD PRODUCTOS CARRITO
	// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
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

	// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	// GET TOTAL PAGO CARRITO
	// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
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

	// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	// GET CAMBIAR PASSWORD
	// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	@RequestMapping(value = "/cambio_passwd", method = RequestMethod.GET)
	public String getCambioPassword() {

		return "cambio_password";
	}

	// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	// POST CAMBIAR PASSWORD
	// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	@RequestMapping(value = "/cambio_passwd", method = RequestMethod.POST)
	public @ResponseBody ValidationResponse postCambioPassword(
			@RequestParam("passwordActual") String password,
			@RequestParam("passwordNuevo") String newPassword,
			@RequestParam("passwordRepeat") String rePassword) {

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		ValidationResponse res = new ValidationResponse();

		List<ErrorMessage> errorMessages = new ArrayList<ErrorMessage>();

		Usuario usuario = service.getUsuarioByUsername(auth.getName());

		if (passwordEncoder.matches(password, usuario.getPassword())) {

			if (newPassword.equals(rePassword)) {

				res.setStatus("SUCCESS");

				usuario.setPassword(passwordEncoder.encode(newPassword));
				service.saveUsuario(usuario);

			} else {

				res.setStatus("FAIL");
				errorMessages.add(new ErrorMessage("passwordRepeat",
						"No coincide con el nuevo password"));
				res.setErrorMessageList(errorMessages);
				return res;

			}
		} else {
			res.setStatus("FAIL");
			errorMessages
					.add(new ErrorMessage("passwordActual",
							"Por favor, introdusca correctamente el password de la cuenta."));
			res.setErrorMessageList(errorMessages);
			return res;
		}

		return res;
	}

	// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	// REMOVER PRODUCTO CARRITO
	// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	@RequestMapping(value = "/remove_producto_carrito", method = RequestMethod.POST)
	public String removeProducto(@RequestParam("producto") Integer productoid) {

		System.out
				.println("fffffffffffffffffffffffffffffffffffffffffffffffffffff!");

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();

		Pedido pedido = service.getCarrito(auth.getName());

		Producto producto = service.getProducto(productoid);
		System.out
				.println("fffffffffffffffffffffffffffffffffffffffffffffffffffff!");

		if (service.deletePPByProducto(pedido, producto)) {
			System.out
					.println("#############################################################################"
							+ "############################################################################3"
							+ "##################33   SE HA ELIMINADO CON EXITO");
		} else {
			System.out.println("NO!");
		}

		return "carrito_cliente";
	}

	// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	// ALTA PEDIDO
	// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	@RequestMapping(value = "/alta_pedido", method = RequestMethod.GET)
	public String altaPedido(Model model) {

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();

		Usuario usuario = service.getUsuarioByUsername(auth.getName());

		// Obtengo el carrito
		Pedido pedido = service.getCarrito(auth.getName());

		pedido.setEstado("procesando");
		service.savePedido(pedido);

		Pedido newpedido = new Pedido();
		newpedido.setActivo(true);
		newpedido.setEstado("carrito");
		newpedido.setUsuario(usuario);
		service.savePedido(newpedido);

		List<Pedido> pedidosProcesando = service.getPedidoProcesando(usuario);
		model.addAttribute("procesando", pedidosProcesando);

		return "pedidos_page";

	}

	// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	// CONSULTA PEDIDOS
	// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	@RequestMapping(value = "/consulta_pedidos", method = RequestMethod.GET)
	public String getPedidos(Model model) {

		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();

		Usuario usuario = service.getUsuarioByUsername(auth.getName());

		List<Pedido> pedidosProcesando = service.getPedidoProcesando(usuario);
		model.addAttribute("procesando", pedidosProcesando);

		return "pedidos_page";
	}
	
	//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	// GET LISTADO PRODUCTOS BY SUBCATEGORIA
	//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	@RequestMapping(value = "/producto_sub", method = RequestMethod.POST)
	public String getProductosBySubCategoria(@RequestParam("subcategoria") String sub, Model model){
		
		SubCategoria subcategoria = service.getSubCategoriaByNombre(sub);
		
		List<Producto> productos = service.getProductosBySubCategoria(subcategoria);
		
		model.addAttribute("productos", productos);
		
		return "producto_categoria";
		
	}

}
