package org.construccion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AccessController {

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getLogin(Model model, @RequestParam(required = false) String mensaje) {

		if(mensaje != null){
			mensaje = "<div class='alert alert-danger' role='alert'>Usuario o contraseña incorrectos.</div>";
		}
		model.addAttribute("error", mensaje);
		
		return "access/login";
	}
	
	@RequestMapping(value = "/login_error", method = RequestMethod.GET)
	public String getLoginE(Model mode){
		
		String message = "error";
		return "redirect:/login?mensaje=" + message;
	}
}
