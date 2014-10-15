<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head dir=":">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OneClick | Carrito</title>
<link rel="shortcut icon" href="resources/img/icono_oneclick.png"
	type="image/png" />
<!-- Estilo Css -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/bootstrap-theme.min.css">


<!-- Javascripts -->
<script src="resources/js/jquery-1.2.11.0.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
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
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/Ferreteria_Construccion/1">inicio</a>
		</div>

		<!-- NAVBAR Derecha CONTACTO/CATEGORIA/BUSQUEDA -->
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

			<!-- NAVBAR Izquierda LOGIN/CARRITO -->
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
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>

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

		</c:if>

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
		<c:if test="${pedido == null }">
			<p>No tiene productos en su carrito!</p>
		</c:if>
		<p>Subtotal : ${total }</p>
	</div>
</body>
</html>