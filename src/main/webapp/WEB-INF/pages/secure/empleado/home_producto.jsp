<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OneClick | Productos</title>
<!-- Estilos CSS -->
<link rel="stylesheet" href="../../resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="../../resources/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="../../resources/css/dashboard.css">

<!-- Javascripts -->
<script src="../../resources/js/jquery-1.2.11.0.js"></script>
<script src="../../resources/js/bootstrap.min.js"></script>
</head>
<body>

	<c:url var="firstUrl" value="/secure/producto_home/1" />
	<c:url var="lastUrl" value="/secure/producto_home/${page.totalPages}" />
	<c:url var="prevUrl" value="/secure/producto_home/${currentIndex - 1}" />
	<c:url var="nextUrl" value="/secure/producto_home/${currentIndex + 1}" />

	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">OC Administracion</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">Dashboard</a></li>
					<li><a href="#">Settings</a></li>
					<li><a href="#">Profile</a></li>
					<li><a
						href="/Ferreteria_Construccion/j_spring_security_logout">Logout</a></li>
				</ul>
				<form class="navbar-form navbar-right">
					<input type="text" class="form-control" placeholder="Search...">
				</form>
			</div>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="/Ferreteria_Construccion/secure/home_page">Principal</a></li>
					<li><a href="#">Usuarios</a></li>
					<li class="active"><a href="#">Productos</a></li>
					<li><a href="#">Pedidos</a></li>
				</ul>

				<ul class="nav nav-sidebar">
					<li><a href="">Reportes</a></li>
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">Metricas</h1>

				<!-- <div class="row placeholders">
					<div class="col-xs-6 col-sm-3 placeholder">
						<img data-src="holder.js/200x200/auto/sky" class="img-responsive"
							alt="Generic placeholder thumbnail">
						<h4>Pedidos</h4>
						<span class="text-muted">Cantidad de pedidos</span>
					</div>
					<div class="col-xs-6 col-sm-3 placeholder">
						<img data-src="holder.js/200x200/auto/vine" class="img-responsive"
							alt="Generic placeholder thumbnail">
						<h4>Cuentas</h4>
						<span class="text-muted">Numero de cuentas creadas</span>
					</div>
					<div class="col-xs-6 col-sm-3 placeholder">
						<img data-src="holder.js/200x200/auto/sky" class="img-responsive"
							alt="Generic placeholder thumbnail">
						<h4>Productos</h4>
						<span class="text-muted">Listado de productos con
							stock/activos</span>
					</div>
					<div class="col-xs-6 col-sm-3 placeholder">
						<img data-src="holder.js/200x200/auto/vine" class="img-responsive"
							alt="Generic placeholder thumbnail">
						<h4>Productos sin stock</h4>
						<span class="text-muted">Something else</span>
					</div>
				</div> -->

				<a href="" class="btn btn-default">Nuevo</a>

				<h2 class="sub-header">Lista de productos</h2>



				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>#</th>
								<th>Nombre</th>
								<th>Precio Compra</th>
								<th>Precio Venta</th>
								<th>Accion</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${productos }" var="producto">
								<tr>
									<td>${producto.codigo }</td>
									<td>${producto.nombre }</td>
									<td>${producto.precioCompra }</td>
									<td>${producto.precio }</td>
									<td><a href="" class="btn btn-default"><span
											class="glyphicon glyphicon-pencil"></span></a> <a href="/Ferreteria_Construccion/secure/delete_producto/${producto.codigo}"
										class="btn btn-default"><span
											class="glyphicon glyphicon-remove"></span></a></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>

					<!-- Paginacion -->
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
							<c:url var="pageUrl" value="/secure/producto_home/${i}" />
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
		</div>
	</div>

</body>
</html>