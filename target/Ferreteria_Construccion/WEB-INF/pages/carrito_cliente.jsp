<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<!-- Carrito - Client -->
<!-- author : Marco, Acuna -->
<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OneClick | Carrito</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">


<link id="callCss" rel="stylesheet"
	href="resources/css/bootstrap.min.css" media="screen" />
<link href="resources/css/base.css" rel="stylesheet" media="screen" />

<link href="resources/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link href="resources/css/font-awesome.css" rel="stylesheet"
	type="text/css">

<script src="resources/js/jquery-1.2.11.0.js"></script>
<script src="resources/js/bootstrap.min.js" type="text/javascript"></script>

<script src="resources/js/bootshop.js"></script>
<script src="resources/js/jquery.lightbox-0.5.js"></script>
<link rel="shortcut icon" href="resources/img/icono_oneclick.png"
	type="image/png" />


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
	
	function deleteProductoCarrito(producto) {

		console.log(producto);

		$.ajax({
			type : "post",
			url : "remove_producto_carrito",
			cache : false,
			data : 'producto=' + producto,
			success : function(data) {
				window.location.href = "get_carrito";

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


	<div id="header">
		<div class="container">
			<div id="welcomeLine" class="row"></div>

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
							class="srchTxt">
							<option>All</option>
							<c:forEach items="${categorias }" var="categoria">
								<option>${categoria.nombre }</option>
							</c:forEach>
						</select>
						<button type="submit" id="submitButton" class="btn btn-primary">Go</button>
					</form>
					<ul id="topMenu" class="nav pull-right">
						<li class=""><a href="#">Productos</a></li>
						<li class=""><a href="#">Empresa</a></li>
						<li class=""><a href="contact">Contacto</a></li>
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
	</div> -->

<%@ include file="header.jsp"%>
<!-- Header End====================================================================== -->
<div id="mainBody">
	<div class="container">
		<div class="row">
			<!-- Sidebar ================================================== -->
			<%@ include file="side_bar.jsp"%>
			<!-- Find de Sidebar -->

			<div class="span9">
				<ul class="breadcrumb">
					<li><a href="1">Home</a> <span class="divider">/</span></li>
					<li class="active">Carrito</li>
				</ul>
				<h3>
					Carrito de Compras [ <small>${fn:length(productos)}
						Articulo(s) </small>]<a href="1" class="btn btn-large pull-right"><i
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
							<th>Descuento</th>
							<th>Remover</th>
							<th>Total</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${productos }" var="producto">

							<!-- MODAL DE ELIMINAR PRODUCTO CARRITO -->
							<div id="confirmacion${producto.producto.codigo }"
								class="modal hide fade in" tabindex="-1" role="dialog"
								aria-labelledby="login" aria-hidden="false">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h3>Eliminar producto del carrito</h3>
								</div>
								<div class="modal-body">
									<form class="form-horizontal loginFrm">
										<div class="control-group">

											<label class="col-md-4 control-label">Realmente desea
												eliminar el producto ${producto.producto.nombre } del
												carrito</label>

										</div>

									</form>
									<button
										onClick="deleteProductoCarrito(${producto.producto.codigo});"
										class="btn btn-primary" data-dismiss="modal">Si</button>
									<button class="btn" data-dismiss="modal" aria-hidden="true">No</button>
								</div>
							</div>

							<!-- FIN DE MODAL ELIMINAR PRODUCTO CARRITO -->

							<tr>
								<td><img width="60" src="${producto.producto.urlImage }"
									alt="producto_img" /></td>
								<td>${producto.producto.nombre }<br />
								</td>
								<td>
									<div class="input-append">
										<div class="controls">
											<input class="span1" type="number"
												value="${producto.cantidad }">
										</div>
									</div>
								</td>
								<td>$${producto.producto.precio }</td>
								<td>$00.00</td>
								<td><button class="btn btn-danger" data-toggle="modal"
										data-target="#confirmacion${producto.producto.codigo }"
										type="button">
										<i class="icon-remove icon-white"></i>
									</button></td>
								<td>${producto.subTotal }</td>
							</tr>
						</c:forEach>

						<tr>
							<td colspan="6" style="text-align: right"><strong>TOTAL
									( <c:forEach items="${productos }" var="producto">
											${producto.subTotal } +
											</c:forEach>) =
							</strong></td>
							<td class="label label-important" style="display: block"><strong>
									${total } </strong></td>
						</tr>
					</tbody>
				</table>

				<a href="1" class="btn btn-large"><i class="icon-arrow-left"></i>
					Continuar Comprando </a>

				<c:choose>
					<c:when test="${fn:length(productos) < 1}">

					</c:when>
					<c:otherwise>
						<a href="alta_pedido" class="btn btn-large pull-right">Siguiente <i
							class="icon-arrow-right"></i></a>
					</c:otherwise>
				</c:choose>


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