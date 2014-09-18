package org.construccion.validation;

import org.construccion.models.Usuario;
import org.construccion.service.PersistenceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class UsuarioValidator implements Validator {

	@Autowired
	PersistenceService service;

	@Override
	public boolean supports(Class c) {
		// TODO Auto-generated method stub
		return Usuario.class.isAssignableFrom(c);

	}

	@Override
	public void validate(Object command, Errors errors) {
		// TODO Auto-generated method stub
		Usuario usuarioBean = (Usuario) command;
		if (service.exist(usuarioBean.getUsername())) {
			errors.rejectValue("username", "username.exist");
		}

	}

}
