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
<link rel="shortcut icon" href="resources/img/icono_oneclick.png"
	type="image/png" />
<title>OneClick | Home</title>
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
	
	function actualizarCarrito(){
		
		$.ajax({
			type : "post",
			url : "get_productos_carrito",
			cache : false,
			success : function(data) {
				$("#cantidad").text(data);
			},
		});
	}
	
	function actualizarTotalCarrito(){
		

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

	<c:url var="firstUrl" value="/1" />
	<c:url var="lastUrl" value="/${page.totalPages}" />
	<c:url var="prevUrl" value="/${currentIndex - 1}" />
	<c:url var="nextUrl" value="/${currentIndex + 1}" />

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
			<a class="navbar-brand" href="">inicio</a>
		</div>

		
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				
				<li><a href="contacto">Contacto</a></li>
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
					<li><a
						href="get_carrito?username=<%=SecurityContextHolder.getContext()
						.getAuthentication().getName()%>"><span
							class="glyphicon glyphicon-shopping-cart"></span> <span>
								&nbsp</span> <span id="cantidad" class="badge pull-right">0</span></a></li>
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
				</sec:authorize>
				<sec:authorize access="isAnonymous()">
					<li><a href="login"><strong>Ingresar</strong></a></li>
				</sec:authorize>

			</ul>
		</div>

	</div>
	 </nav>



	<div id="main-container" class="container">

		<sec:authorize access="isAnonymous()">
			<div class="jumbotron">
				<h1>Vamos de compras,</h1>
				<p>Consiga todo lo que necesita para la construccion o las
					labores cotidianas e indispensables del hogas desde nuestro e-shop,
					si ya dispone de una cuenta ingrese desde Sing in, sino creese una
					facilmente desde Sign up!</p>
				<div class="form-group">
					<div class="col-md-8">
						
						<a href="save_usuario" id="button2id" name="button2id"
							class="btn btn-primary">Registrarse</a>
					</div>
				</div>
			</div>
		</sec:authorize>

		<h2>Articulos destacados:</h2>


		<div class="row">
			<c:forEach items="${productos }" var="producto">

			
				<div class="modal face" id="confirmacion${producto.codigo }"
					tabindex="-1" role="dialog" aria-labelledby="modal"
					aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="model-title">Cuantos ${producto.nombre } desea
									sumar a su carrito.</h4>
							</div>
							<div class="modal-body">

							
								<div>
									<label class="col-md-4 control-label" for="cantidad">Cantidad</label>

									<input id="cantidad_${producto.codigo }" name="cantidad_p"
										placeholder="cantidad de articulos" class="form-control"
										type="text" />


								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Cancelar</button>
								<button onClick="addCarrito(${producto.codigo});"
									class="btn btn-primary" data-dismiss="modal">Agregar</button>
							</div>
						</div>
					</div>

				</div>
				

				<div class="col-xs-4">

					<h3>${producto.nombre }</h3>
					<a href="get_producto?codigo=${producto.codigo }" class="thumbnail">
						<img width="200" src="${producto.urlImage }" alt="125x125">


					</a>
					<div class="caption">


					
						<div class="row">
							<div class="col-lg-6">
								<h4>$${producto.precio }</h4>
							</div>
							<div class="col-lg-6">
								<sec:authorize access="hasRole('ROLE_CLIENTE')">
									<div class="pull-right">
										<c:choose>
											<c:when test="${producto.stock >= 1 }">
												<button data-toggle="modal"
													data-target="#confirmacion${producto.codigo }"
													class="btn btn-success button-right">
													<span class="glyphicon glyphicon-shopping-cart"></span>
													Comprar
												</button>

											</c:when>
											<c:otherwise>

												<button class="btn btn-danger button-right">
													<span class="glyphicon glyphicon-remove"></span> Sin stock
												</button>

											</c:otherwise>

										</c:choose>

									</div>
								</sec:authorize>
							</div>

						</div>

					</div>

				</div>
			</c:forEach>
		</div>

	
		<div class="container text-center">
			<ul class="pagination">
				<c:choose>
					<c:when test="${currentIndex == 1}">
						<li class="disabled"><a href="#">&lt;&lt;</a></li>
						<li class="disabled"><a href="#">&lt;</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${firstUrl}">&lt;&lt;</a></li>
						<li><a href="${prevUrl}">&lt;</a></li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${beginIndex}" end="${endIndex}">
					<c:url var="pageUrl" value="/${i}" />
					<c:choose>
						<c:when test="${i == currentIndex}">
							<li class="active"><a href="${pageUrl}"><c:out
										value="${i}" /></a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${pageUrl}"><c:out value="${i}" /></a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${currentIndex == page.totalPages}">
						<li class="disabled"><a href="#">&gt;</a></li>
						<li class="disabled"><a href="#">&gt;&gt;</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${nextUrl}">&gt;</a></li>
						<li><a href="${lastUrl}">&gt;&gt;</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		

	</div>


	<div class="panel panel-default container text-center">
		<div class="row">
			<div class="col-lg-12">
				<ul class="nav nav-pills nav-justified">
					<li><a href="/">© 2014 OneClick.</a></li>
					<li><a href="#">Terms of Service</a></li>
					<li><a href="#">Privacy</a></li>
				</ul>
			</div>
		</div>
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
						<!-- <div id="login" class="modal hide fade in" tabindex="-1"
								role="dialog" aria-labelledby="login" aria-hidden="false">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h3>Login Block</h3>
								</div>
								<div class="modal-body">
									<form class="form-horizontal loginFrm">
										<div class="control-group">
											<input type="text" id="inputEmail" placeholder="Email">
										</div>
										<div class="control-group">
											<input type="password" id="inputPassword"
												placeholder="Password">
										</div>
										<div class="control-group">
											<label class="checkbox"> <input type="checkbox">
												Remember me
											</label>
										</div>
									</form>
									<button type="submit" class="btn btn-success">Sign in</button>
									<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
								</div>
							</div>-->
				
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
							<a id="myCart" href="get_carrito?username=<%=SecurityContextHolder.getContext()
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
				<!-- Sidebar end=============================================== -->
				<div class="span9">
					<ul class="breadcrumb">
						<li class="active">Home</li>
					</ul>
					<h3>
						Productos <small class="pull-right"> 40 products are
							available </small>
					</h3>
					<hr class="soft" />
					<p>En OneClick.com encontraras todo lo que necesites al mejor
						precio, desde maquinaria industrial hasta insumos basicos para el
						hogar y la construccion, Si no encuentras lo que buscas no dudes
						en consultarnos por medio de la seccion de contacto.</p>
					<hr class="soft" />
					<form class="form-horizontal span6">
						<div class="control-group">
							<label class="control-label alignL">Ordenar por </label> <select>
								<option>Priduct name A - Z</option>
								<option>Priduct name Z - A</option>
								<option>Productos con stock</option>
								<option>Precio mas bajo</option>
							</select>
						</div>
					</form>

					<!-- TAB CONTENT - visualizacion de productos -->
					<div id="myTab" class="pull-right">
						<a href="#listView" data-toggle="tab"><span
							class="btn btn-large"><i class="icon-list"></i></span></a> <a
							href="#blockView" data-toggle="tab"><span
							class="btn btn-large btn-primary"><i class="icon-th-large"></i></span></a>
					</div>
					<br class="clr" />
					<div class="tab-content">
						<!-- Vista en lista -->
						<div class="tab-pane" id="listView">

							<c:forEach items="${productos }" var="producto">

								<!-- MODAL DE AGREGAR AL CARRITO -->
								<div id="confirmacion${producto.codigo }"
									class="modal hide fade in" tabindex="-1" role="dialog"
									aria-labelledby="login" aria-hidden="false">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">×</button>
										<h3>Cuantos ${producto.nombre } desea sumar a su carrito.</h3>
									</div>
									<div class="modal-body">
										<form class="form-horizontal loginFrm">
											<div class="control-group">

												<label class="col-md-4 control-label" for="cantidad">Cantidad</label>

												<input id="cantidad_${producto.codigo }" name="cantidad_p"
													placeholder="cantidad de articulos" class="form-control"
													type="text" />
											</div>


										</form>
										<button onClick="addCarrito(${producto.codigo});"
											class="btn btn-primary" data-dismiss="modal">Agregar</button>
										<button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
									</div>
								</div>
								<!-- FIN DE AGREGAR CARRITO -->

								<div class="row">
									<div class="span2">
										<img src="${producto.urlImage}" alt="Sin imagen" />
									</div>
									<div class="span4">
										<h3>${producto.nombre }</h3>
										<hr class="soft" />
										<h5>Stock : ${producto.stock }</h5>
										<p>${producto.descripcion }</p>
										<a class="btn btn-small pull-right"
											href="product_details.html">Ver Detalles</a> <br class="clr" />
									</div>
									<div class="span3 alignR">
										<form class="form-horizontal qtyFrm">
											<h3>$${producto.precio }</h3>
											<br />

											<c:choose>
												<c:when test="${producto.stock >= 1 }">
													<sec:authorize access="hasRole('ROLE_CLIENTE')">
														<a data-toggle="modal"
															data-target="#confirmacion${producto.codigo }"
															class="btn btn-large btn-primary"> Add to <i
															class=" icon-shopping-cart"></i>
														</a>
													</sec:authorize>

												</c:when>
												<c:otherwise>

													<button class="btn btn-danger button-right" disabled>
														<span class="icon-remove"></span> Sin stock
													</button>

												</c:otherwise>

											</c:choose>

											<a href="product_details.html" class="btn btn-large"><i
												class="icon-zoom-in"></i></a>

										</form>
									</div>
								</div>
								<hr class="soft" />
							</c:forEach>

						</div>

						<!-- Vista en bloques -->
						<!-- ****************************************** -->
						<div class="tab-pane  active" id="blockView">
							<ul class="thumbnails">
								<c:forEach items="${productos }" var="producto">

									<!-- MODAL DE AGREGAR AL CARRITO -->
									<div id="confirmacion_bloque${producto.codigo }"
										class="modal hide fade in" tabindex="-1" role="dialog"
										aria-labelledby="login" aria-hidden="false">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">×</button>
											<h3>Cuantos ${producto.nombre } desea sumar a su
												carrito.</h3>
										</div>
										<div class="modal-body">
											<form class="form-horizontal loginFrm">
												<div class="control-group">

													<label class="col-md-4 control-label" for="cantidad">Cantidad</label>

													<input id="cantidad_${producto.codigo }" name="cantidad_p"
														placeholder="cantidad de articulos" class="form-control"
														type="text" />
												</div>


											</form>
											<button onClick="addCarrito(${producto.codigo});"
												class="btn btn-primary" data-dismiss="modal">Agregar</button>
											<button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
										</div>
									</div>
									<!-- FIN DE AGREGAR CARRITO -->

									<li class="span3">
										<div class="thumbnail">
											<a href="product_details.html"><img
												src="${producto.urlImage }" alt="" /></a>
											<div class="caption">
												<h5>${producto.nombre }</h5>
												<p></p>
												<h4 style="text-align: center">
													<a class="btn" href="product_details.html"> <i
														class="icon-zoom-in"></i></a>

													<c:choose>
														<c:when test="${producto.stock >= 1 }">
															<sec:authorize access="hasRole('ROLE_CLIENTE')">
																<a data-toggle="modal"
																	data-target="#confirmacion_bloque${producto.codigo }"
																	class="btn btn-primary"> Add to <i
																	class=" icon-shopping-cart"></i>
																</a>
															</sec:authorize>
														</c:when>
														<c:otherwise>
															<button class="btn btn-danger button-right" disabled>
																<span class="icon-remove"></span> Sin stock
															</button>
														</c:otherwise>
													</c:choose>

													<a class="btn btn-primary" href="#">&euro;${producto.precio }</a>
												</h4>
											</div>
										</div>
									</li>
								</c:forEach>

							</ul>
							<hr class="soft" />
						</div>
						<!-- Fin de Vista en Bloque -->

					</div>

					<!-- Paginacion -->
					<!-- *********************************************** -->
					<div class="pagination">
						<ul>
							<c:choose>
								<c:when test="${currentIndex == 1}">
									<li class="disabled"><a href="#">&lt;&lt;</a></li>
									<li class="disabled"><a href="#">&lt;</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="${firstUrl}">&lt;&lt;</a></li>
									<li><a href="${prevUrl}">&lt;</a></li>
								</c:otherwise>
							</c:choose>
							<c:forEach var="i" begin="${beginIndex}" end="${endIndex}">
								<c:url var="pageUrl" value="/${i}" />
								<c:choose>
									<c:when test="${i == currentIndex}">
										<li class="active"><a href="${pageUrl}"><c:out
													value="${i}" /></a></li>
									</c:when>
									<c:otherwise>
										<li><a href="${pageUrl}"><c:out value="${i}" /></a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${currentIndex == page.totalPages}">
									<li class="disabled"><a href="#">&gt;</a></li>
									<li class="disabled"><a href="#">&gt;&gt;</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="${nextUrl}">&gt;</a></li>
									<li><a href="${lastUrl}">&gt;&gt;</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
					<!-- Fin Paginacion -->

					<br class="clr" />
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