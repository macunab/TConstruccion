package org.construccion.controller;

import java.util.List;

import org.construccion.models.Categoria;
import org.construccion.models.Usuario;
import org.construccion.repository.CategoriaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//Client/Admin Access Controller
//author : Marco, Acuna.
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
@Controller
public class AccessController {

	@Autowired
	CategoriaRepository categoriaRepo;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getLogin(Model model,
			@RequestParam(required = false) String mensaje) {

		if (mensaje != null) {
			mensaje = "<div class='alert alert-danger' role='alert'>Usuario o contraseña incorrectos.</div>";
		}
		List<Categoria> categorias = categoriaRepo.findAll();

		model.addAttribute("categorias", categorias);
		model.addAttribute("usuario", new Usuario());
		model.addAttribute("error", mensaje);

		return "access/login";
	}

	@RequestMapping(value = "/login_error", method = RequestMethod.GET)
	public String getLoginE(Model mode) {

		String message = "error";
		return "redirect:/login?mensaje=" + message;
	}
}
