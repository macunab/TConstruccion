<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<!-- Alta Usuario - Admin -->
<!-- author : Marco, Acuna -->
<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Alta Usuario | admin</title>
<link rel="stylesheet" href="../resources/css/admin-bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="../resources/css/admin-bootstrap-theme.min.css">
<link rel="stylesheet" href="../resources/css/dashboard.css">

<!-- Latest compiled and minified JavaScript -->
<script src="../resources/js/jquery-1.2.11.0.js"></script>
<script src="../resources/js/bootstrap.min.js"></script>
</head>
<body>
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
					<li><a href="#">Dashboard</a></li>
					<li><a href="#">Settings</a></li>
					<li><a href="#">Profile</a></li>
					<li><a
						href="/Ferreteria_Construccion/j_spring_security_logout">Logout</a></li>
				</ul>

			</div>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><div class="thumbnail">
							<img width="150" src="../resources/img/OneClick.png"
								alt="oneClick">
						</div></li>
					<li><a href="/Ferreteria_Construccion/secure/home_page">Principal</a></li>
					<li class="active"><a
						href="/Ferreteria_Construccion/secure/usuario_home/1">Usuarios</a>
					</li>
					<li><a href="/Ferreteria_Construccion/secure/producto_home/1">Productos</a></li>
					<li><a href="#">Pedidos</a></li>
				</ul>

				<ul class="nav nav-sidebar">
					<li><a href="">Reportes</a></li>
				</ul>
			</div>

			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">Nuevo Usuario</h1>

				<form:form id="add-user-form" class="form-horizontal"
					action="admin_save_usuario" method="POST" modelAttribute="usuario"
					enctype="multipart/form-data">

					<!-- INPUT USERNAME -->
					<div class="control-group" id="usernameControlGroup">
						<label class="control-label" for="username"> Email <sup>*</sup>
						</label>
						<div class="controls">
							<input type="text" id="username" name="username"
								placeholder="Email"> <span class="help-inline"><form:errors
									path="username" /></span>
						</div>
					</div>

					<!-- INPUT NOMBRE -->
					<div class="control-group" id="nombreControlGroup">
						<label class="control-label" for="nombre"> Nombre </label>
						<div class="controls">
							<input type="text" id="nombre" name="nombre" placeholder="Nombre">
							<span class="help-inline"><form:errors path="nombre" /></span>
						</div>
					</div>

					<!-- INPUT APELLIDO -->
					<div class="control-group" id="apellidoControlGroup">
						<label class="control-label" for="apellido"> Apellido </label>
						<div class="controls">
							<input type="text" id="apellido" name="apellido"
								placeholder="Apellido"> <span class="help-inline"><form:errors
									path="apellido" /></span>
						</div>
					</div>

					<!-- INPUT DIRECCION -->
					<div class="control-group" id="direccionControlGroup">
						<label class="control-label" for="direccion"> Direccion </label>
						<div class="controls">
							<input type="text" id="direccion" name="direccion"
								placeholder="Direccion"> <span class="help-inline"><form:errors
									path="domicilio" /></span>
						</div>
					</div>

					<!-- SELECT TIPO CUENTA -->
					<div class="control-group" id="cuentaControlGroup">
						<label class="control-label" for="cuenta"> Cuenta </label>
						<div class="controls">
							<select id="cuenta" name="cuentas">
								<option value="1">ADMINISTRADOR</option>
								<option value="2">CLIENTE</option>
							</select>
						</div>
					</div>

					<!-- INPUT PASSWORD -->
					<div class="control-group" id="passwordControlGroup">
						<label class="control-label" for="password"> Password <sup>*</sup>
						</label>
						<div class="controls">
							<input type="text" id="password" name="password"
								placeholder="Password"> <span class="help-inline"><form:errors
									path="password" /></span>
						</div>
					</div>

					<div class="control-group" id="passwordRepeatControlGroup">
						<label class="control-label" for="passwordRepeat">Repetir
							Password <sup>*</sup>
						</label>
						<div class="controls">
							<input type="text" id="passwordRepeat" name="passwordRepeat"
								placeholder="Password"> <span class="help-inline"><form:errors /></span>
						</div>
					</div>

					<input class="btn " type="submit" value="Guardar" />


				</form:form>
			</div>
		</div>
	</div>

	<script TYPE="text/javascript">
		function collectFormData(fields) {
			var data = {};
			for (var i = 0; i < fields.length; i++) {
				var $item = $(fields[i]);
				data[$item.attr('name')] = $item.val();
			}
			return data;
		}

		$(document)
				.ready(
						function() {
							var $form = $('#add-user-form');
							$form
									.bind(
											'submit',
											function(e) {
												// Ajax validation
												var $inputs = $form
														.find('input');
												var data = collectFormData($inputs);

												$
														.post(
																'admin_save_usuario',
																data,
																function(
																		response) {
																	$form
																			.find(
																					'.control-group')
																			.removeClass(
																					'error');
																	$form
																			.find(
																					'.help-inline')
																			.empty();
																	$form
																			.find(
																					'.alert')
																			.remove();

																	if (response.status == 'FAIL') {
																		for (var i = 0; i < response.errorMessageList.length; i++) {
																			var item = response.errorMessageList[i];
																			var $controlGroup = $('#'
																					+ item.fieldName
																					+ 'ControlGroup');

																			if (item.message == " null") {

																				$controlGroup
																						.addClass('error');
																				$controlGroup
																						.find(
																								'.help-inline')
																						.html(
																								'Ya existe un usuario con el mismo mail');
																			} else {
																				$controlGroup
																						.addClass('error');
																				$controlGroup
																						.find(
																								'.help-inline')
																						.html(
																								item.message);
																			}

																		}
																	} else {

																		var $alert = $('<div class="alert"></div>');
																		$alert
																				.html(response.result);
																		$alert
																				.prependTo($form
																						.find('fieldset'));
																	}
																}, 'json');

												e.preventDefault();
												return false;
											});
						});
	</script>
</body>
</html>