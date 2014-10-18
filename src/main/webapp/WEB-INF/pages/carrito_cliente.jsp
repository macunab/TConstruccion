<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OneClick | Carrito</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

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
<link rel="shortcut icon" href="resources/img/icono_oneclick.png"
	type="image/png" />
<!-- Estilo Css -->

<script type="text/javascript">
	$(document).ready(function() {

		actualizarCarrito();
		actualizarTotalCarrito();

	});

	function addCarrito(producto) {

		var id = "#cantidad_" + producto;
		console.log(id);

		$.ajax({
			type : "post",
			url : "add_carrito",
			cache : false,
			data : 'producto=' + producto + '&cantidad=' + $(id).val(),
			success : function(data) {
				actualizarCarrito();

			},
		});
	}

	function actualizarCarrito() {

		$.ajax({
			type : "post",
			url : "get_productos_carrito",
			cache : false,
			success : function(data) {
				$("#cantidad").text(data);
			},
		});
	}

	function actualizarTotalCarrito() {

		$.ajax({
			type : "post",
			url : "get_total_carrito",
			cache : false,
			success : function(data) {
				$("#total_carrito").text("$" + data);
			},
		});
	}

	function buscar() {
		$.ajax({
			type : "get",
			url : "busqueda_producto",
			cache : false,
			data : 'busqueda=' + $('#busqueda').val(),
			success : function(data) {
				$('#main-container').html(data);
			},
		});
	}
</script>
</head>
<body>
	<!-- <div class="container">
		<div class="page-header">
			<img width="400" alt="No se encontro"
				src="resources/img/OneClick.png">
		</div>
	</div>

	<nav class="navbar navbar-default" role="navigation">
	<div class="container">
	
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/Ferreteria_Construccion/1">inicio</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="#">Contacto</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Categorias <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<c:forEach items="${categorias }" var="categoria">
							<li><a href="#">${categoria.nombre }</a>
						</c:forEach>
					</ul></li>
			</ul>
			<form class="navbar-form navbar-left" role="search">
				<div class="form-group">
					<input id="busqueda" type="text" class="form-control"
						placeholder="busqueda">
				</div>
				<button type="button" class="btn btn-default" onClick="buscar()">
					<span class="glyphicon glyphicon-search"></span>
				</button>
			</form>

		
			<ul class="nav navbar-nav navbar-right">
				<sec:authorize access="hasRole('ROLE_CLIENTE')">
					<li><a href="#"><span
							class="glyphicon glyphicon-shopping-cart blue"></span> <span>
								&nbsp</span> <span id="cantidad" class="badge pull-right"></span></a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Bienvenido, <strong><%=SecurityContextHolder.getContext()
						.getAuthentication().getName()%></strong> <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">Mis Pedidos</a></li>
							<li><a href="#">Perfil</a></li>
							<li><a href="#">Change password</a></li>
							<li class="divider"></li>
							<li><a href="j_spring_security_logout">Logout</a></li>
						</ul></li>
				</sec:authorize>

			</ul>
		</div>

	</div>
 </nav>

	<div id="main-container" class="container">


		<c:if test="${pedido != null }">

			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Producto</th>
						<th>Descripcion</th>
						<th>Cantidad</th>
						<th>Precio</th>
						<th>Descuento</th>
						<th>Iva</th>
						<th>Total</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${productos }" var="producto">
						<tr>
							<td><img width="60" src="${producto.producto.urlImage }"
								alt="" /></td>
							<td>${producto.producto.nombre }<br />Color : black,
								Material : metal
							</td>
							<td>
								<div class="input-append">
									<input class="span1" style="max-width: 34px" placeholder="1"
										id="appendedInputButtons" size="16" type="text"
										value="${producto.cantidad }">
									<button class="btn" type="button">
										<i class="glyphicon glyphicon-minus"></i>
									</button>
									<button class="btn" type="button">
										<i class="glyphicon glyphicon-plus"></i>
									</button>
									<button class="btn btn-danger" type="button">
										<i class="glyphicon glyphicon-remove"></i>
									</button>
								</div>
							</td>
							<td>${producto.producto.precio }</td>
							<td>$00.00</td>
							<td>$00.00</td>
							<td>${producto.producto.precio }</td>
						</tr>

					</c:forEach>
					<tr>
						<td colspan="6" style="text-align: right"><strong>TOTAL
								($228 - $50 + $31) =</strong></td>
						<td class="label label-important" style="display: block"><strong>
								$155.00 </strong></td>
					</tr>

				</tbody>
			</table>

		</c:if>-->

	<!--<c:if test="${pedido != null }">
					<c:forEach items="${productos }" var="producto">

						<div class="media">
							<a class="pull-left" href="#"> <img width="120"
								class="media-object" src="${producto.producto.urlImage }"
								alt="producto_imagen">
							</a>
							<div class="media-body">
								<h4 class="media-heading">${producto.producto.nombre }</h4>
							</div>
							<div class="pull-right">
								Cantidad: ${producto.cantidad } - <a href=""><span
									class="glyphicon glyphicon-remove"></span>Remove</a>
							</div>
						</div>

					</c:forEach>

					<div class="form-group">
						<label class="col-md-4 control-label" for="button1id"></label>
						<div class="col-md-8">
							<a href="generar_pedido?pedido=${pedido.codigoPedido }"
								id="button1id" name="button1id" class="btn btn-success">Comprar</a>
							<button id="button2id" name="button2id" class="btn btn-default">Cancelar</button>
						</div>
					</div>
				</c:if>-->
	<!--<c:if test="${pedido == null }">
			<p>No tiene productos en su carrito!</p>
		</c:if>
		<p>Subtotal : ${total }</p>
	</div>-->

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
					<a class="brand" href="index.html"><img width="100"
						src="resources/img/OneClick-3.png" alt="Bootsshop" /></a>

					<form class="form-inline navbar-search" method="post"
						action="products.html">
						<input id="nav-busqueda" class="srchTxt" type="text" /> <select
							class="srchTxt">
							<option>All</option>
							<c:forEach items="${categorias }" var="categoria">
								<option>${categoria.nombre }</option>
							</c:forEach>
						</select>
						<button type="submit" id="submitButton" class="btn btn-primary">Go</button>
					</form>
					<ul id="topMenu" class="nav pull-right">
						<li class=""><a href="special_offer.html">Productos</a></li>
						<li class=""><a href="normal.html">Empresa</a></li>
						<li class=""><a href="contact.html">Contacto</a></li>
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
	<div id="mainBody">
		<div class="container">
			<div class="row">
				<!-- Sidebar ================================================== -->
				<div id="sidebar" class="span3">
					<div class="well well-small">
						<sec:authorize access="hasRole('ROLE_CLIENTE')">
							<a id="myCart" href="product_summary.html"><img
								src="resources/img/ico-cart.png" alt="cart"><span
								id="cantidad">0</span> Items en tu carrito <span
								id="total_carrito" class="badge badge-warning pull-right">$00.00</span></a>
						</sec:authorize>
						<sec:authorize access="isAnonymous()">
							<a href=""> <span class="badge badge-large badge-info">Registrarse</span></a>
						</sec:authorize>
					</div>
					<ul id="sideManu" class="nav nav-tabs nav-stacked">
						<li class="subMenu open"><a> ELECTRONICS [230]</a>
							<ul>
								<li><a class="active" href="products.html"><i
										class="icon-chevron-right"></i>Cameras (100) </a></li>
								<li><a href="products.html"><i
										class="icon-chevron-right"></i>Computers, Tablets & laptop
										(30)</a></li>
								<li><a href="products.html"><i
										class="icon-chevron-right"></i>Mobile Phone (80)</a></li>
								<li><a href="products.html"><i
										class="icon-chevron-right"></i>Sound & Vision (15)</a></li>
							</ul></li>
						<li class="subMenu"><a> CLOTHES [840] </a>
							<ul style="display: none">
								<li><a href="products.html"><i
										class="icon-chevron-right"></i>Women's Clothing (45)</a></li>
								<li><a href="products.html"><i
										class="icon-chevron-right"></i>Women's Shoes (8)</a></li>
								<li><a href="products.html"><i
										class="icon-chevron-right"></i>Women's Hand Bags (5)</a></li>
								<li><a href="products.html"><i
										class="icon-chevron-right"></i>Men's Clothings (45)</a></li>
								<li><a href="products.html"><i
										class="icon-chevron-right"></i>Men's Shoes (6)</a></li>
								<li><a href="products.html"><i
										class="icon-chevron-right"></i>Kids Clothing (5)</a></li>
								<li><a href="products.html"><i
										class="icon-chevron-right"></i>Kids Shoes (3)</a></li>
							</ul></li>
						<li class="subMenu"><a>FOOD AND BEVERAGES [1000]</a>
							<ul style="display: none">
								<li><a href="products.html"><i
										class="icon-chevron-right"></i>Angoves (35)</a></li>
								<li><a href="products.html"><i
										class="icon-chevron-right"></i>Bouchard Aine & Fils (8)</a></li>
								<li><a href="products.html"><i
										class="icon-chevron-right"></i>French Rabbit (5)</a></li>
								<li><a href="products.html"><i
										class="icon-chevron-right"></i>Louis Bernard (45)</a></li>
								<li><a href="products.html"><i
										class="icon-chevron-right"></i>BIB Wine (Bag in Box) (8)</a></li>
								<li><a href="products.html"><i
										class="icon-chevron-right"></i>Other Liquors & Wine (5)</a></li>
								<li><a href="products.html"><i
										class="icon-chevron-right"></i>Garden (3)</a></li>
								<li><a href="products.html"><i
										class="icon-chevron-right"></i>Khao Shong (11)</a></li>
							</ul></li>
						<li><a href="products.html">HEALTH & BEAUTY [18]</a></li>
						<li><a href="products.html">SPORTS & LEISURE [58]</a></li>
						<li><a href="products.html">BOOKS & ENTERTAINMENTS [14]</a></li>
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
				<!-- Find de Sidebar -->

				<div class="span9">
					<ul class="breadcrumb">
						<li><a href="index.html">Home</a> <span class="divider">/</span></li>
						<li class="active">CARRITO</li>
					</ul>
					<h3>
						Carrito de Compras [ <small>3 Item(s) </small>]<a
							href="products.html" class="btn btn-large pull-right"><i
							class="icon-arrow-left"></i> Continuar Comprando </a>
					</h3>
					<hr class="soft" />

					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Producto</th>
								<th>Descripcion</th>
								<th>Cantidad/Actualizar</th>
								<th>Precio</th>
								<th>Discount</th>
								<th>Tax</th>
								<th>Total</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${productos }" var="producto">

								<tr>
									<td><img width="60" src="${producto.producto.urlImage }"
										alt="" /></td>
									<td>${producto.producto.nombre }<br />
									</td>
									<td>
										<div class="input-append">
											<input class="span1" style="max-width: 34px" placeholder="1"
												id="appendedInputButtons" size="16" type="text"
												value="${producto.cantidad }" disabled>
											<button class="btn" type="button">
												<i class="icon-minus"></i>
											</button>
											<button class="btn" type="button">
												<i class="icon-plus"></i>
											</button>
											<button class="btn btn-danger" type="button">
												<i class="icon-remove icon-white"></i>
											</button>
										</div>
									</td>
									<td>$${producto.producto.precio }</td>
									<td>$00.00</td>
									<td>$00.00</td>
									<td>${producto.subTotal }</td>
								</tr>
							</c:forEach>
							
							<tr>
								<td colspan="6" style="text-align: right"><strong>TOTAL (										
											<c:forEach items="${productos }" var="producto">
											${producto.subTotal } +
											</c:forEach>) =</strong></td>
								<td class="label label-important" style="display: block"><strong>
										${total } </strong></td>
							</tr>
						</tbody>
					</table>

					<a href="products.html" class="btn btn-large"><i
						class="icon-arrow-left"></i> Continuar Comprando </a> <a
						href="login.html" class="btn btn-large pull-right">Siguiente <i
						class="icon-arrow-right"></i></a>

				</div>
			</div>
		</div>

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
	</div>
</body>
</html>