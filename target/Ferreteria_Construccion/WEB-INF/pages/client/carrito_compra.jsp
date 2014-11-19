<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>OneClick | Carrito</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
<link
	href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,300,400,600,700'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="resources/css/custom-style.css">
</head>
<body>
	<%@ include file="inc/header.jsp"%>

	<div id="main-body">
		<div class="container">

			<div class="row">


				<div class="col-xs-0 col-sm-3">
					<%@ include file="inc/sidebar.jsp"%>
				</div>

				<div class="col-xs-12 col-sm-9">
					<ol class="breadcrumb">
						<li><a href="1">Home</a></li>
						<li class="active">Carrito</li>
					</ol>

					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<strong>Carrito de compras</strong>
							</h3>
						</div>
						<div class="panel-body">
							<h3>
								Carrito [ <small>${fn:length(productos)} Articulo(s) </small>]
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
											class="modal fade">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-hidden="true">&times;</button>
														<h4 class="modal-title">Confirmar eliminacion</h4>
													</div>
													<div class="modal-body">
														<p>Realmente desea eliminar de su carrito el articulo
															${producto.producto.nombre }?</p>
														<p class="text-warning">
															<small></small>
														</p>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-default"
															data-dismiss="modal">No</button>
														<button type="button" class="btn btn-primary">Si</button>
													</div>
												</div>
											</div>
										</div>


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
													<span class="glyphicon glyphicon-remove"></span>
												</button></td>
											<td>$${producto.subTotal }</td>
										</tr>
									</c:forEach>

									<tr>
										<td colspan="6" style="text-align: right"><strong>TOTAL
												( <c:forEach items="${productos }" var="producto">
											${producto.subTotal } +
											</c:forEach> 0) =
										</strong></td>
										<td class="label label-success" style="display: block"><strong>
												$${total } </strong></td>
									</tr>
								</tbody>
							</table>

							<a href="1" class="btn btn-large"><i
								class="glyphicon glyphicon-arrow-left"></i> Continuar Comprando
							</a>

							<c:choose>
								<c:when test="${fn:length(productos) < 1}">

								</c:when>
								<c:otherwise>
									<a href="alta_pedido" class="btn btn-large pull-right">Siguiente
										<i class="glyphicon glyphicon-arrow-right"></i>
									</a>
								</c:otherwise>
							</c:choose>
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