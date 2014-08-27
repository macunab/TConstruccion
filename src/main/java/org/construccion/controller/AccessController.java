package org.construccion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AccessController {

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getLogin() {

		return "access/login";
	}
	
	@RequestMapping(value = "/login_error", method = RequestMethod.GET)
	public String getLoginE(Model mode){
		mode.addAttribute("error", new String ("Login Erroneo"));
		return "access/login";
	}
}
