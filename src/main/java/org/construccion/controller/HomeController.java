package org.construccion.controller;

import java.util.List;

import org.construccion.models.Producto;
import org.construccion.repository.ProductoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping()
public class HomeController {

	@Autowired
	ProductoRepository repo;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getHome(Model model) {

		List<Producto> productos = repo.findAll();
		model.addAttribute("productos", productos);
		return "home_page";
	}

	@RequestMapping(value = "/secure/empleado", method = RequestMethod.GET)
	public String getEmpleadoPage() {

		return "secure/empleado_page";
	}
	


}
