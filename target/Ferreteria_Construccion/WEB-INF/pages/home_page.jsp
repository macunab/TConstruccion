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

		$.ajax({
			type : "post",
			url : "get_productos_carrito",
			cache : false,
			success : function(data) {
				$("#cantidad").text(data);
			},
		});

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
				//$('#content').html(data);
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
						src="resources/img/OneClick-2.png" alt="Bootsshop" /></a>
					<form class="form-inline navbar-search" method="post"
						action="products.html">
						<input id="nav-busqueda" class="srchTxt" type="text" /> <select
							class="srchTxt">
							<option>All</option>
							<option>CLOTHES</option>
							<option>FOOD AND BEVERAGES</option>
							<option>HEALTH & BEAUTY</option>
							<option>SPORTS & LEISURE</option>
							<option>BOOKS & ENTERTAINMENTS</option>
						</select>
						<button type="submit" id="submitButton" class="btn btn-primary">Go</button>
					</form>
					<ul id="topMenu" class="nav pull-right">
						<li class=""><a href="special_offer.html">Specials Offer</a></li>
						<li class=""><a href="normal.html">Delivery</a></li>
						<li class=""><a href="contact.html">Contacto</a></li>
						<li class=""><a href="#login" role="button"
							data-toggle="modal" style="padding-right: 0"><span
								class="btn btn-large btn-success">Ingresar</span></a>
							<div id="login" class="modal hide fade in" tabindex="-1"
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
							</div></li>
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
						<a id="myCart" href="product_summary.html"><img
							src="themes/images/ico-cart.png" alt="cart">3 Items in your
							cart <span class="badge badge-warning pull-right">$155.00</span></a>
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
						<img src="themes/images/products/panasonic.jpg"
							alt="Bootshop panasonoc New camera" />
						<div class="caption">
							<h5>Panasonic</h5>
							<h4 style="text-align: center">
								<a class="btn" href="product_details.html"> <i
									class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i
									class="icon-shopping-cart"></i></a> <a class="btn btn-primary"
									href="#">$222.00</a>
							</h4>
						</div>
					</div>
					<br />
					<div class="thumbnail">
						<img src="themes/images/products/kindle.png"
							title="Bootshop New Kindel" alt="Bootshop Kindel">
						<div class="caption">
							<h5>Kindle</h5>
							<h4 style="text-align: center">
								<a class="btn" href="product_details.html"> <i
									class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i
									class="icon-shopping-cart"></i></a> <a class="btn btn-primary"
									href="#">$222.00</a>
							</h4>
						</div>
					</div>
					<br />
					<div class="thumbnail">
						<img src="themes/images/payment_methods.png"
							title="Bootshop Payment Methods" alt="Payments Methods">
						<div class="caption">
							<h5>Payment Methods</h5>
						</div>
					</div>
				</div>
				<!-- Sidebar end=============================================== -->
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
								<th>Product</th>
								<th>Description</th>
								<th>Quantity/Update</th>
								<th>Price</th>
								<th>Discount</th>
								<th>Tax</th>
								<th>Total</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><img width="60" src="themes/images/products/4.jpg"
									alt="" /></td>
								<td>MASSA AST<br />Color : black, Material : metal
								</td>
								<td>
									<div class="input-append">
										<input class="span1" style="max-width: 34px" placeholder="1"
											id="appendedInputButtons" size="16" type="text">
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
								<td>$120.00</td>
								<td>$25.00</td>
								<td>$15.00</td>
								<td>$110.00</td>
							</tr>
							<tr>
								<td><img width="60" src="themes/images/products/8.jpg"
									alt="" /></td>
								<td>MASSA AST<br />Color : black, Material : metal
								</td>
								<td>
									<div class="input-append">
										<input class="span1" style="max-width: 34px" placeholder="1"
											size="16" type="text">
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
								<td>$7.00</td>
								<td>--</td>
								<td>$1.00</td>
								<td>$8.00</td>
							</tr>
							<tr>
								<td><img width="60" src="themes/images/products/3.jpg"
									alt="" /></td>
								<td>MASSA AST<br />Color : black, Material : metal
								</td>
								<td>
									<div class="input-append">
										<input class="span1" style="max-width: 34px" placeholder="1"
											size="16" type="text">
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
								<td>$120.00</td>
								<td>$25.00</td>
								<td>$15.00</td>
								<td>$110.00</td>
							</tr>

							<tr>
								<td colspan="6" style="text-align: right">Total Price:</td>
								<td>$228.00</td>
							</tr>
							<tr>
								<td colspan="6" style="text-align: right">Total Discount:</td>
								<td>$50.00</td>
							</tr>
							<tr>
								<td colspan="6" style="text-align: right">Total Tax:</td>
								<td>$31.00</td>
							</tr>
							<tr>
								<td colspan="6" style="text-align: right"><strong>TOTAL
										($228 - $50 + $31) =</strong></td>
								<td class="label label-important" style="display: block"><strong>
										$155.00 </strong></td>
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
						src="themes/images/twitter.png" title="twitter" alt="twitter" /></a> <a
						href="#"><img width="60" height="60"
						src="themes/images/youtube.png" title="youtube" alt="youtube" /></a>
				</div>
			</div>
			<p class="pull-right">&copy; OneClick Company</p>
		</div>
		<!-- Container End -->
	</div>

</body>
</html>