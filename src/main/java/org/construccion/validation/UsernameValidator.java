package org.construccion.validation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.construccion.service.PersistenceService;
import org.springframework.beans.factory.annotation.Autowired;

public class UsernameValidator implements
		ConstraintValidator<ValidUsername, String> {

	@Autowired
	PersistenceService service;

	@Override
	public void initialize(ValidUsername username) {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean isValid(String username, ConstraintValidatorContext arg1) {
		// Usuario u = service.findByUsername(username);
		if (service.exist(username)) {

			return false;
		}
		return true;
	}

}
