package org.construccion.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.construccion.repository.UsuarioRepository;

public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	UsuarioRepository repository;

	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {

		try {
			org.construccion.models.Usuario domainUser = repository
					.findByUsername(username);

			System.out.println("El usuario es : " + domainUser.isEnable());
			System.out
					.println("La contraseña es : " + domainUser.getPassword());

			boolean enable = domainUser.isEnable();
			boolean accountNonExpired = true;
			boolean credentialsNonExpired = true;
			boolean accountNonLocked = true;

			return new User(domainUser.getUsername(), domainUser.getPassword()
					, enable, accountNonExpired,
					credentialsNonExpired, accountNonLocked,
					getAuthorities(domainUser.getRol().getPermiso()));

		} catch (Exception e) {
			throw new RuntimeException(e);
		}

	}

	public Collection<? extends GrantedAuthority> getAuthorities(Integer role) {

		List<GrantedAuthority> authList = getGrantedAuthorities(getRoles(role));
		return authList;
	}

	/*
	 * ROLES = ADMIN/EMPLEADO(1), CLIENTE(2)
	 */
	public List<String> getRoles(Integer role) {

		List<String> roles = new ArrayList<String>();
		if (role.intValue() == 1) {
			roles.add("ROLE_ADMIN");
			roles.add("ROLE_CLIENTE");
		} else if (role.intValue() == 2) {
			roles.add("ROLE_CLIENTE");
		}

		return roles;
	}

	public static List<GrantedAuthority> getGrantedAuthorities(
			List<String> roles) {

		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		for (String role : roles) {
			authorities.add(new SimpleGrantedAuthority(role));
		}
		return authorities;

	}

}
