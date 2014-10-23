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
<title>Producto Detalle</title>
<link rel="shortcut icon" href="resources/img/icono_oneclick.png"
	type="image/png" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Descripcion detallada de un producto">
<meta name="author" content="Acuña,Marco">

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
										<li><a class="active" href="products.html"><i
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
				<div class="span9">
					<ul class="breadcrumb">
						<li><a href="1">Home</a> <span class="divider">/</span></li>
						<li><a href="products.html">Productos</a> <span
							class="divider">/</span></li>
						<li class="active">Detalles del producto</li>
					</ul>
					<div class="row">
						<div id="gallery" class="span3">
							<a href="${producto.urlImage }"
								title="Fujifilm FinePix S2950 Digital Camera"> <img
								src="${producto.urlImage}" style="width: 100%"
								alt="Fujifilm FinePix S2950 Digital Camera" />
							</a>

						</div>
						<div class="span6">
							<h3>${producto.nombre }</h3>
							<small>- (14MP, 18x Optical Zoom) 3-inch LCD</small>
							<hr class="soft" />
							<form class="form-horizontal qtyFrm">
								<div class="control-group">
									<label class="control-label"><span>$${producto.precio }</span></label>
									<div class="controls">
										<input type="number" class="span1" placeholder="Qty." />
										<button type="submit"
											class="btn btn-large btn-primary pull-right">
											Agregar al carrito <i class=" icon-shopping-cart"></i>
										</button>
									</div>
								</div>
							</form>

							<hr class="soft" />
							<h4>${producto.stock } items en stock</h4>
							<form class="form-horizontal qtyFrm pull-right">
								<div class="control-group">
									<label class="control-label"><span>Color</span></label>
									<div class="controls">
										<select class="span2">
											<option>Black</option>
											<option>Red</option>
											<option>Blue</option>
											<option>Brown</option>
										</select>
									</div>
								</div>
							</form>
							<hr class="soft clr" />
							<p>${producto.descripcion }</p>
							<a class="btn btn-small pull-right" href="#detail">More
								Details</a> <br class="clr" /> <a href="#" name="detail"></a>
							<hr class="soft" />
						</div>

						<div class="span9">
							<ul id="productDetail" class="nav nav-tabs">
								<li class="active"><a href="#home" data-toggle="tab">Product
										Details</a></li>
								<li><a href="#profile" data-toggle="tab">Related
										Products</a></li>
							</ul>
							<div id="myTabContent" class="tab-content">
								<div class="tab-pane fade active in" id="home">
									<h4>Product Information</h4>
									<table class="table table-bordered">
										<tbody>
											<tr class="techSpecRow">
												<th colspan="2">Product Details</th>
											</tr>
											<tr class="techSpecRow">
												<td class="techSpecTD1">Brand:</td>
												<td class="techSpecTD2">Fujifilm</td>
											</tr>
											<tr class="techSpecRow">
												<td class="techSpecTD1">Model:</td>
												<td class="techSpecTD2">FinePix S2950HD</td>
											</tr>
											<tr class="techSpecRow">
												<td class="techSpecTD1">Released on:</td>
												<td class="techSpecTD2">2011-01-28</td>
											</tr>
											<tr class="techSpecRow">
												<td class="techSpecTD1">Dimensions:</td>
												<td class="techSpecTD2">5.50" h x 5.50" w x 2.00" l,
													.75 pounds</td>
											</tr>
											<tr class="techSpecRow">
												<td class="techSpecTD1">Display size:</td>
												<td class="techSpecTD2">3</td>
											</tr>
										</tbody>
									</table>

									<h5>Features</h5>
									<p>
										14 Megapixels. 18.0 x Optical Zoom. 3.0-inch LCD Screen. Full
										HD photos and 1280 x 720p HD movie capture. ISO sensitivity
										ISO6400 at reduced resolution. Tracking Auto Focus. Motion
										Panorama Mode. Face Detection technology with Blink detection
										and Smile and shoot mode. 4 x AA batteries not included. WxDxH
										110.2 ×81.4x73.4mm. Weight 0.341kg (excluding battery and
										memory card). Weight 0.437kg (including battery and memory
										card).<br /> OND363338
									</p>

									<h4>Editorial Reviews</h4>
									<h5>Manufacturer's Description</h5>
									<p>With a generous 18x Fujinon optical zoom lens, the S2950
										really packs a punch, especially when matched with its 14
										megapixel sensor, large 3.0" LCD screen and 720p HD (30fps)
										movie capture.</p>

									<h5>Electric powered Fujinon 18x zoom lens</h5>
									<p>The S2950 sports an impressive 28mm – 504mm* high
										precision Fujinon optical zoom lens. Simple to operate with an
										electric powered zoom lever, the huge zoom range means that
										you can capture all the detail, even when you're at a
										considerable distance away. You can even operate the zoom
										during video shooting. Unlike a bulky D-SLR, bridge cameras
										allow you great versatility of zoom, without the hassle of
										carrying a bag of lenses.</p>
									<h5>Impressive panoramas</h5>
									<p>With its easy to use Panoramic shooting mode you can get
										creative on the S2950, however basic your skills, and rest
										assured that you will not risk shooting uneven landscapes or
										shaky horizons. The camera enables you to take three
										successive shots with a helpful tool which automatically
										releases the shutter once the images are fully aligned to
										seamlessly stitch the shots together in-camera. It's so easy
										and the results are impressive.</p>

									<h5>Sharp, clear shots</h5>
									<p>Even at the longest zoom settings or in the most
										challenging of lighting conditions, the S2950 is able to
										produce crisp, clean results. With its mechanically stabilised
										1/2 3", 14 megapixel CCD sensor, and high ISO sensitivity
										settings, Fujifilm's Dual Image Stabilisation technology
										combines to reduce the blurring effects of both hand-shake and
										subject movement to provide superb pictures.</p>
								</div>
								<div class="tab-pane fade" id="profile">
									<div id="myTab" class="pull-right">
										<a href="#listView" data-toggle="tab"><span
											class="btn btn-large"><i class="icon-list"></i></span></a> <a
											href="#blockView" data-toggle="tab"><span
											class="btn btn-large btn-primary"><i
												class="icon-th-large"></i></span></a>
									</div>
									<br class="clr" />
									<hr class="soft" />
									<div class="tab-content">
										<div class="tab-pane" id="listView">
											<div class="row">
												<div class="span2">
													<img src="themes/images/products/4.jpg" alt="" />
												</div>
												<div class="span4">
													<h3>New | Available</h3>
													<hr class="soft" />
													<h5>Product Name</h5>
													<p>Nowadays the lingerie industry is one of the most
														successful business spheres.We always stay in touch with
														the latest fashion tendencies - that is why our goods are
														so popular..</p>
													<a class="btn btn-small pull-right"
														href="product_details.html">View Details</a> <br
														class="clr" />
												</div>
												<div class="span3 alignR">
													<form class="form-horizontal qtyFrm">
														<h3>$222.00</h3>
														<label class="checkbox"> <input type="checkbox">
															Adds product to compair
														</label><br />
														<div class="btn-group">
															<a href="product_details.html"
																class="btn btn-large btn-primary"> Add to <i
																class=" icon-shopping-cart"></i></a> <a
																href="product_details.html" class="btn btn-large"><i
																class="icon-zoom-in"></i></a>
														</div>
													</form>
												</div>
											</div>
											<hr class="soft" />
											<div class="row">
												<div class="span2">
													<img src="themes/images/products/5.jpg" alt="" />
												</div>
												<div class="span4">
													<h3>New | Available</h3>
													<hr class="soft" />
													<h5>Product Name</h5>
													<p>Nowadays the lingerie industry is one of the most
														successful business spheres.We always stay in touch with
														the latest fashion tendencies - that is why our goods are
														so popular..</p>
													<a class="btn btn-small pull-right"
														href="product_details.html">View Details</a> <br
														class="clr" />
												</div>
												<div class="span3 alignR">
													<form class="form-horizontal qtyFrm">
														<h3>$222.00</h3>
														<label class="checkbox"> <input type="checkbox">
															Adds product to compair
														</label><br />
														<div class="btn-group">
															<a href="product_details.html"
																class="btn btn-large btn-primary"> Add to <i
																class=" icon-shopping-cart"></i></a> <a
																href="product_details.html" class="btn btn-large"><i
																class="icon-zoom-in"></i></a>
														</div>
													</form>
												</div>
											</div>
											<hr class="soft" />
											<div class="row">
												<div class="span2">
													<img src="themes/images/products/6.jpg" alt="" />
												</div>
												<div class="span4">
													<h3>New | Available</h3>
													<hr class="soft" />
													<h5>Product Name</h5>
													<p>Nowadays the lingerie industry is one of the most
														successful business spheres.We always stay in touch with
														the latest fashion tendencies - that is why our goods are
														so popular..</p>
													<a class="btn btn-small pull-right"
														href="product_details.html">View Details</a> <br
														class="clr" />
												</div>
												<div class="span3 alignR">
													<form class="form-horizontal qtyFrm">
														<h3>$222.00</h3>
														<label class="checkbox"> <input type="checkbox">
															Adds product to compair
														</label><br />
														<div class="btn-group">
															<a href="product_details.html"
																class="btn btn-large btn-primary"> Add to <i
																class=" icon-shopping-cart"></i></a> <a
																href="product_details.html" class="btn btn-large"><i
																class="icon-zoom-in"></i></a>
														</div>
													</form>
												</div>
											</div>
											<hr class="soft" />
											<div class="row">
												<div class="span2">
													<img src="themes/images/products/7.jpg" alt="" />
												</div>
												<div class="span4">
													<h3>New | Available</h3>
													<hr class="soft" />
													<h5>Product Name</h5>
													<p>Nowadays the lingerie industry is one of the most
														successful business spheres.We always stay in touch with
														the latest fashion tendencies - that is why our goods are
														so popular..</p>
													<a class="btn btn-small pull-right"
														href="product_details.html">View Details</a> <br
														class="clr" />
												</div>
												<div class="span3 alignR">
													<form class="form-horizontal qtyFrm">
														<h3>$222.00</h3>
														<label class="checkbox"> <input type="checkbox">
															Adds product to compair
														</label><br />
														<div class="btn-group">
															<a href="product_details.html"
																class="btn btn-large btn-primary"> Add to <i
																class=" icon-shopping-cart"></i></a> <a
																href="product_details.html" class="btn btn-large"><i
																class="icon-zoom-in"></i></a>
														</div>
													</form>
												</div>
											</div>

											<hr class="soft" />
											<div class="row">
												<div class="span2">
													<img src="themes/images/products/8.jpg" alt="" />
												</div>
												<div class="span4">
													<h3>New | Available</h3>
													<hr class="soft" />
													<h5>Product Name</h5>
													<p>Nowadays the lingerie industry is one of the most
														successful business spheres.We always stay in touch with
														the latest fashion tendencies - that is why our goods are
														so popular..</p>
													<a class="btn btn-small pull-right"
														href="product_details.html">View Details</a> <br
														class="clr" />
												</div>
												<div class="span3 alignR">
													<form class="form-horizontal qtyFrm">
														<h3>$222.00</h3>
														<label class="checkbox"> <input type="checkbox">
															Adds product to compair
														</label><br />
														<div class="btn-group">
															<a href="product_details.html"
																class="btn btn-large btn-primary"> Add to <i
																class=" icon-shopping-cart"></i></a> <a
																href="product_details.html" class="btn btn-large"><i
																class="icon-zoom-in"></i></a>
														</div>
													</form>
												</div>
											</div>
											<hr class="soft" />
											<div class="row">
												<div class="span2">
													<img src="themes/images/products/9.jpg" alt="" />
												</div>
												<div class="span4">
													<h3>New | Available</h3>
													<hr class="soft" />
													<h5>Product Name</h5>
													<p>Nowadays the lingerie industry is one of the most
														successful business spheres.We always stay in touch with
														the latest fashion tendencies - that is why our goods are
														so popular..</p>
													<a class="btn btn-small pull-right"
														href="product_details.html">View Details</a> <br
														class="clr" />
												</div>
												<div class="span3 alignR">
													<form class="form-horizontal qtyFrm">
														<h3>$222.00</h3>
														<label class="checkbox"> <input type="checkbox">
															Adds product to compair
														</label><br />
														<div class="btn-group">
															<a href="product_details.html"
																class="btn btn-large btn-primary"> Add to <i
																class=" icon-shopping-cart"></i></a> <a
																href="product_details.html" class="btn btn-large"><i
																class="icon-zoom-in"></i></a>
														</div>
													</form>
												</div>
											</div>
											<hr class="soft" />
										</div>
										<div class="tab-pane active" id="blockView">
											<ul class="thumbnails">
												<li class="span3">
													<div class="thumbnail">
														<a href="product_details.html"><img
															src="themes/images/products/10.jpg" alt="" /></a>
														<div class="caption">
															<h5>Manicure &amp; Pedicure</h5>
															<p>Lorem Ipsum is simply dummy text.</p>
															<h4 style="text-align: center">
																<a class="btn" href="product_details.html"> <i
																	class="icon-zoom-in"></i></a> <a class="btn" href="#">Add
																	to <i class="icon-shopping-cart"></i>
																</a> <a class="btn btn-primary" href="#">&euro;222.00</a>
															</h4>
														</div>
													</div>
												</li>
												<li class="span3">
													<div class="thumbnail">
														<a href="product_details.html"><img
															src="themes/images/products/11.jpg" alt="" /></a>
														<div class="caption">
															<h5>Manicure &amp; Pedicure</h5>
															<p>Lorem Ipsum is simply dummy text.</p>
															<h4 style="text-align: center">
																<a class="btn" href="product_details.html"> <i
																	class="icon-zoom-in"></i></a> <a class="btn" href="#">Add
																	to <i class="icon-shopping-cart"></i>
																</a> <a class="btn btn-primary" href="#">&euro;222.00</a>
															</h4>
														</div>
													</div>
												</li>
												<li class="span3">
													<div class="thumbnail">
														<a href="product_details.html"><img
															src="themes/images/products/12.jpg" alt="" /></a>
														<div class="caption">
															<h5>Manicure &amp; Pedicure</h5>
															<p>Lorem Ipsum is simply dummy text.</p>
															<h4 style="text-align: center">
																<a class="btn" href="product_details.html"> <i
																	class="icon-zoom-in"></i></a> <a class="btn" href="#">Add
																	to <i class="icon-shopping-cart"></i>
																</a> <a class="btn btn-primary" href="#">&euro;222.00</a>
															</h4>
														</div>
													</div>
												</li>
												<li class="span3">
													<div class="thumbnail">
														<a href="product_details.html"><img
															src="themes/images/products/13.jpg" alt="" /></a>
														<div class="caption">
															<h5>Manicure &amp; Pedicure</h5>
															<p>Lorem Ipsum is simply dummy text.</p>
															<h4 style="text-align: center">
																<a class="btn" href="product_details.html"> <i
																	class="icon-zoom-in"></i></a> <a class="btn" href="#">Add
																	to <i class="icon-shopping-cart"></i>
																</a> <a class="btn btn-primary" href="#">&euro;222.00</a>
															</h4>
														</div>
													</div>
												</li>
												<li class="span3">
													<div class="thumbnail">
														<a href="product_details.html"><img
															src="themes/images/products/1.jpg" alt="" /></a>
														<div class="caption">
															<h5>Manicure &amp; Pedicure</h5>
															<p>Lorem Ipsum is simply dummy text.</p>
															<h4 style="text-align: center">
																<a class="btn" href="product_details.html"> <i
																	class="icon-zoom-in"></i></a> <a class="btn" href="#">Add
																	to <i class="icon-shopping-cart"></i>
																</a> <a class="btn btn-primary" href="#">&euro;222.00</a>
															</h4>
														</div>
													</div>
												</li>
												<li class="span3">
													<div class="thumbnail">
														<a href="product_details.html"><img
															src="themes/images/products/2.jpg" alt="" /></a>
														<div class="caption">
															<h5>Manicure &amp; Pedicure</h5>
															<p>Lorem Ipsum is simply dummy text.</p>
															<h4 style="text-align: center">
																<a class="btn" href="product_details.html"> <i
																	class="icon-zoom-in"></i></a> <a class="btn" href="#">Add
																	to <i class="icon-shopping-cart"></i>
																</a> <a class="btn btn-primary" href="#">&euro;222.00</a>
															</h4>
														</div>
													</div>
												</li>
											</ul>
											<hr class="soft" />
										</div>
									</div>
									<br class="clr">
								</div>
							</div>
						</div>

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