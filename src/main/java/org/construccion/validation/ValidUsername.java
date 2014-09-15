package org.construccion.validation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;

/*
 * anotacion de validacion customizada, comprueba si existe un usuario en la base de datos.
 * */
@Documented
@Retention(RetentionPolicy.RUNTIME)
@Target({ ElementType.METHOD, ElementType.FIELD, ElementType.CONSTRUCTOR,
		ElementType.PARAMETER, ElementType.ANNOTATION_TYPE })
@Constraint(validatedBy = UsernameValidator.class)
public @interface ValidUsername {

	String message();

	@SuppressWarnings("rawtypes")
	Class[] groups() default {};

	@SuppressWarnings("rawtypes")
	Class[] payload() default {};

}
