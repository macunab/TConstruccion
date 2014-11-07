<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>OneClick | Producto detalle</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
<link
	href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,300,400,600,700'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="resources/css/custom-style.css">
</head>
<body>
	<%@ include file="inc/header.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-xs-0 col-sm-3">
				<%@ include file="inc/sidebar.jsp"%>
			</div>

			<div class="col-xs-12 col-sm-9">
				<ol class="breadcrumb">
					<li><a href="">Home</a></li>
					<li class="active">Detalle de producto</li>
				</ol>

				<div id="result" style="display: none;"
					class="alert alert-info alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert">
						<span aria-hidden="true">&times;</span><span class="sr-only"></span>
					</button>
					<strong>Listo!</strong> El producto se ha agregado a su carrito con
					exito.
				</div>

				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<strong>${producto.nombre }</strong>
						</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-xs-5">
								<a href="" class="thumbnail"> <img
									src="resources/img/martillo.jpg" alt="...">
								</a>
								<div class="panel panel-default">
									<div class="panel-body">
										<h2 class="text-center">
											<strong>Precio :</strong> $${producto.precio }
										</h2>
									</div>
								</div>
								<c:choose>
									<c:when test="${producto.stock > 1}">
										<div class="alert alert-success" role="alert">
											<h4 class="text-center">
												<strong>Stock disponible </strong> ${producto.stock }
											</h4>
										</div>
									</c:when>
									<c:otherwise>
										<div class="alert alert-danger" role="alert">
											<h4 class="text-center">
												<strong>No hay stock disponible</strong>
											</h4>
										</div>
									</c:otherwise>
								</c:choose>



							</div>
							<div class="col-xs-7">
								<h3>Descripcion del producto</h3>
								<p>${producto.descripcion }</p>
								<sec:authorize access="hasRole('ROLE_CLIENTE')">
									<div class="row">
										<div class="col-xs-12 col-sm-9">
											<div class="input-group">
												<span class="input-group-addon">Cantidad</span> <input
													type="number" class="form-control"
													placeholder="Indique la cantidad que desea">
											</div>
										</div>
										<div class="col-xs-12 col-sm-3">
									
											<button type="button" class="btn btn-info">
												<span class="glyphicon glyphicon-shopping-cart"></span>Carrito
											</button>
										</div>
									</div>
								</sec:authorize>
							</div>
						</div>
					</div>

				</div>

			</div>
		</div>
	</div>
	<%@ include file="inc/footer.jsp"%>
	<script src="resources/js/jquery-1.2.11.0.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="resources/js/ferreteria.js"></script>

</body>
</html>