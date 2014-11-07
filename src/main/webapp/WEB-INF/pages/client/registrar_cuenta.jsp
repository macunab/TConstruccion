<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>OneClicl | Nueva Cuenta</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
<link
	href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,300,400,600,700'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="resources/css/custom-style.css">
</head>
<body>
	<%@ include file="../client/inc/header.jsp"%>


	<div class="container">

		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<strong>Registro de cuenta nueva</strong>
				</h3>
			</div>
			<div class="panel-body">

				<div class="row">

					<div class="col-xs-12 col-sm-6">
						<form class="form-horizontal">
							<fieldset>

								<!-- INPUT NOMBRE-->
								<div class="form-group">
									<label class="col-md-4 control-label" for="nombre">Nombre</label>
									<div class="col-md-6">
										<div class="input-group">
											<span class="input-group-addon"> <span
												class="glyphicon glyphicon-pencil"></span>
											</span> <input type="text" class="form-control" placeholder="Nombre" />

										</div>

									</div>
								</div>

								<!-- INPUT APELLIDO-->
								<div class="form-group">
									<label class="col-md-4 control-label" for="apellido">Apellido</label>
									<div class="col-md-6">
										<div class="input-group">
											<span class="input-group-addon"> <span
												class="glyphicon glyphicon-pencil"></span>
											</span> <input type="text" class="form-control"
												placeholder="Apellido" />

										</div>

									</div>
								</div>

								<!-- INPUT EMAIL-->
								<div class="form-group">
									<label class="col-md-4 control-label" for="email">Email</label>
									<div class="col-md-6">
										<div class="input-group">
											<span class="input-group-addon"> @ </span> <input type="text"
												class="form-control" placeholder="Email" />

										</div>

									</div>
								</div>

								<!-- Password input-->
								<div class="form-group">
									<label class="col-md-4 control-label" for="password">Password</label>
									<div class="col-md-6">
										<div class="input-group">
											<span class="input-group-addon"> <span
												class="glyphicon glyphicon-asterisk"></span>
											</span> <input type="password" class="form-control"
												placeholder="Password" />

										</div>

									</div>
								</div>

								<!-- INGRESAR AL SISTEMA -->
								<div class="form-group">
									<label class="col-md-4 control-label" for="registrarse"></label>
									<div class="col-md-4">
										<button type="submit" id="registrarse" name="registrarse"
											class="btn btn-inverse">Registrarse</button>
									</div>
								</div>

							</fieldset>
						</form>

					</div>

					<div class="col-xs-0 col-sm-6 hidden-xs">

						<h3>Bienvenido a OneClick.com</h3>
						<p>Esta a un solo paso de empezar a disfrutar de todos los
							beneficios que ofrece OneClick.com, simplemente introduciendo los
							datos del formulario de la izquierda y validando la cuenta por
							medio de su mail, podra empezar a realizar compras sin limites!</p>

					</div>
				</div>


			</div>
		</div>
	</div>


	<%@ include file="../client/inc/footer.jsp"%>
	<script src="resources/js/jquery-1.2.11.0.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</body>
</html>