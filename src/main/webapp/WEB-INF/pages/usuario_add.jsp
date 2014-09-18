<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OneClick | Alta usuario</title>
<link rel="shortcut icon" href="resources/img/icono_oneclick.png"
	type="image/png" />
<link rel="stylesheet" href="resources/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="resources/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="resources/js/jquery-1.2.11.0.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
</head>
<body>

	<script type="text/javascript">
		$(document).ready(function() {

			$("#repassword").keyup(function(e) {
				var pass = $("#password").val();
				var repass = $("#repassword").val();

				console.log("Post pass: '" + pass + "'");

				console.log("Post repass: '" + repass + "'");

				if (pass == repass) {
					$("#error").text("");
				} else {
					$("#error").text("No coincide con la contraseña");
				}

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
				<!-- class="active" en los li los deja marcados -->
				<!-- ****************************************** -->
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
				<sec:authorize access="isAnonymous()">
					<li><a href="login"><strong>Ingresar</strong></a></li>
				</sec:authorize>

			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>

	<div id="main-container" class="container">
		<form:form class="form-horizontal" action="save_usuario" method="post"
			modelAttribute="usuario">
			<fieldset>

				<!-- Form Name -->
				<legend>Registro de Usuario</legend>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="textinput">Nombre</label>
					<div class="col-md-4">
						<form:input id="textinput" path="nombre" name="textinput"
							placeholder="Nombre" class="form-control input-md" type="text" />
						<span class="help-block">Ingrese su nombre</span>
					</div>
					<form:errors path="nombre" class="label label-danger" />
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="textinput">Apellido</label>
					<div class="col-md-4">
						<form:input id="textinput" path="apellido" name="textinput"
							placeholder="Apellido" class="form-control input-md" type="text" />
						<span class="help-block">Ingrese su apellido</span>
					</div>
					<form:errors path="apellido" class="label label-danger" />
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="textinput">Domicilio</label>
					<div class="col-md-4">
						<form:input id="textinput" path="domicilio" name="textinput"
							placeholder="Domicilio" class="form-control input-md" type="text" />
						<span class="help-block">Ingrese su domicilio</span>
					</div>
					<form:errors path="domicilio" class="label label-danger" />
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="textinput">E-mail</label>
					<div class="col-md-4">
						<form:input id="textinput" path="email" name="textinput"
							placeholder="E-Mail" class="form-control input-md" type="text" />
						<span class="help-block">Ingrese un email valido</span>
					</div>
					<form:errors path="email" class="label label-danger" />
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="textinput">Username</label>
					<div class="col-md-4">
						<form:input id="textinput" path="username" name="textinput"
							placeholder="Nombre de Usuario" class="form-control input-md"
							type="text" />
						<span class="help-block">Ingrese un nombre de usuario</span>
					</div>
					<form:errors path="username" class="label label-danger" />
				</div>

				<!-- Password input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="passwordinput">Password</label>
					<div class="col-md-4">
						<form:input id="password" path="password" name="passwordinput"
							placeholder="placeholder" class="form-control input-md"
							type="password" />
						<span class="help-block">Ingrese la contraseña</span>
					</div>
					<form:errors path="password" class="label label-danger" />
				</div>

				<!-- Password input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="passwordinput">Re
						Password</label>
					<div class="col-md-4">
						<input id="repassword" name="passwordinput"
							placeholder="placeholder" class="form-control input-md"
							type="password" /> <span class="help-block">Vuelva a ingresar la contraseña</span>
					</div>
					<label id="error" class="label label-danger"></label>
				</div>

				<!-- Button (Double) -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="button1id"></label>
					<div class="col-md-8">
						<input type="submit" id="button1id" name="button1id"
							class="btn btn-success" value="Guardar"/>
						<button id="button2id" name="button2id" class="btn btn-danger">Cancelar</button>
					</div>
				</div>

			</fieldset>
		</form:form>

	</div>



</body>
</html>