<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OneClick | Cambio password</title>
<!-- Bootstrap style -->
<link id="callCss" rel="stylesheet"
	href="resources/css/bootstrap.min.css" media="screen" />
<link href="resources/css/base.css" rel="stylesheet" media="screen" />
<!-- Bootstrap style responsive -->
<link href="resources/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link href="resources/css/font-awesome.css" rel="stylesheet"
	type="text/css">

<!-- Javascripts -->
<script src="resources/js/jquery-1.2.11.0.js"></script>
<script src="resources/js/bootstrap.min.js" type="text/javascript"></script>

<script src="resources/js/bootshop.js"></script>
<script src="resources/js/jquery.lightbox-0.5.js"></script>
</head>
<body>
	<!-- HEADER BEGIN -->
	<!-- +++++++++++++++++++++++++++++++++++++++++++ -->
	<div id="header">
		<div class="container">
			<div id="welcomeLine" class="row"></div>

			<!-- Navbar ================================================== -->
			<div id="logoArea" class="navbar">
				<a id="smallScreen" data-target="#topMenu" data-toggle="collapse"
					class="btn btn-navbar"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a>
				<div class="navbar-inner">
					<a class="brand" href="1"><img width="100"
						src="resources/img/OneClick-3.png" alt="Bootsshop" /></a>

					<form class="form-inline navbar-search" method="post"
						action="products.html">
						<input id="nav-busqueda" class="srchTxt" type="text" /> <select
							class="srchTxt" id="categorias">
							<option value="All">All</option>
							<c:forEach items="${categorias }" var="categoria">
								<option value="${categoria.nombre }">${categoria.nombre }</option>
							</c:forEach>
						</select>
						<button type="button" id="submitButton" class="btn btn-primary"
							onClick="buscar()">Go</button>
					</form>
					<ul id="topMenu" class="nav pull-right">
						<li class=""><a href="sendAccount">Productos</a></li>
						<li class=""><a href="#">Empresa</a></li>
						<li class=""><a href="contacto">Contacto</a></li>
						<sec:authorize access="hasRole('ROLE_CLIENTE')">
							<li><a href="j_spring_security_logout">Salir</a></li>

						</sec:authorize>
						<sec:authorize access="isAnonymous()">
							<li class=""><a href="login" role="button"
								style="padding-right: 0"><span
									class="btn btn-large btn-success">Ingresar</span></a></li>
						</sec:authorize>

					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End====================================================================== -->

	<!-- MAIN BEGIN -->
	<div id="mainBody">
		<div class="container">
			<div class="row">
				<!-- Sidebar ================================================== -->
				<div id="sidebar" class="span3">

					<sec:authorize access="hasRole('ROLE_CLIENTE')">
						<div class="well well-small">
							<ul>
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown">Bienvenido, <strong id="usuario"><%=SecurityContextHolder.getContext()
						.getAuthentication().getName()%></strong> <span class="caret"></span></a>
									<ul class="dropdown-menu" role="menu">
										<li><a href="#">Mis Pedidos</a></li>
										<li><a href="#">Perfil</a></li>
										<li><a href="#">Change password</a></li>
										<li class="divider"></li>
										<li><a href="j_spring_security_logout">Logout</a></li>
									</ul></li>
							</ul>
						</div>
					</sec:authorize>
					<div class="well well-small">
						<sec:authorize access="hasRole('ROLE_CLIENTE')">
							<a id="myCart"
								href="get_carrito?username=<%=SecurityContextHolder.getContext()
						.getAuthentication().getName()%>"><img
								src="resources/img/ico-cart.png" alt="cart"><span
								id="cantidad">0</span> Items en tu carrito <span
								id="total_carrito" class="badge badge-warning pull-right">$00.00</span></a>
						</sec:authorize>
						<sec:authorize access="isAnonymous()">
							<a href=""> <span class="badge badge-large badge-info">Registrarse</span></a>
						</sec:authorize>
					</div>
					<ul id="sideManu" class="nav nav-tabs nav-stacked">
						<c:forEach items="${categorias }" var="categoria">
							<li class="subMenu"><a> ${categoria.nombre}</a>
								<ul style="display: none">
									<c:forEach items="${categoria.subCategorias}"
										var="subCategoria">
										<li><a class="active" href="#"><i
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
				<div id="main-articulos" class="span9">
					<ul class="breadcrumb">
						<li><a href="1">Home</a> <span class="divider">/</span></li>
						<li class="active">Cambiar Contraseña</li>
					</ul>
					<h3>
						Cambio de Contraseña 
					</h3>
					<hr class="soft" />
					<div class="well">
						<form class="form-horizontal">
							
							<div class="control-group">
								<label class="control-label" for="passwordActual">Password Actual <sup>*</sup>
								</label>
								<div class="controls">
									<input type="text" id="passwordActual" placeholder="Contraseña actual">
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label" for="passwordNuevo">Nuevo Password <sup>*</sup>
								</label>
								<div class="controls">
									<input type="text" id="passwordNuevo" placeholder="Contraseña nueva">
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label" for="passwordRepeat">Repetir Password <sup>*</sup>
								</label>
								<div class="controls">
									<input type="text" id="passwordRepeat" placeholder="Contraseña nueva">
								</div>
							</div>
							
							<input class="btn " type="submit" value="Guardar" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- MainBody End ============================= -->

	<!-- Footer ================================================================== -->
	<div id="footerSection">
		<div class="container">
			<div class="row">
				<div class="span3">
					<h5>ACCOUNT</h5>
					<a href="login.html">YOUR ACCOUNT</a> <a href="login.html">PERSONAL
						INFORMATION</a> <a href="login.html">ADDRESSES</a> <a
						href="login.html">DISCOUNT</a> <a href="login.html">ORDER
						HISTORY</a>
				</div>
				<div class="span3">
					<h5>INFORMATION</h5>
					<a href="contact.html">CONTACT</a> <a href="register.html">REGISTRATION</a>
					<a href="legal_notice.html">LEGAL NOTICE</a> <a href="tac.html">TERMS
						AND CONDITIONS</a> <a href="faq.html">FAQ</a>
				</div>
				<div class="span3">
					<h5>OUR OFFERS</h5>
					<a href="#">NEW PRODUCTS</a> <a href="#">TOP SELLERS</a> <a
						href="special_offer.html">SPECIAL OFFERS</a> <a href="#">MANUFACTURERS</a>
					<a href="#">SUPPLIERS</a>
				</div>
				<div id="socialMedia" class="span3 pull-right">
					<h5>SOCIAL MEDIA</h5>
					<a href="#"><img width="60" height="60"
						src="themes/images/facebook.png" title="facebook" alt="facebook" /></a>
					<a href="#"><img width="60" height="60"
						src="themes/images/twitter.png" title="twitter" alt="twitter" /></a>
					<a href="#"><img width="60" height="60"
						src="themes/images/youtube.png" title="youtube" alt="youtube" /></a>
				</div>
			</div>
			<p class="pull-right">&copy; OneClick Company</p>
		</div>
		<!-- Container End -->
	</div>
</body>
</html>