package org.construccion.controller;

import java.util.List;

import javax.validation.Valid;

import org.construccion.models.Categoria;
import org.construccion.models.Grupo;
import org.construccion.models.Producto;
import org.construccion.models.Usuario;
import org.construccion.repository.CategoriaRepository;
import org.construccion.repository.ProductoRepository;
import org.construccion.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping()
public class HomeController {

	@Autowired
	ProductoRepository productoRepo;

	@Autowired
	CategoriaRepository categoriaRepo;

	@Autowired
	UsuarioRepository usuarioRepo;

	static final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

	/*
	 * Devuelve la pagina principal para clientes.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getHome(Model model) {

		List<Producto> productos = productoRepo.findAll();
		List<Categoria> categorias = categoriaRepo.findAll();
		model.addAttribute("productos", productos);
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

		if (result.hasErrors()) {
			return "usuario_add";
		} else {
			usuario.setEnable(true);
			usuario.setRol(new Grupo(1, usuario));
			usuario.setPassword(passwordEncoder.encode(usuario.getPassword()));

			usuarioRepo.save(usuario);

			return "redirect:/";

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

}
