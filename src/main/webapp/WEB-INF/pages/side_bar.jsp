<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<!-- Side Bar - Client -->
<!-- author : Marco, Acuna -->
<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Sidebar ================================================== -->
<div id="sidebar" class="span3">

	<sec:authorize access="hasRole('ROLE_CLIENTE')">
		<div class="well well-small">
			<ul>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Bienvenido, <strong id="usuario"><%=SecurityContextHolder.getContext()
						.getAuthentication().getName()%></strong> <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="consulta_pedidos">Mis Pedidos</a></li>
						<!-- <li><a href="#">Perfil</a></li> -->
						<li><a href="cambio_passwd">Change password</a></li>
						<li class="divider"></li>
						<li><a href="j_spring_security_logout">Logout</a></li>
					</ul></li>
			</ul>
		</div>
	</sec:authorize>
	<div class="well well-small">
		<sec:authorize access="hasRole('ROLE_CLIENTE')">
			<a id="myCart" href="get_carrito"><img
				src="resources/img/ico-cart.png" alt="cart"><span
				id="cantidad">0</span> Items en tu carrito <span id="total_carrito"
				class="badge badge-warning pull-right">$00.00</span></a>
		</sec:authorize>
		<sec:authorize access="isAnonymous()">
			<a href=""> <span class="badge badge-large badge-info">Registrarse</span></a>
		</sec:authorize>
	</div>
	<ul id="sideManu" class="nav nav-tabs nav-stacked">
		<c:forEach items="${categorias }" var="categoria">
			<li class="subMenu"><a> ${categoria.nombre}</a>
				<ul style="display: none">
					<c:forEach items="${categoria.subCategorias}" var="subCategoria">
						<li><a class="active"
							OnClick="productoSub('${subCategoria.nombre }');"><i
								class="icon-chevron-right"></i>${subCategoria.nombre } </a></li>
					</c:forEach>
				</ul></li>
		</c:forEach>

	</ul>
	<br />

	<div class="thumbnail">
		<img src="resources/img/payment_methods.png"
			title="Bootshop Payment Methods" alt="Payments Methods">
		<div class="caption">
			<h5>Metodos de pago</h5>
		</div>
	</div>
</div>
<!-- Sidebar end=============================================== -->