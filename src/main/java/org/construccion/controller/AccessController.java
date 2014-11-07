package org.construccion.controller;

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
			mensaje = "<div class='alert alert-danger alert-dismissible' role='alert'> <button type='button' class='close' data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'></span></button>  <strong>Ups!</strong> Username o password incorrectos.</div>";
		}
		
		model.addAttribute("error", mensaje);

		return "access/ingreso_sistema";
	}

	@RequestMapping(value = "/login_error", method = RequestMethod.GET)
	public String getLoginE(Model mode) {

		String message = "error";
		return "redirect:/login?mensaje=" + message;
	}
}
