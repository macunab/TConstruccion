<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home Page</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="resources/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="resources/js/jquery-1.2.11.0.js"></script>
<script src="resources/js/bootstrap.min.js"></script>

</head>
<body>
	<!-- <a href="save_usuario">Sign up</a>
<a href="secure/empleado">Secure</a>
<h1>Home page</h1>
<p>-------------------------------------------------</p>
<c:forEach items="${productos }" var="producto">
<p>${producto.nombre }</p>
</c:forEach> -->

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

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Contacto</a></li>
				<li><a href="#">Link</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Categorias <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li><a href="#">Separated link</a></li>
						<li class="divider"></li>
						<li><a href="#">One more separated link</a></li>
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
			<ul class="nav navbar-nav navbar-right">
			<sec:authorize access="hasRole('ROLE_CLIENTE')">
				<li><a href="#"><span
						class="glyphicon glyphicon-shopping-cart"></span> <span
						class="badge pull-right">0</span></a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Bienvenido, <strong><%=SecurityContextHolder.getContext().getAuthentication()
					.getName()%></strong> <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">Mis Pedidos</a></li>
						<li><a href="#">Perfil</a></li>
						<li><a href="#">Change password</a></li>
						<li class="divider"></li>
						<li><a href="j_spring_security_logout">Logout</a></li>
					</ul></li>
					</sec:authorize>
						<sec:authorize access="isAnonymous()">
					<li ><a href="login"><strong>Sing in</strong></a></li>
					<li ><a > or </a></li>
					<li ><a href="#"><strong>Sing up</strong></a></li>
				
					
					</sec:authorize>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>

	<div class="container">

		<h2>Articulos destacados:</h2>

		<div class="row">

			<div class="col-xs-3">

				<a href="#" class="thumbnail"> <img src="herramienta1.jpg"
					alt="125x125">

				</a>
				<div class="caption">
					<h3>Thumbnail label</h3>
					<p>... Cras sit amet nibh libero, in gravida nulla. Nulla vel
						metus scelerisque ante sollicitudin commodo. Cras purus odio,
						vestibulum in vulputate at, tempus viverra turpis. Fusce
						condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue
						felis in faucibus.</p>
					<p>
						<a href="#" class="btn btn-primary" role="button">Button</a> <a
							href="#" class="btn btn-default" role="button">Button</a>
					</p>
				</div>

			</div>
			<div class="col-xs-3">

				<a href="#" class="thumbnail"> <img src="herramienta2.png"
					alt="125x125">

				</a>
				<div class="caption">
					<h3>Thumbnail label</h3>
					<p>... Cras sit amet nibh libero, in gravida nulla. Nulla vel
						metus scelerisque ante sollicitudin commodo. Cras purus odio,
						vestibulum in vulputate at, tempus viverra turpis. Fusce
						condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue
						felis in faucibus.</p>
					<p>
						<a href="#" class="btn btn-primary" role="button">Button</a> <a
							href="#" class="btn btn-default" role="button">Button</a>
					</p>
				</div>

			</div>

			<div class="col-xs-3">

				<a href="#" class="thumbnail"> <img src="herramienta1sa.jpg"
					alt="125x125">

				</a>
				<div class="caption">
					<h3>Thumbnail label</h3>
					<p>... Cras sit amet nibh libero, in gravida nulla. Nulla vel
						metus scelerisque ante sollicitudin commodo. Cras purus odio,
						vestibulum in vulputate at, tempus viverra turpis. Fusce
						condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue
						felis in faucibus.</p>
					<p>
						<a href="#" class="btn btn-primary" role="button">Button</a> <a
							href="#" class="btn btn-default" role="button">Button</a>
					</p>
				</div>

			</div>
			<div class="col-xs-3">

				<a href="#" class="thumbnail"> <img src="herramienta2.png"
					alt="125x125">

				</a>
				<div class="caption">
					<h3>Thumbnail label</h3>
					<p>... Cras sit amet nibh libero, in gravida nulla. Nulla vel
						metus scelerisque ante sollicitudin commodo. Cras purus odio,
						vestibulum in vulputate at, tempus viverra turpis. Fusce
						condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue
						felis in faucibus.</p>
					<p>
						<a href="#" class="btn btn-primary" role="button">Button</a> <a
							href="#" class="btn btn-default" role="button">Button</a>
					</p>
				</div>

			</div>

			<div class="col-xs-3">

				<a href="#" class="thumbnail"> <img src="herramienta5.jpg"
					alt="125x125">

				</a>
				<div class="caption">
					<h3>Thumbnail label</h3>
					<p>... Cras sit amet nibh libero, in gravida nulla. Nulla vel
						metus scelerisque ante sollicitudin commodo. Cras purus odio,
						vestibulum in vulputate at, tempus viverra turpis. Fusce
						condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue
						felis in faucibus.</p>
					<p>
						<a href="#" class="btn btn-primary" role="button">Button</a> <a
							href="#" class="btn btn-default" role="button">Button</a>
					</p>
				</div>

			</div>
			<div class="col-xs-3">

				<a href="#" class="thumbnail"> <img src="herramienta2.png"
					alt="125x125">

				</a>
				<div class="caption">
					<h3>Thumbnail label</h3>
					<p>... Cras sit amet nibh libero, in gravida nulla. Nulla vel
						metus scelerisque ante sollicitudin commodo. Cras purus odio,
						vestibulum in vulputate at, tempus viverra turpis. Fusce
						condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue
						felis in faucibus.</p>
					<p>
						<a href="#" class="btn btn-primary" role="button">Button</a> <a
							href="#" class="btn btn-default" role="button">Button</a>
					</p>
				</div>

			</div>

			<div class="col-xs-3">

				<a href="#" class="thumbnail"> <img src="herramienta1.jpg"
					alt="125x125">

				</a>
				<div class="caption">
					<h3>Thumbnail label</h3>
					<p>... Cras sit amet nibh libero, in gravida nulla. Nulla vel
						metus scelerisque ante sollicitudin commodo. Cras purus odio,
						vestibulum in vulputate at, tempus viverra turpis. Fusce
						condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue
						felis in faucibus.</p>
					<p>
						<a href="#" class="btn btn-primary" role="button">Button</a> <a
							href="#" class="btn btn-default" role="button">Button</a>
					</p>
				</div>

			</div>
			<div class="col-xs-3">

				<a href="#" class="thumbnail"> <img src="herramienta2.png"
					alt="125x125">

				</a>
				<div class="caption">
					<h3>Thumbnail label</h3>
					<p>... Cras sit amet nibh libero, in gravida nulla. Nulla vel
						metus scelerisque ante sollicitudin commodo. Cras purus odio,
						vestibulum in vulputate at, tempus viverra turpis. Fusce
						condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue
						felis in faucibus.</p>
					<p>
						<a href="#" class="btn btn-primary" role="button">Button</a> <a
							href="#" class="btn btn-default" role="button">Button</a>
					</p>
				</div>

			</div>
		</div>
	</div>

	<ul class="pager">
		<li class="disabled"><a href="#">Previous</a></li>
		<li><a href="#">Next</a></li>
	</ul>

</body>
</html>