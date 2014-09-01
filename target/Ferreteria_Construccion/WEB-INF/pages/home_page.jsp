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
<title>Home Page</title>
<!-- Estilo Css -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/bootstrap-theme.min.css">

<!-- Javascripts -->
<script src="resources/js/jquery-1.2.11.0.js"></script>
<script src="resources/js/bootstrap.min.js"></script>

<style>
.blue {
	color: #99C7F4;
}
</style>

</head>
<body>

	<div class="container">
		<div class="page-header">
			<h1>
				UnClick <small>.com</small>
			</h1>
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
			<a class="navbar-brand" href="#">inicio</a>
		</div>

		<!-- NAVBAR Derecha CONTACTO/CATEGORIA/BUSQUEDA -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Contacto</a></li>
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
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">
					<span class="glyphicon glyphicon-search"></span>
				</button>
			</form>

			<!-- NAVBAR Izquierda LOGIN/CARRITO -->
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
				<!--<sec:authorize access="isAnonymous()">
					<li><a href="login"><strong>Sing in</strong></a></li>
					<li><a> or </a></li>
					<li><a href="#"><strong>Sing up</strong></a></li>


				</sec:authorize>-->
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>



	<div class="container">

		<sec:authorize access="isAnonymous()">
			<div class="jumbotron">
				<h1>Vamos de compras,</h1>
				<p>Consiga todo lo que necesita para la construccion o las
					labores cotidianas e indispensables del hogas desde nuestro e-shop,
					si ya dispone de una cuenta ingrese desde Sing in, sino creese una
					facilmente desde Sign up!</p>
				<div class="form-group">
					<div class="col-md-8">
						<a href="login" class="btn btn-success">Sign in</a>
						<button id="button2id" name="button2id" class="btn btn-primary">Sign
							up</button>
					</div>
				</div>
			</div>
		</sec:authorize>

		<h2>Articulos destacados:</h2>

		<div class="row">


			<c:forEach items="${productos }" var="producto">
				<div class="col-xs-3">

					<a href="#" class="thumbnail"> <img src="${producto.urlImage}"
						alt="125x125">

					</a>
					<div class="caption">
						<h3>${producto.nombre }</h3>
						<p>${producto.descripcion}</p>
						<p>
							<a href="#" class="btn btn-primary" role="button">Detalle</a>
							<sec:authorize access="hasRole('ROLE_CLIENTE')">
								<a href="#" class="btn btn-default" role="button"><span
									class="glyphicon glyphicon-shopping-cart"></span></a>
							</sec:authorize>
						</p>
					</div>

				</div>

			</c:forEach>

		</div>
	</div>

	<ul class="pager">
		<li class="disabled"><a href="#">Previous</a></li>
		<li><a href="#">Next</a></li>
	</ul>

</body>
</html>