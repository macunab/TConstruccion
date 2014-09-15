package org.construccion.validation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.construccion.models.Usuario;
import org.construccion.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;

public class UsernameValidator implements
		ConstraintValidator<ValidUsername, String> {

	@Autowired
	UsuarioRepository usuarioRepo;

	@Override
	public void initialize(ValidUsername username) {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean isValid(String username, ConstraintValidatorContext arg1) {
		Usuario u = usuarioRepo.findByUsername(username);
		if (u == null) {
			return true;
		}
		return false;
	}

}
