<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<!-- Home Usuario - Admin -->
<!-- author : Marco, Acuna -->
<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Usuarios | admin</title>
<link rel="shortcut icon" href="../resources/img/icono_oneclick.png"
	type="image/png" />
<!-- Estilos CSS -->
<link rel="stylesheet"
	href="../../resources/css/admin-bootstrap.min.css">
<link rel="stylesheet"
	href="../../resources/css/admin-bootstrap-theme.min.css">
<link rel="stylesheet" href="../../resources/css/dashboard.css">
<link href="../../resources/css/font-awesome.css" rel="stylesheet"
	type="text/css">

</head>
<body>
	<c:url var="firstUrl" value="/secure/usuario_home/1" />
	<c:url var="lastUrl" value="/secure/usuario_home/${page.totalPages}" />
	<c:url var="prevUrl" value="/secure/usuario_home/${currentIndex - 1}" />
	<c:url var="nextUrl" value="/secure/usuario_home/${currentIndex + 1}" />

	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"> Administracion</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<!--  <li><a href="#">Dashboard</a></li>
					<li><a href="#">Settings</a></li>
					<li><a href="#">Profile</a></li>-->
					<li><a
						href="/Ferreteria_Construccion/j_spring_security_logout">Logout</a></li>
				</ul>
				<!-- <form class="navbar-form navbar-right">
					<input type="text" class="form-control" placeholder="Search...">
				</form> -->
			</div>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><div class="thumbnail">
							<img width="150" src="../../resources/img/OneClick.png"
								alt="oneClick">
						</div></li>
					<li><a href="/Ferreteria_Construccion/secure/home_page">Principal</a></li>
					<li class="active"><a
						href="/Ferreteria_Construccion/secure/usuario_home/1">Usuarios</a></li>
					<li><a href="/Ferreteria_Construccion/secure/producto_home/1">Productos</a></li>
					<!-- <li><a href="#">Pedidos</a></li>
				</ul>

				<ul class="nav nav-sidebar">
					<li><a href="">Reportes</a></li> -->
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h3 class="page-header">Usuarios</h3>

				<div class="row">
					<div class="col-lg-6">
						<!-- <div class="input-group">
							<input type="text" class="form-control"> <span
								class="input-group-btn">
								<button class="btn btn-default" type="button">Buscar</button>
							</span>
						</div> -->
					</div>
					<div class="col-lg-6">
						<a href="/Ferreteria_Construccion/secure/admin_save_usuario"
							class="btn btn-default">Nuevo</a>
					</div>
				</div>
				<h1 class="sub-header"></h1>

				<h3 class="sub-header">Lista de Usuarios</h3>



				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>#</th>
								<th>Email</th>
								<th>Nombre</th>
								<th>Apellido</th>
								<th>Activo</th>
								<th>Accion</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${usuarios }" var="usuario">
								<!-- Popup de confirmacion - Boostrap modal -->
								<div class="modal face" id="confirmacion${usuario.username }"
									tabindex="-1" role="dialog" aria-labelledby="modal"
									aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h4 class="model-title">Eliminar usuario</h4>
											</div>
											<div class="modal-body">
												<p>Realmente desea eliminar el usuario:
													${usuario.username } seleccionado?</p>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">No</button>
												<a class="btn btn-primary"
													href="/Ferreteria_Construccion/secure/delete_usuario/${usuario.username}">Si</a>
											</div>
										</div>
									</div>

								</div>
								<!-- Fin del popup -->
								<tr>
									<td></td>
									<td>${usuario.username }</td>
									<td>${usuario.nombre }</td>
									<td>${usuario.apellido }</td>
									<td>${usuario.enable }</td>
									<td><a href="" class="btn btn-default"><span
											class="icon-pencil"></span></a>
										<button data-toggle="modal"
											data-target="#confirmacion${usuario.username }"
											class="btn btn-default">
											<span class="icon-remove"></span>
										</button></td>
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
							<c:url var="pageUrl" value="/secure/usuario_home/${i}" />
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
					<!-- Fin de paginacion -->
				</div>
			</div>
		</div>
	</div>
	<!-- Javascripts -->
	<script src="../../resources/js/jquery-1.2.11.0.js"></script>
	<script src="../../resources/js/bootstrap.min.js"></script>
</body>
</html>