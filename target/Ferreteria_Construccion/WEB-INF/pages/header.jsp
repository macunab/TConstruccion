<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<!-- Header - Client -->
<!-- author : Marco, Acuna -->
<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="resources/img/icono_oneclick.png"
	type="image/png" />
<title>OneClick - Ferreteria online</title>
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

<script type="text/javascript">
	$(document).ready(function() {

		actualizarCarrito();
		actualizarTotalCarrito();

	});

	function addCarrito(producto) {

		var id = "#cantidad_" + producto;
		console.log(id);
		console.log($("#nav-busqueda").val());

		$.ajax({
			type : "post",
			url : "add_carrito",
			cache : false,
			data : 'producto=' + producto + '&cantidad=' + $(id).val(),
			success : function(data) {
				actualizarCarrito();
				actualizarTotalCarrito();

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
			data : 'busqueda=' + $('#nav-busqueda').val() + '&filtro='
					+ $('#categorias').val(),
			success : function(data) {
				$('#main-articulos').html(data);
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