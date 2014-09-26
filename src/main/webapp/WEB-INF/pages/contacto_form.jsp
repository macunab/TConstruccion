<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="resources/img/icono_oneclick.png"
	type="image/png" />
<title>OneClick | Contacto</title>
<!-- Estilo Css -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/bootstrap-theme.min.css">

<!-- Javascripts -->
<script src="resources/js/jquery-1.2.11.0.js"></script>
<script src="resources/js/bootstrap.min.js"></script>

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
			<a class="navbar-brand" href="1">inicio</a>
		</div>

		<!-- NAVBAR Derecha CONTACTO/CATEGORIA/BUSQUEDA -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<!-- class="active" en los li los deja marcados -->
				<!-- ****************************************** -->
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

			<!-- NAVBAR Izquierda LOGIN/CARRITO -->
			<ul class="nav navbar-nav navbar-right">
				<sec:authorize access="hasRole('ROLE_CLIENTE')">
					<li><a
						href="get_carrito?username=<%=SecurityContextHolder.getContext()
						.getAuthentication().getName()%>"><span
							class="glyphicon glyphicon-shopping-cart blue"></span> <span>
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
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>

	<!-- CONTENIDO PRINCIPAL -->
	<div id="main-container" class="container">
		<!-- INICIO DEL FORMULARIO -->
		<form:form class="form-horizontal" action="contacto" method="post"
			modelAttribute="mensaje">
			<fieldset>

				<!-- Form Name -->
				<legend>Contacto</legend>

				<!-- NOMBRE - Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="nombre">Nombre</label>
					<div class="col-md-5">
						<form:input id="nombre" name="nombre" placeholder="tu nombre"
							class="form-control input-md" path="nombre" type="text"/>
						<span class="help-block">ingresa tu nombre.</span>
					</div>
				</div>

				<!-- EMAIL - Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="email">Email</label>
					<div class="col-md-5">
						<form:input id="email" name="email" placeholder="tu email"
							class="form-control input-md" path="email" type="text"/>
						<span class="help-block">ingresa un email a donde dirigir
							la respuesta.</span>
					</div>
				</div>

				<!-- MENSAJE - Textarea -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="mensaje">Mensaje</label>
					<div class="col-md-4">
						<form:textarea path="mensaje" class="form-control" id="mensaje"
							name="mensaje" cols="100" rows="10"/>
					</div>
				</div>

				<!-- ENVIAR - Button -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="enviar"></label>
					<div class="col-md-4">
						<button id="enviar" name="enviar" class="btn btn-primary">Enviar</button>
					</div>
				</div>

			</fieldset>
		</form:form>
		<!-- FIN DEL FORMULARIO -->
	</div>
</body>
</html>