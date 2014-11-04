<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<!-- Detalle de Producto - Client -->
<!-- author : Marco, Acuna -->
<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Producto Detalle</title>
<link rel="shortcut icon" href="resources/img/icono_oneclick.png"
	type="image/png" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Descripcion detallada de un producto">
<meta name="author" content="Acuña,Marco">


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
<script type="text/javascript">
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

 <div class="container">
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
								&nbsp</span> <span class="badge pull-right">0</span></a></li>
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
	<div class="row">
		<div class="col-lg-2">
			<a href="#" class="thumbnail"> <img alt="120x120"
				src="${producto.urlImage }"></a>
		</div>
		<div class="col-lg-4">
			<h2>${producto.nombre }</h2>
			<p>${producto.descripcion }</p>
			<p>Precio :$ ${producto.precio }</p>
			<p>
				<input value="1" type="text"><a class="btn btn-danger"
					href="#" role="button"><span
					class="glyphicon glyphicon-shopping-cart"></span></a> <a
					class="btn btn-success" href="#" role="button">Comprar ahora</a>
			</p>
		</div>
	</div>
</div>
-->
<!-- <div id="header">
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
					<li class=""><a href="special_offer.html">Productos</a></li>
					<li class=""><a href="normal.html">Empresa</a></li>
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
</div>-->
<%@ include file="header.jsp"%>
<!-- Header End====================================================================== -->
<div id="mainBody">
	<div class="container">
		<div class="row">
			<!-- Sidebar ================================================== -->
			<%@ include file="side_bar.jsp"%>
			<!-- Sidebar end=============================================== -->
			<div class="span9">
				<ul class="breadcrumb">
					<li><a href="1">Home</a> <span class="divider">/</span></li>
					<li><a href="#">Productos</a> <span class="divider">/</span></li>
					<li class="active">Detalles del producto</li>
				</ul>

				<div id="result" style="display: none;"
					class="alert alert-info alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert">
						<span aria-hidden="true">&times;</span><span class="sr-only"></span>
					</button>
					<strong>Listo!</strong> El producto se ha agregado a su carrito con
					exito.
				</div>

				<div class="row">
					<div id="gallery" class="span3">
						<a href="${producto.urlImage }" title="${producto.nombre }"> <img
							src="${producto.urlImage}" style="width: 100%"
							alt="${producto.nombre }" />
						</a>

					</div>
					<div class="span6">
						<h3>${producto.nombre }</h3>
						<small></small>
						<hr class="soft" />
						<form class="form-horizontal qtyFrm">
							<div class="control-group">
								<label class="control-label"><span>$${producto.precio
										}</span></label>
								<sec:authorize access="hasRole('ROLE_CLIENTE')">
									<div class="controls">
										<input id="cantidad_producto" type="number" class="span1"
											placeholder="Qty." /> <a
											class="btn btn-large btn-primary pull-right"
											OnClick="addCarritoDetalle(${producto.codigo });">
											Agregar al carrito <i class=" icon-shopping-cart"></i>
										</a>
									</div>
								</sec:authorize>
							</div>
						</form>

						<hr class="soft" />
						<h4>${producto.stock }itemsenstock</h4>
						<form class="form-horizontal qtyFrm pull-right">
							<!-- <div class="control-group">
								<label class="control-label"><span>Color</span></label>
								<div class="controls">
									<select class="span2">
										<option>Black</option>
										<option>Red</option>
										<option>Blue</option>
										<option>Brown</option>
									</select>
								</div>
							</div> -->
						</form>
						<hr class="soft clr" />
						<p>${producto.descripcion }</p>
						<!-- <a class="btn btn-small pull-right" href="#detail">More
							Details</a> <br class="clr" /> <a href="#" name="detail"></a> -->
						<hr class="soft" />
					</div>

					<div class="span9"></div>

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
				<!-- <h5>ACCOUNT</h5>
					<a href="login.html">YOUR ACCOUNT</a> <a href="login.html">PERSONAL
						INFORMATION</a> <a href="login.html">ADDRESSES</a> <a
						href="login.html">DISCOUNT</a> <a href="login.html">ORDER
						HISTORY</a> -->
			</div>
			<div class="span3">
				<!-- <h5>INFORMATION</h5>
					<a href="contact.html">CONTACT</a> <a href="register.html">REGISTRATION</a>
					<a href="legal_notice.html">LEGAL NOTICE</a> <a href="tac.html">TERMS
						AND CONDITIONS</a> <a href="faq.html">FAQ</a> -->
			</div>
			<div class="span3">
				<!-- <h5>OUR OFFERS</h5>
					<a href="#">NEW PRODUCTS</a> <a href="#">TOP SELLERS</a> <a
						href="special_offer.html">SPECIAL OFFERS</a> <a href="#">MANUFACTURERS</a>
					<a href="#">SUPPLIERS</a> -->
			</div>
			<div id="socialMedia" class="span3 pull-right">
				<!-- <h5>SOCIAL MEDIA</h5>
					<a href="#"><img width="60" height="60"
						src="themes/images/facebook.png" title="facebook" alt="facebook" /></a>
					<a href="#"><img width="60" height="60"
						src="themes/images/twitter.png" title="twitter" alt="twitter" /></a>
					<a href="#"><img width="60" height="60"
						src="themes/images/youtube.png" title="youtube" alt="youtube" /></a> -->
			</div>
		</div>
		<p class="pull-right">&copy; OneClick Company</p>
	</div>
	<script type="text/javascript">
	function addCarritoDetalle(producto) {
		
		console.log($('#cantidad_producto').val());
		console.log(producto);
		$('#result').hide();

	$.ajax({
			type : "post",
			url : "add_carrito",
			cache : false,
			data : 'producto=' + producto + '&cantidad=' + $('#cantidad_producto').val(),
			success : function(data) {
				actualizarCarrito();
				actualizarTotalCarrito();
				$('#result').show();
			},
		});
	}
	</script>
	<!-- Container End -->
</div>
</body>
</html>